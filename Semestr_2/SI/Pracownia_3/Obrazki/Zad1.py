import random
import copy
import string


def oblicz(ust, bloki, linia):
    
    wynik = 0
    pom = [0 for i in range(len(linia))]
    for i in range(len(bloki)):
        for j in range(bloki[i]):
            pom[ust[i]+j]=1
    for i in range(len(pom)):
        if linia[i]!=pom[i]:
            wynik+=1
    return wynik

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


def zmien_wiersz(i,tablica,wiersze):
    n = len(wiersze[i])
    bloki = wiersze[i]
    ust = []
    zliczanie = [0 for i in range(len(tablica[i]))]
    x =  wyznacz(ust, bloki, 0, n, tablica[i], 0, zliczanie)
    zmienione = []
    if x>0:
        for j in range(len(tablica[i])):
            if zliczanie[j]==x and tablica[i][j]==-1:
                zmienione.append(j)
                tablica[i][j]=1
            elif zliczanie[j]==0 and tablica[i][j]==-1:
                zmienione.append(j)
                tablica[i][j]=0

    return zmienione

def zmien_kolumne(j,tablica,kolumny):
    n = len(kolumny[j])
    bloki = kolumny[j]
    ust = []
    zliczanie = [0 for i in range(len(tablica))]

    kolumna = []
    for i in range(len(tablica)):
        kolumna.append(tablica[i][j])
    x = wyznacz(ust, bloki, 0, n, kolumna, 0, zliczanie)
    zmienione = []
    if x>0:
        for i in range(len(tablica)):
            if zliczanie[i]==x and tablica[i][j]==-1:
                zmienione.append(i)
                tablica[i][j]=1
            elif zliczanie[i]==0 and tablica[i][j]==-1:
                zmienione.append(i)
                tablica[i][j]=0
    return zmienione

    


def gotowe(tablica):
    wys = len(tablica)
    szer = len(tablica[0])
    for i in range(wys):
        for j in range(szer):
            if tablica[i][j]==-1:
                return False
    return True
    



f = open("zad_input.txt")
wk = f.readline().split()
wys = int(wk[0])
szer = int(wk[1])

#print(wys, szer)

w = []
k = []
for i in range(wys):
    w.append(f.readline().split())

#print(w)

wiersze = []

for i in range(len(w)):
    wiersze.append(0)
    wiersze[i] = []
    for j in range(len(w[i])):
        wiersze[i].append(0)
        wiersze[i][j]=int(copy.deepcopy(w[i][j]))

#print(wiersze)



for i in range(szer):
    k.append(f.readline().split())

kolumny = []

for i in range(len(k)):
    kolumny.append(0)
    kolumny[i] = []
    for j in range(len(k[i])):
        kolumny[i].append(0)
        kolumny[i][j]=int(copy.deepcopy(k[i][j]))

#print(kolumny)



tablica = [0 for i in range(wys)]

for i in range(wys):
    tablica[i] = [-1 for j in range(szer)]


stan = []

stan = [0 for i in range(wys)]

for i in range(wys):
    stan[i] = [-1 for j in range(szer)]

#print(wiersze)
#print(kolumny)



nr =0
nr2=0

wk = int


    

#print(gotowe(tablica, wiersze, kolumny))

wyjscie = open("zad_output.txt", "w")

wierszy = len(tablica)
kolumn = len(tablica[0])


zm_wiersze = [True for i in range(wierszy)]

zm_kolumny = [True for i in range(kolumn)]


while gotowe(tablica)==False:
    for i in range(wierszy):
        if zm_wiersze[i]==True:
            zmiana = zmien_wiersz(i,tablica,wiersze)
            for k in zmiana:
                zm_kolumny[k] = True
    for i in range(kolumn):
        if zm_kolumny[i]==True:
            zmiana = zmien_kolumne(i,tablica,kolumny)
            for k in zmiana:
                zm_wiersze[k] = True

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

#zmien_wiersz(3,tablica,wiersze)