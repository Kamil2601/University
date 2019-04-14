import copy

wiersze = []
kolumny = []
tablica = []
kombinacje_wiersza = []
kombinacje_kolumny = []
ustawione_wiersze = []
ustawione_kolumny = []
wys = 0
szer = 0

def koloruj_wiersz(tablica,ust,bloki,i):
    for j in range(len(tablica[i])):
        tablica[i][j]=0
    for j in range(len(ust)):
        for k in range(ust[j],ust[j]+bloki[j]):
            tablica[i][k]=1

def znajdz_min(tab):
    minim = tab[0]
    wynik = 0
    for i in range(len(tab)):
        if tab[i]<minim:
            minim = tab[i]
            wynik = i
    return wynik

def wczytaj():
    f = open("zad_input.txt")
    wk = f.readline().split()
    wys_ = int(wk[0])
    szer_ = int(wk[1])

    w = []
    k = []
    for i in range(wys_):
        w.append(f.readline().split())

    for i in range(len(w)):
        wiersze.append(0)
        wiersze[i] = []
        for j in range(len(w[i])):
            wiersze[i].append(0)
            wiersze[i][j]=int(copy.deepcopy(w[i][j]))

    for i in range(szer_):
        k.append(f.readline().split())

    for i in range(len(k)):
        kolumny.append(0)
        kolumny[i] = []
        for j in range(len(k[i])):
            kolumny[i].append(0)
            kolumny[i][j]=int(copy.deepcopy(k[i][j]))

def wypisz_wynik(tablica):
    wyjscie = open("zad_output.txt", "w")
    for i in range(wys):
        for j in range(szer):
            if tablica[i][j]==-1:
                print("-",end="")
                wyjscie.write(".")
            elif tablica[i][j]==0:
                print(".",end="")
                wyjscie.write(".")
            else:
                print("#",end="")
                wyjscie.write("#")
        print()
        wyjscie.write('\n')

def gotowe():
    for k in ustawione_wiersze:
        if k==False:
            return False
    return True

def sprawdz(ust, bloki, stan_linii):
    indeks = len(ust)-1
    poprz = int
    if len(ust)==1:
        poprz = 0
    else:
        poprz = ust[-2]+bloki[len(ust)-2]
    k1 = ust[-1]
    k2 = ust[-1]+bloki[len(ust)-2]
    dl = bloki[indeks]
    for i in range (poprz,k1):
        if stan_linii[i]==1:
            return False
    for i in range (k1, k1+dl):
        if stan_linii[i]==0:
            return False
    return True

def sprawdz_koniec(k, stan_linii):
    for i in range(k, len(stan_linii)):
        if stan_linii[i]==1:
            return False
    return True

def dolicz(zliczanie, ust, bloki):
    n = len(bloki)
    for i in range(n):
        k = ust[i]
        for j in range(bloki[i]):
            zliczanie[k+j]+=1

def wyznacz2(ust, bloki, i, n, linia, komb, kombinacje):
    if i==0:
        start = 0
    else:
        start = ust[i-1]+bloki[i-1]+1
    ogr = 0
    for j in range(i,n):
        ogr += bloki[j]+1
    koniec = len(linia)-ogr+2

    for j in range(start,koniec):
        ust.append(j)
        if sprawdz(ust, bloki, linia):
            if i < n-1:
                komb=wyznacz2(ust, bloki, i+1,n, linia, komb, kombinacje)
            elif sprawdz_koniec(bloki[-1]+j, linia):
                komb+=1
                kombinacje.append(copy.deepcopy(ust))
        ust.pop()
    return komb

def wyznacz_kombinacje(i,tablica,wiersze):
    n = len(wiersze[i])
    bloki = wiersze[i]
    ust = []
    kombinacje = []
    wyznacz2(ust, bloki, 0, n, tablica[i], 0, kombinacje)
    return kombinacje

def wyznacz(ust, bloki, i, n, linia, komb, zliczanie):
    if i==0:
        start = 0
    else:
        start = ust[i-1]+bloki[i-1]+1
    ogr = 0
    for j in range(i,n):
        ogr += bloki[j]+1
    koniec = len(linia)-ogr+2

    for j in range(start,koniec):
        ust.append(j)
        if sprawdz(ust, bloki, linia):
            if i < n-1:
                komb=wyznacz(ust, bloki, i+1,n, linia, komb, zliczanie)
            elif sprawdz_koniec(bloki[-1]+j, linia):
                komb+=1
                #print(ust)
                dolicz(zliczanie, ust, bloki)
        ust.pop()
    return komb

