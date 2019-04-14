import copy
import random

blotki = ["P2","P3","P4","P5","P6","P7","P8","P9","P0",
        "K2","K3","K4","K5","K6","K7","K8","K9","K0",
        "T2","T3","T4","T5","T6","T7","T8","T9","T0",
        "S2","S3","S4","S5","S6","S7","S8","S9","S0",]

figury = ["PJ","PQ","PK","PA",
        "KJ","KQ","KK","KA",
        "TJ","TQ","TK","TA",
        "SJ","SQ","SK","SA",]

def para(karty):
    for i in karty:
        for j in karty:
            if i!=j and i[1]==j[1]:
                return True
    return False

def dwie_pary(karty):
    pom = copy.deepcopy(karty)

    for k in range(2):
        for i in pom:
            for j in pom:
                if i!=j and i[1]==j[1]:
                    pom.remove(i)
                    pom.remove(j)

    if len(pom)>1:
        return False
    else:
        return True

def trojka(karty):
    for i in karty:
        for j in karty:
            for k in karty:
                if i!=j and i!=k and j!=k and i[1]==j[1] and i[1]==k[1]:
                    return True
    return False

def kareta(karty):
    for i in karty:
        roznych = 0
        for j in karty:
            if j[1]!=i[1]:
                roznych+=1
        if roznych<=1:
            return True
    return False

def full(karty):
    pom = copy.deepcopy(karty)
    for i,x in enumerate(pom):
        for j,y in enumerate(pom):
            for k,z in enumerate(pom):
                if x!=y and x!=z and y!=z and x[1]==y[1] and x[1]==z[1]:
                    pom.remove(x)
                    pom.remove(y)
                    pom.remove(z)
    if len(pom)>2:
        return False
    else:
        if pom[0][1]==pom[1][1]:
            return True
        else:
            return False
                        
                    

def kolor(karty):
    for i in range(1,len(karty)):
        if karty[i][0]!=karty[i-1][0]:
            return False
    return True

def strit(karty):
    if karty[0][1]=='A' or karty[0][1]=='K' or karty[0][1]=='Q' or karty[0][1]=='J':
        return False
    minim = 10
    lista = []
    for i in karty:
        x = int(i[1])
        lista.append(copy.deepcopy(x))
        if x < minim:
            minim = x
    
    for i in range(4):
        minim+=1
        if not minim in lista:
            return False
    return True

def poker(karty):
    return strit(karty) and kolor(karty)

def uklad(karty):
    if poker(karty):
        return 9
    if kareta(karty):
        return 8
    if full(karty):
        return 7
    if kolor(karty):
        return 6
    if strit(karty):
        return 5
    if trojka(karty):
        return 4
    if dwie_pary(karty):
        return 3
    if para(karty):
        return 2
    return 1

zf = 0
zb = 0

 

for i in range(10000):
    figurant = []
    blotkarz = []
    while len(figurant)<5:
        i = random.randint(0,len(figury)-1)
        if not figury[i] in figurant:
            figurant.append(figury[i])

    while len(blotkarz)<5:
        i = random.randint(0,len(blotki)-1)
        if not blotki[i] in blotkarz:
            blotkarz.append(blotki[i])
    if (uklad(blotkarz)>uklad(figurant)):
        zb+=1
    else:
        zf+=1
    

print(zb,zf)
