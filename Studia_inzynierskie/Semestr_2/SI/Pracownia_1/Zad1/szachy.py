import copy

class Figura():
    def __init__(self):
        self.x=int
        self.y=int

class Pozycja():

    def __init__(self):
        self.bk = Figura()
        self.ck = Figura()
        self.bw = Figura()
        self.ruch = bool

    def kopiuj(self,  p):
        self.bk.x = copy.copy(p.bk.x)
        self.bk.y = p.bk.y
        self.ck.x = p.ck.x
        self.ck.y = p.ck.y
        self.bw.x = p.bw.x
        self.bw.y = p.bw.y
    

    def wczytaj(self):
        f = open("zad1_input.txt")
        linia = f.read(14)
        if (linia[0:5]=="white"):
            self.ruch = False
        else:
            self.ruch = True

        self.bk.x = wczytaj_kolumne(linia[6])
        self.bk.y = int(linia[7])

        self.bw.x = wczytaj_kolumne(linia[9])
        self.bw.y = int(linia[10])

        self.ck.x = wczytaj_kolumne(linia[12])
        self.ck.y = int(linia[13])

    def drukuj(self):
        print("B: K ", end="")
        print(wypisz_kolumne(self.bk.x), self.bk.y, end=", ")
        print("W ", end="")
        print(wypisz_kolumne(self.bw.x), self.bw.y, end="   ")
        print("Cz: K ", end="")
        print(wypisz_kolumne(self.ck.x), self.ck.y, end=" ")
        if self.ruch:
            print("czarne")
        else:
            print("białe")

    def zmien(self):
        self.ruch = not (self.ruch)


def visited(poz, t):
    if t[poz.bk.x-1][poz.bk.y-1][poz.bw.x-1][poz.bw.y-1][poz.ck.x-1][poz.ck.y-1][poz.ruch]==0:
        return False
    else:
        return True

def dodaj(poprz, nast, t, tp):
    x = t[poprz.bk.x-1][poprz.bk.y-1][poprz.bw.x-1][poprz.bw.y-1][poprz.ck.x-1][poprz.ck.y-1][poprz.ruch]
    t[nast.bk.x-1][nast.bk.y-1][nast.bw.x-1][nast.bw.y-1][nast.ck.x-1][nast.ck.y-1][nast.ruch]=x+1
    #tp[nast.bk.x-1][nast.bk.y-1][nast.bw.x-1][nast.bw.y-1][nast.ck.x-1][nast.ck.y-1][nast.ruch]=copy.deepcopy(poprz)
    #tp[nast.bk.x-1][nast.bk.y-1][nast.bw.x-1][nast.bw.y-1][nast.ck.x-1][nast.ck.y-1][nast.ruch].drukuj()

def wypisz_kolumne(z):
    litery = "abcdefgh"
    return litery[z-1]

def wczytaj_kolumne(z):
    litery = "abcdefgh"
    for i in range(8):
        if litery[i]==z:
            return i+1
            
    
def zapisz_pozycje(lista, bk, bw, ck):
    pom = Pozycja
    pom.bk = bk
    pom.bw = bw
    pom.ck = cw
    lista.append(pom)

def dozwolona_pozycja(p): 

    if p.bk.x < 1 or p.bk.x > 8 or p.bk.y < 1 or p.bk.y > 8:
        return False
    elif p.ck.x < 1 or p.ck.x > 8 or p.ck.y < 1 or p.ck.y > 8:
        return False
    elif p.bw.x < 1 or p.bw.x > 8 or p.bw.y < 1 or p.bw.y > 8:
        return False
    elif p.bk == p.bw:
        return False
    elif p.ck.x == p.bw.x or p.ck.y == p.bw.y:
        return False
    elif p.bk.y == p.ck.y+1 and (p.bk.x == p.ck.x-1 or p.bk.x == p.ck.x or p.bk.x == p.ck.x+1):
        return False
    elif p.bk.y == p.ck.y and (p.bk.x == p.ck.x-1 or p.bk.x == p.ck.x or p.bk.x == p.ck.x+1):
        return False
    elif p.bk.y == p.ck.y-1 and (p.bk.x == p.ck.x-1 or p.bk.x == p.ck.x or p.bk.x == p.ck.x+1):
        return False
    else:
        return True

