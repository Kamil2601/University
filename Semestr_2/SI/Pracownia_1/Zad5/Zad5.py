import random
import string


def opt_dist_w(i,tablica,wiersze):
    l = len(tablica[0])
    ruchow_w = 0
    #print(l,wiersze[i])
    #print("w[i]: ", wiersze[i])

    for k in range(wiersze[i]):
        if tablica[i][k]==0:
            ruchow_w+=1
    for k in range(wiersze[i],l):
        if tablica[i][k]==1:
            ruchow_w+=1
    #print("0", ruchow_w)
    pom = ruchow_w
    
    for k in range (1,(l-wiersze[i]+1)):
        if tablica[i][k-1]==1:
            pom+=1
        else:
            pom-=1
        if tablica[i][k+wiersze[i]-1]==0:
            pom+=1
        else:
            pom-=1
        #print(k, pom)
        if pom<ruchow_w:
            ruchow_w = pom
    return ruchow_w


def opt_dist_k(j,tablica,kolumny):
    #print("kol[j]: ", kolumny[j])
    l = len(tablica)
    ruchow_k=0

    for k in range(kolumny[j]):
        if (tablica[k][j]==0):
            ruchow_k+=1

    for k in range(kolumny[j], l):
        if (tablica[k][j]==1):
            ruchow_k+=1

    #print(ruchow_k)

    pom = ruchow_k

    for k in range (1,(l-kolumny[j]+1)):
        if tablica[k-1][j]==1:
            pom+=1
        else:
            pom-=1
        if tablica[k+kolumny[j]-1][j]==0:
            pom+=1
        else:
            pom-=1

        #print(k,pom)
        if pom<ruchow_k:
            ruchow_k = pom

    #print("Wynik:")
    #print(ruchow_w, ruchow_k)
    return ruchow_k

def opt_dist(i,j,tablica,wiersze,kolumny):
    wynik = opt_dist_w(i,tablica,wiersze)+opt_dist_k(j,tablica,kolumny)
    return wynik

def pusta(tablica):
    n = len(tablica[0])
    for i in range(n):
        for j in range(n):
            if tablica[i][j]==1:
                return False
    return True

def gotowe(tablica, wiersze, kolumny):
    n = len(wiersze)
    for i in range(n):
        for j in range(n):
            if (opt_dist(i,j,tablica,wiersze,kolumny))!=0:
                return False
    return True

def sprawdz_wiersz(tablica,i, wiersze):
    n = len(tablica[0])
    if opt_dist_w(i,tablica,wiersze)==0:
        return True
    else:    
        return False

def wiersze_ok(tablica, wiersze):
    l = len(tablica[0])
    for i in range(l):
        if sprawdz_wiersz(tablica,i,wiersze)==False:
            return False
    
    return True

def sprawdz_kolumne(tablica,i,kolumny):
    n = len(tablica[0])
    if opt_dist_k(i,tablica,wiersze)==0:
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
    for p in range(bok):
        for q in range(bok):
            tab[p][q]=random.randint(0,1)

def zmiana(x):
    if x==0:
        return 1
    else:
        return 0


f = open("zad5_input.txt")
wk = f.readline()
wierszy, kolumn = wk.split(' ')
kolumn = kolumn[0: len(kolumn)-1]
wierszy = int(wierszy)
kolumn = int(kolumn)

wiersze = []
kolumny = []

for i in range(wierszy):
    k = f.readline()
    wiersze.append(int(k[0:len(k)-1]))


for i in range(kolumn-1):
    k = f.readline()
    kolumny.append(int(k[0:len(k)-1]))

kolumny.append(int(f.readline()))


#print(wk)


bok = len(wiersze)

tablica = [0 for i in range(bok)]

for i in range(bok):
    tablica[i] = [0 for j in range(bok)]

reset(tablica)

stan = []

stan = [0 for i in range(bok)]

for i in range(bok):
    stan[i] = [0 for j in range(bok)]

for i in range(bok):
    for j in range(bok):
        stan[i][j] = opt_dist(i,j,tablica,wiersze,kolumny)




nr =0
nr2=0



while gotowe(tablica,wiersze,kolumny)==False:
    nr+=1
    if wiersze_ok(tablica,wiersze):
        wk = 1
    elif kolumny_ok(tablica,kolumny):
        wk = 0
    else:
        wk = random.randint(0,1)

    if wk==1:
        i = random.randint(0,bok-1)
        while sprawdz_kolumne(tablica,i,kolumny):
            #print("k:",i, end=" ")
            i = random.randint(0,bok-1)
            #print("k",end="")
        tablica[0][i] = zmiana(tablica[0][i])
        #print(i)
        nowy = opt_dist(0,i,tablica,wiersze,kolumny)
        minimum = nowy - stan[0][i]
        #print("0:", minimum)
        stan_i = nowy
        indeks = 0
        tablica[0][i] = zmiana(tablica[0][i])
        for j in range (1,bok):
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
        i = random.randint(0,bok-1)
        x=0
        while sprawdz_wiersz(tablica,i,wiersze):
            i = random.randint(0,bok-1)
        tablica[i][0] = zmiana(tablica[i][0])
        nowy = opt_dist(i,0,tablica,wiersze,kolumny)
        minimum = nowy - stan[i][0]
        stan_i = nowy
        indeks = 0
        tablica[i][0] = zmiana(tablica[i][0])
        for j in range (1,bok):
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

    if (nr>200):
        nr = 0
        reset(tablica)
        for i in range(bok):
            for j in range(bok):
                stan[i][j] = opt_dist(i,j,tablica,wiersze,kolumny)

wyjscie = open("zad5_output.txt", "w")
#print(gotowe(tablica, wiersze, kolumny))
for i in range(bok):
    for j in range(bok):
        if tablica[i][j]==0:
            print(".",end="")
            wyjscie.write(".")
        else:
            print("#",end="")
            wyjscie.write("#")
    print()
    wyjscie.write("\n")
