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
        linia = input()
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
    elif p.bw.x < 1 or p.bw.x > 8: #or p.bw.y < 1 or p.bw.y > 8:
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
    if (poz.ck.y==1 and poz.bk.y==3 and poz.bw.y==1) or (poz.ck.y==8 and poz.bk.y==6 and poz.bw.y==8):
        if poz.ck.x == poz.bk.x or (poz.ck.x==8 and poz.bk.x==7) or (poz.ck.x==1 and poz.bk.x==2):
           return True
        else:
            return False
    elif (poz.ck.x==1 and poz.bk.x==3 and poz.bw.x==1) or (poz.ck.x==8 and poz.bk.x==6 and poz.bw.x==8):
        if poz.ck.y==poz.bk.y or (poz.ck.y==8 and poz.bk.y==7) or (poz.ck.y==1 and poz.bk.y==2):
            return True
        else:
            return False
    else:
        return False

def r_wiezy(poz):
    if poz.bw.x == poz.ck.x+1 or poz.bw.x == poz.ck.x-1:
        return True
    elif poz.bw.y == poz.ck.y+1 or poz.bw.y == poz.ck.y-1:
        return True
    elif poz.ck.x == 1 and poz.bk.x == 3 and (poz.bk.y == poz.ck.y+1 or poz.bk.y == poz.ck.y-1):
        return True
    elif poz.ck.x == 8 and poz.bk.x == 6 and (poz.bk.y == poz.ck.y+1 or poz.bk.y == poz.ck.y-1):
        return True
    elif poz.ck.y == 1 and poz.bk.y == 3 and (poz.bk.x == poz.ck.x+1 or poz.bk.x == poz.ck.x - 1):
        return True
    elif poz.ck.y == 8 and poz.bk.y == 6 and (poz.bk.x == poz.ck.x+1 or poz.bk.x == poz.ck.x - 1):
        return True
    else:
        return False



def dodaj_do_kolejki(poz, kolejka, lista):
    '''if poz.ruch:
        print("Czarne")
    else:
        print("Białe")'''

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
                if (i!=0 or j!=0) and dozwolona_pozycja(pom) and (not pom in kolejka) and (not pom in lista):
                    kolejka.append(copy.deepcopy(pom))
    else:
        for i in range(-1,2):
            for j in range(-1,2):
                #print("KROL")
                pom.bk.x=copy.deepcopy(pom2.bk.x+i)
                pom.bk.y=copy.deepcopy(pom2.bk.y+j)
                if (i!=0 or j!=0) and dozwolona_pozycja(pom) and (not pom in kolejka) and (not pom in lista):
                    kolejka.append(copy.deepcopy(pom))
                      
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
                    pom.drukuj()
                    if mat(pom):
                       kolejka.clear()
                    if not pom in lista and not pom in kolejka:
                        #print("dodano")
                        kolejka.append(copy.deepcopy(pom))
            for i in range(1,9):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza, pom2) and i!=pom2.bw.x:
                    pom.bw = copy.deepcopy(wieza)
                    if mat(pom):
                        kolejka.clear()
                    if (not pom in kolejka) and (not pom in lista):
                        kolejka.append(copy.deepcopy(pom))
        elif abs(pom2.bw.x-pom2.ck.x)<2 or abs(pom2.bw.y-pom2.ck.y)<2:
            pom = copy.deepcopy(pom2)
            wieza = Figura()
            for i in range (1,9):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if (not pom in kolejka) and (not pom in lista):
                        pom.drukuj()
                        kolejka.append(copy.deepcopy(pom))
                        break
            for i in range (8,0,-1):
                wieza.y = copy.deepcopy(pom2.bw.y)
                wieza.x = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if (not pom in kolejka) and (not pom in lista):
                        kolejka.append(copy.deepcopy(pom))
                        break
            for i in range (1,9):
                wieza.x = copy.deepcopy(pom2.bw.x)
                wieza.y = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if (not pom in kolejka) and (not pom in lista):
                        kolejka.append(copy.deepcopy(pom))
                        break
            for i in range (8,0,-1):
                wieza.x = copy.deepcopy(pom2.bw.x)
                wieza.y = i
                if dozwolony_ruch(wieza,pom2):
                    pom.bw = copy.deepcopy(wieza)
                    if (not pom in kolejka) and (not pom in lista):
                        kolejka.append(copy.deepcopy(pom))
                
        
    #print("Koniec")

pozycje = []
kolejka = []      

start = Pozycja()
'''
start.wczytaj()
start.drukuj()'''

for i in range(1):
    start.wczytaj()
    start.drukuj()
    print(mat(start))


aktualna = copy.deepcopy(start)

kolejka.append(aktualna)

ruch = start.ruch

print("START", end=" ")
start.drukuj()

i=1

s = []




#while aktualna.ck.y!=1 or aktualna.ck.x!=1 or aktualna.bk.y!=3 or aktualna.bk.x!=2:
while mat(aktualna)==False:
    #print("i:",i)
    aktualna = kolejka.pop(0)
    i+=1
    aktualna.drukuj()
    if aktualna in pozycje:
        print("Blad")
        break
    pozycje.append(aktualna)
    dodaj_do_kolejki(aktualna,kolejka,pozycje)
print()
aktualna.drukuj()
print()
'''
for i in kolejka:
    i.drukuj()'''