def dozwolony_ruch(wieza, p):
    if wieza == p.bk or wieza == p.ck or wieza == p.bw:
        #print("1")
        return False
    if wieza.x<1 or wieza.x>8 or wieza.y<1 or wieza.y>8:
        #print("2")
        return False
    elif p.bw.x == p.bk.x and p.bk.y<=wieza.y and p.bk.y>=p.bw.y and wieza.y>p.bw.y:
        #print("3")
        return False
    elif p.bw.x == p.bk.x and p.bk.y>=wieza.y and p.bk.y<=p.bw.y and wieza.y<p.bw.y:
        #print("4")
        return False
    elif p.bw.y == p.bk.y and p.bk.x<=wieza.x and p.bk.x>=p.bw.x and wieza.x>p.bw.x:
        #print("5")
        return False
    elif p.bw.y == p.bk.y and p.bk.x>=wieza.x and p.bk.x<=p.bw.x and wieza.x<p.bw.x:
        #print("6")
        return False
    elif p.bw.x == p.ck.x and p.ck.y<=wieza.y and p.ck.y>=p.bw.y and wieza.y>p.bw.y:
        #print("7")
        return False
    elif p.bw.x == p.ck.x and p.ck.y>=wieza.y and p.ck.y<=p.bw.y and wieza.y<p.bw.y:
        #print("8")
        return False
    elif p.bw.y == p.ck.y and p.ck.x<=wieza.x and p.ck.x>=p.bw.x and wieza.x>p.bw.x:
        #print("9")
        return False
    elif p.bw.y == p.ck.y and p.ck.x>=wieza.x and p.ck.x<=p.bw.x and wieza.x<p.bw.x:
        #print("10")
        return False
    else:
        return True

def mat(poz):
    if ((poz.ck.y==1 and poz.bk.y==3 and poz.bw.y==1) or (poz.ck.y==8 and poz.bk.y==6 and poz.bw.y==8)) and abs(poz.bw.x-poz.ck.x)>1:
        if poz.ck.x == poz.bk.x or (poz.ck.x==8 and poz.bk.x==7) or (poz.ck.x==1 and poz.bk.x==2):
           return True
        else:
            return False
    elif ((poz.ck.x==1 and poz.bk.x==3 and poz.bw.x==1) or (poz.ck.x==8 and poz.bk.x==6 and poz.bw.x==8)) and abs(poz.bw.y-poz.ck.y)>1:
        if poz.ck.y==poz.bk.y or (poz.ck.y==8 and poz.bk.y==7) or (poz.ck.y==1 and poz.bk.y==2):
            return True
        else:
            return False
    else:
        return False

    
def dodaj_do_kolejki(poz, kolejka, tab, poprzednie):
    pom2 = Pozycja()
    pom2 = copy.deepcopy(aktualna)
    pom2.ruch = not pom2.ruch
    pom = Pozycja()
    pom = copy.deepcopy(pom2)  
    if poz.ruch:
        #print("czarne")
        for i in range(-1,2):
            for j in range(-1,2):
                pom.ck.x=copy.deepcopy(pom2.ck.x+i)
                pom.ck.y=copy.deepcopy(pom2.ck.y+j)
                if (i!=0 or j!=0) and dozwolona_pozycja(pom) and not visited(pom, tab):
                    kolejka.append(copy.deepcopy(pom))
                    dodaj(poz,pom,tab, poprzednie)
    else:
        for i in range(-1,2):
            for j in range(-1,2):
                #print("KROL")
                pom.bk.x=copy.deepcopy(pom2.bk.x+i)
                pom.bk.y=copy.deepcopy(pom2.bk.y+j)
                if (i!=0 or j!=0) and dozwolona_pozycja(pom) and not visited(pom, tab):
                    kolejka.append(copy.deepcopy(pom))
                    dodaj(poz,pom,tab, poprzednie)
                      
        if ((poz.ck.x==1 and poz.bk.x==3) or (poz.ck.x==8 and poz.bk.x==6) and abs(poz.ck.y-poz.bk.y)<2) or ((poz.ck.y==1 and poz.bk.y==3) or (poz.ck.y==8 and poz.bk.y==6) and abs(poz.ck.x-poz.bk.x)<2):
            pom = copy.deepcopy(pom2)
            wieza = Figura()
            #print("Ruchy w kolumnie")
            for i in range(1,9):
                wieza.x = copy.deepcopy(pom2.bw.x)
                wieza.y = i
                #print("x:",wieza.x, "y:",wieza.y)
                #print(dozwolony_ruch(wieza, pom2) and i!=pom2.bw.y)
                if dozwolony_ruch(wieza, pom2) and i!=pom2.bw.y:
                    pom.bw = wieza
                    #print("ruch ok")
                    #pom.drukuj()
                    if mat(pom):
                       kolejka.clear()
                    if not visited(pom, tab):
                        #print("dodano")
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
            for i in range(1,9):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza, pom2) and i!=pom2.bw.x:
                    pom.bw = copy.deepcopy(wieza)
                    if mat(pom):
                        kolejka.clear()
                    if not visited(pom,tab):
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
        elif abs(pom2.bw.x-pom2.ck.x)<2 or abs(pom2.bw.y-pom2.ck.y)<2:
            pom = copy.deepcopy(pom2)
            wieza = Figura()
            for i in range (1,9):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if not visited(pom, tab):
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
                        break
            for i in range (8,0,-1):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if not visited(pom, tab):
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
                        break
            for i in range (1,9):
                wieza.x = copy.deepcopy(pom2.bw.x)
                wieza.y = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if not visited(pom, tab):
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
                        break
            for i in range (8,0,-1):
                wieza.x = copy.deepcopy(pom2.bw.x)
                wieza.y = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if not visited(pom, tab):
                        kolejka.append(copy.deepcopy(pom))
                        dodaj(poz,pom,tab, poprzednie)
                        break


