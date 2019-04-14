import random

def opt_dist(i,j,tablica,wiersze,kolumny):
    l = len(tablica[0])
    ruchow_w = 0
    ruchow_k = 0
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

    #print("kol[j]: ", kolumny[j])

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
    wynik = ruchow_k+ruchow_w
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
        blok = 0
        for j in range(n):
            if (tablica[i][j]==1 and blok==0):
                blok = 1
            elif (tablica[i][j]==1 and tablica[i][j-1]==1):
                blok+=1
            elif (tablica[i][j]==0 and tablica[i][j-1]==1 and j!=0):
                if blok!=wiersze[i]:
                    print(blok)
                    print(i,j)
                    print("1")
                    return False
            elif (tablica[i][j]==1 and tablica[i][j-1]==0 and blok!=0):
                print("2")
                return False
        if blok!=wiersze[i]:
            print("3")
            return False
    for i in range(n):
        blok = 0
        for j in range(n):
            if (tablica[j][i]==1 and blok==0):
                blok = 1
            elif (tablica[j][i]==1 and tablica[j-1][i]==1):
                blok+=1
            elif (tablica[j][i]==0 and tablica[j-1][i]==1 and j!=0):
                if blok!=kolumny[i]:
                    print("4")
                    return False
            elif (tablica[j][i]==1 and tablica[j-1][i]==0 and blok!=0):
                print("5")
                return False
        if blok!=kolumny[i]:
            print("6")
            return False
    return True

def sprawdz_wiersz(tablica,nr, wiersze):
    n = len(tablica[0])
    blok = 0
    for j in range(n):
        if (tablica[nr][j]==1 and blok==0):
            blok = 1
        elif (tablica[nr][j]==1 and tablica[nr][j-1]==1):
            blok+=1
        elif (tablica[nr][j]==0 and tablica[nr][j-1]==1):
            if blok!=wiersze[nr]:
                return False
        elif (tablica[nr][j]==1 and tablica[nr][j-1]==0 and blok!=0):
                return False
    if blok!=wiersze[nr]:
        return False
    else:
        return True

def wiersze_ok(tablica, wiersze):
    l = len(tablica[0])
    for i in range(l):
        if sprawdz_wiersz(tablica,i,wiersze)==False:
            return False
    
    return True

def sprawdz_kolumne(tablica,nr,kolumny):
    n = len(tablica[0])
    blok = 0
    for j in range(n):
        if (tablica[j][nr]==1 and blok==0):
            blok = 1
        elif (tablica[j][nr]==1 and tablica[j-1][nr]==1):
            blok+=1
        elif (tablica[j][nr]==0 and tablica[j-1][nr]==1):
            if blok!=kolumny[nr]:
                return False
        elif (tablica[j][nr]==1 and tablica[j-1][nr]==0 and blok!=0):
            return False
    if blok!=kolumny[nr]:
        return False
    return True

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



wiersze = [2,2,7,7,2,2,2]
kolumny = [4,4,2,2,2,5,5]
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


nr = 0
nr2 =0
kol = False

tablica =  [[1, 1, 0, 0, 0, 0, 0],
            [1, 1, 0, 0, 0, 0, 0],
            [1, 1, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1],
            [0, 0, 0, 0, 0, 1, 1],
            [0, 0, 0, 0, 0, 1, 1],
            [0, 0, 0, 0, 0, 0, 0]]
t = [[1, 1, 0, 0, 0, 0, 0],
[1, 1, 0, 0, 0, 0, 1],
[1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 0, 0]]

x = opt_dist(1,5,t,wiersze,kolumny)
a = opt_dist(6,5,t,wiersze,kolumny)

print(x,a)

t = [[1, 1, 0, 0, 0, 0, 0],
[1, 1, 0, 0, 0, 1, 1],
[1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 0, 0]]

y = opt_dist(1,5,t,wiersze,kolumny)

t = [[1, 1, 0, 0, 0, 0, 0],
[1, 1, 0, 0, 0, 0, 1],
[1, 1, 1, 1, 1, 1, 1],
[1, 1, 1, 1, 1, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 1, 1],
[0, 0, 0, 0, 0, 1, 0]]

b = opt_dist(6,5,t,wiersze,kolumny)

print(y,b)