def brak_opcji(a,b):
    for x in a:
        if x == True:
            return False
    for x in b:
        if x == True:
            return False
    return True

def zmien_wiersz(i,tablica,wiersze, kombinacje_wiersza):
    n = len(wiersze[i])
    bloki = wiersze[i]
    ust = []
    zliczanie = [0 for i in range(len(tablica[i]))]
    x =  wyznacz(ust, bloki, 0, n, tablica[i], 0, zliczanie)
    zmienione = []
    kombinacje_wiersza[i] = x
    if x==0:
        return False
    if x==1:
        ustawione_wiersze[i]=True
    if x>0:
        for j in range(len(tablica[i])):
            if zliczanie[j]==x and tablica[i][j]==-1:
                zmienione.append(j)
                tablica[i][j]=1
            elif zliczanie[j]==0 and tablica[i][j]==-1:
                zmienione.append(j)
                tablica[i][j]=0

    return zmienione

def zmien_kolumne(j,tablica,kolumny, kombinacje_kolumny):
    n = len(kolumny[j])
    bloki = kolumny[j]
    ust = []
    zliczanie = [0 for i in range(len(tablica))]

    kolumna = []
    for i in range(len(tablica)):
        kolumna.append(tablica[i][j])
    x = wyznacz(ust, bloki, 0, n, kolumna, 0, zliczanie)
    zmienione = []
    kombinacje_kolumny[j] = x
    if x==0:
        return False
    if x==1:
        ustawione_kolumny[j]=True
    if x>0:
        for i in range(len(tablica)):
            if zliczanie[i]==x and tablica[i][j]==-1:
                zmienione.append(i)
                tablica[i][j]=1
            elif zliczanie[i]==0 and tablica[i][j]==-1:
                zmienione.append(i)
                tablica[i][j]=0
    return zmienione

def wnioskowanie(tablica, kombinacje_wiersza, kombinacje_kolumny):
    zm_wiersze = [True for i in range(wys)]
    zm_kolumny = [True for i in range(szer)]
    while brak_opcji(zm_wiersze, zm_kolumny)==False:
        for i in range(wys):
            if zm_wiersze[i]==True:
                zmiana = zmien_wiersz(i,tablica,wiersze, kombinacje_wiersza)
                if zmiana==False:
                    return False
                for k in zmiana:
                    zm_kolumny[k] = True
                zm_wiersze[i]=False
        for i in range(szer):
            if zm_kolumny[i]==True:
                zmiana = zmien_kolumne(i,tablica,kolumny, kombinacje_kolumny)
                if zmiana==False:
                    return False
                for k in zmiana:
                    zm_wiersze[k] = True
                zm_kolumny[i] = False
    return True


wczytaj()

#print(tablica)
tablica = [0 for i in range(len(wiersze))]

for i in range(len(wiersze)):
    tablica[i] = [-1 for j in range(len(kolumny))]
    ustawione_wiersze.append(False)
    kombinacje_wiersza.append(-1)

for j in range(len(kolumny)):
    ustawione_kolumny.append(False)
    kombinacje_kolumny.append(-1)

wys = len(tablica)
szer = len(tablica[0])

#backtracking(tablica, 0)
#wypisz_wynik(tablica)
wnioskowanie(tablica,kombinacje_wiersza, kombinacje_kolumny)


stos_tablic = []

stos_kombinacji = []

indeksy = [-1 for i in range(wys)]

stos_tablic.append(copy.deepcopy(tablica))

#print(len(stos_tablic))
#wypisz_wynik(stos_tablic[0])





i = 0

while i<wys:
    indeksy[i]+=1
    tab = copy.deepcopy(stos_tablic[i])
    if wnioskowanie(tab,kombinacje_wiersza, kombinacje_kolumny)==False:
            indeksy[i]=-1
            i-=1
            stos_tablic.pop()
    else:
        if len(stos_kombinacji)<i+1:    
            kombinacje = wyznacz_kombinacje(i,tab,wiersze)
            stos_kombinacji.append(copy.deepcopy(kombinacje))
        if indeksy[i]<len(stos_kombinacji[i]):
            koloruj_wiersz(tab,stos_kombinacji[i][indeksy[i]],wiersze[i],i)
            stos_tablic.append(copy.deepcopy(tab))
            i+=1
        else:
            indeksy[i]=-1
            i-=1
            stos_kombinacji.pop()
            stos_tablic.pop()

wypisz_wynik(stos_tablic[-1])