pozycje = [0 for i in range(8)]
poprzednie = [0 for i in range(8)]




for i in range(8):
    pozycje[i] = [0 for j in range(8)]
    #poprzednie[i] = [0 for j in range(8)]
    for j in range(8):
        pozycje[i][j] = [0 for k in range(8)]
        #poprzednie[i][j] = [0 for k in range(8)]
        for k in range(8):
            pozycje[i][j][k] = [0 for l in range(8)]
            #poprzednie[i][j][k] = [0 for l in range(8)]
            for l in range(8):
                pozycje[i][j][k][l] = [0 for m in range(8)]
                #poprzednie[i][j][k][l] = [0 for m in range(8)]
                for m in range(8):
                    pozycje[i][j][k][l][m] = [0 for n in range(8)]
                    #poprzednie[i][j][k][l][m] = [0 for n in range(8)]
                    for n in range(8):
                        pozycje[i][j][k][l][m][n] = [0 for o in range(2)]
                        #poprzednie[i][j][k][l][m][n] = [Pozycja() for o in range(2)]


start = Pozycja()
start.wczytaj()

kolejka = []

aktualna = Pozycja()

aktualna = copy.deepcopy(start)

kolejka.append(copy.deepcopy(aktualna))

pozycje[aktualna.bk.x-1][aktualna.bk.y-1][aktualna.bw.x-1][aktualna.bw.y-1][aktualna.ck.x-1][aktualna.ck.y-1][aktualna.ruch] = 1



while mat(aktualna)==False:
    aktualna = kolejka.pop(0)
    i+=1
    #aktualna.drukuj()
    pozycje.append(aktualna)
    dodaj_do_kolejki(aktualna,kolejka,pozycje, poprzednie)

#aktualna.drukuj()
ruchy = pozycje[aktualna.bk.x-1][aktualna.bk.y-1][aktualna.bw.x-1][aktualna.bw.y-1][aktualna.ck.x-1][aktualna.ck.y-1][aktualna.ruch]-1
#print(ruchy)
out = open("zad1_output.txt", "w")
out.write(str(ruchy))
#print(abs( aktualna.bw.y-aktualna.ck.y))

l_ruchow = []

#p = Pozycja()

#poprzednie[start.bk.x-1][start.bk.y-1][start.bw.x-1][start.bw.y-1][start.ck.x-1][start.ck.y-1][start.ruch] = copy.deepcopy(start)

#p = copy.deepcopy(aktualna)


'''

for i in range(ruchy+1):
    l_ruchow.append(p)
    a = p.bk.x-1
    b = p.bk.y-1
    c = p.bw.x-1
    d = p.bw.y-1
    e = p.ck.x-1
    f = p.ck.y-1
    g = p.ruch
    p = copy.deepcopy(poprzednie[a][b][c][d][e][f][g])
    #p.drukuj()
    

for i in range(len(l_ruchow)-1,-1,-1):
    l_ruchow[i].drukuj()
'''