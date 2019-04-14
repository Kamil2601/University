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

def wyznacz(ust, bloki, zmiany, minim, i, n, linia):
    if i==0:
        start = 0
    else:
        start = ust[i-1]+bloki[i-1]+1
    ogr = 0
    for j in range(i,n):
        ogr += bloki[j]+1
    koniec = len(linia)-ogr+2

    ile = 0
    for j in range(start,koniec):
        ust.append(j)
        if i < n-1:
            minim = wyznacz(ust, bloki, zmiany, minim, i+1,n, linia)
        else:
            ile = oblicz(ust, bloki, linia)
            if ile<minim:
                minim = ile
        ust.pop()
    return minim


def opt_dist_w(i,tablica,wiersze):
    n = len(wiersze[i])
    bloki = wiersze[i]
    ust = []
    zmiany = []


    return wyznacz(ust, bloki, zmiany, len(tablica[i]), 0, n, tablica[i])


def opt_dist_k(j,tablica,kolumny):
    n = len(kolumny[j])
    bloki = kolumny[j]
    ust = []
    zmiany = []

    kolumna = []

    for i in range(len(tablica)):
        kolumna.append(tablica[i][j])

    return wyznacz(ust, bloki, zmiany, len(kolumna), 0, n, kolumna)
    

def opt_dist(i,j,tablica,wiersze,kolumny):
    #print(i,j)
    wynik = opt_dist_w(i,tablica,wiersze)+opt_dist_k(j,tablica,kolumny)
    return wynik

def pusta(tablica):
    wys = len(tablica)
    szer = len(tablica[0])
    for i in range(wys):
        for j in range(szer):
            if tablica[i][j]==1:
                return False
    return True

def gotowe(tablica, wiersze, kolumny):
    wys = len(tablica)
    szer = len(tablica[0])
    for i in range(wys):
        for j in range(szer):
            if (opt_dist(i,j,tablica,wiersze,kolumny))!=0:
                return False
    return True

def sprawdz_wiersz(tablica,i, wiersze):
    n = len(tablica)
    if opt_dist_w(i,tablica,wiersze)==0:
        return True
    else:    
        return False

def wiersze_ok(tablica, wiersze):
    l = len(tablica)
    for i in range(l):
        if sprawdz_wiersz(tablica,i,wiersze)==False:
            return False
    
    return True

def sprawdz_kolumne(tablica,i,kolumny):
    n = len(tablica[0])
    if opt_dist_k(i,tablica,kolumny)==0:
        return True
    else:    
        return False

def kolumny_ok(tablica, kolumny):
    l = len(tablica[0])
    for i in range(l):
        if sprawdz_kolumne(tablica,i,kolumny)==False:
            return False
    
    return True
    

def reset(tab):
    bok = len(tablica[0])
    for p in range(len(tab)):
        for q in range(len(tab[0])):
            tab[p][q]=random.randint(0,1)

def zmiana(x):
    if x==0:
        return 1
    else:
        return 0



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
    tablica[i] = [0 for j in range(szer)]

reset(tablica)

stan = []

stan = [0 for i in range(wys)]

for i in range(wys):
    stan[i] = [0 for j in range(szer)]

for i in range(wys):
    for j in range(szer):
        stan[i][j] = opt_dist(i,j,tablica,wiersze,kolumny)




nr =0
nr2=0

wk = int



while gotowe(tablica,wiersze,kolumny)==False:
    nr+=1
    nr2+=1
    if wiersze_ok(tablica,wiersze):
        wk = 1
    elif kolumny_ok(tablica,kolumny):
        wk = 0
    else:
        wk = random.randint(0,1)

    r = random.randint(1,50)
    if r==1:
        a = random.randint(0,wys-1)
        b = random.randint(0,szer-1)
        tablica[a][b]=zmiana(tablica[a])

    if wk==1:
        i = random.randint(0,szer-1)
        while sprawdz_kolumne(tablica,i,kolumny):
            #print("k:",i, end=" ")
            i = random.randint(0,szer-1)
            #print("k",end="")
        tablica[0][i] = zmiana(tablica[0][i])
        #print(i)
        nowy = opt_dist(0,i,tablica,wiersze,kolumny)
        minimum = nowy - stan[0][i]
        #print("0:", minimum)
        stan_i = nowy
        indeks = 0
        tablica[0][i] = zmiana(tablica[0][i])
        for j in range (1,wys):
            tablica[j][i] = zmiana(tablica[j][i])
            nowy = opt_dist(j,i,tablica,wiersze,kolumny)
            tablica[j][i] = zmiana(tablica[j][i])
            roznica = nowy - stan[j][i]
            #print(j,roznica)
            if roznica < minimum:
                minimum = roznica
                stan_i = nowy
                indeks = j                
            elif (nowy - stan[j][i])==minimum:
                los = random.randint(0,1)
                if los == 1:
                    indeks = j
        #print(nr2)
        #print("Po kolumnie")
        #print("[", indeks, ",", i, "]")
        tablica[indeks][i] = zmiana(tablica[indeks][i])
        stan[indeks][i] = stan_i
    else:
        
        i = random.randint(0,wys-1)
        while sprawdz_wiersz(tablica,i,wiersze):
            i = random.randint(0,wys-1)
        tablica[i][0] = zmiana(tablica[i][0])
        nowy = opt_dist(i,0,tablica,wiersze,kolumny)
        minimum = nowy - stan[i][0]
        stan_i = nowy
        indeks = 0
        tablica[i][0] = zmiana(tablica[i][0])
        for j in range (1,szer):
            tablica[i][j] = zmiana(tablica[i][j])
            nowy = opt_dist(i,j,tablica,wiersze,kolumny)
            tablica[i][j] = zmiana(tablica[i][j])
            if nowy - stan[i][j] < minimum:
                minimum = nowy - stan[i][j]
                stan_i = nowy
                indeks = j
            if (nowy - stan[i][j])==minimum:
                los = random.randint(0,1)
                if los == 1:
                    indeks = j
        #print(nr2)
        #print("[", i, ",", indeks, "]")
        tablica[i][indeks] = zmiana(tablica[i][indeks])
        stan[i][indeks] = stan_i

    #print(nr2)
    if (nr>30*szer*wys):
        nr = 0
        reset(tablica)
        for i in range(wys):
            for j in range(szer):
                stan[i][j] = opt_dist(i,j,tablica,wiersze,kolumny)

#print(gotowe(tablica, wiersze, kolumny))

wyjscie = open("zad_output.txt", "w")

for i in range(wys):
    for j in range(szer):
        if tablica[i][j]==0:
            print(".",end="")
            wyjscie.write(".")
        else:
            print("#",end="")
            wyjscie.write("#")
    print()
    wyjscie.write('\n')

