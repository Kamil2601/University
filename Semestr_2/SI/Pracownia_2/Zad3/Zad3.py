import copy
import string
from heapq import heappush, heappop, heapify

class Obiekt:
    def __init__(self,a=0,b=0):
        self.x = b
        self.y = a

    def wypisz(self):
        print("x =", self.x, "y =", self.y)

class Skrzynia:
    def __init__(self,a=0,b=0):
        self.x = b
        self.y = a

class Plansza:
    def __init__(self):
        self.gracz = Obiekt()
        self.tab = []
        self.sekwencja = ""
        self.skrzynie = []
        self.h =0
        self.d_pola = []

    def __lt__(self, other):
        return (self.h) < (other.h)

    def oblicz_h(self, cele, stara):
        min_gs = -1
        nr = 0
        nr2 = 0
        max_ss = 0
        min_sc = -1
        for i in range(len(skrzynie)):
            gs = abs(skrzynie[i].x-gracz.x)+abs(skrzynie[i].x-gracz.x)
            if tab[skrzynie[i].y][skrzynie[i].x][0]=='B' and (gs<min_gs or min_gs==-1):
                min_gs = gs
                nr = i
        for i in range(len(skrzynie)):
            ss = abs(skrzynie[i].x-skrzynie[nr].x)+abs(skrzynie[i].y-skrzynie[nr].y)
            if ss>max_ss and tab[skrzynie[i].y][skrzynie[i].x][0]=='B':
                max_ss = ss
                nr2 = 0
        for c in cele:
            sc = abs(skrzynie[nr2].x-c.x)+abs(skrzynie[nr2].y-c.y)
            if tab[c.y][c.x][0]=='*':
                sc+=3
            if sc<min_sc or min_sc==-1:
                min_sc=sc
        wynik = min_gs+max_ss+min_sc
        if wynik>stara.h:
            wynik=stara.h+1

        self.h = wynik



def koniec(tab, cele):
    for k in cele:
        if tab[k.y][k.x][0]!='*':
            return False
    return True

def dodaj_do_kolejki(nowa, stara, kolejka, cele):
    nk = tuple(tuple(k[0] for k in p) for p in nowa.tab)
    #sk = tuple(tuple(k[0] for k in p) for p in stara.tab)
    if not nk in visited:
        nowa.oblicz_h(cele, stara)
        heappush(kolejka, nowa)
        visited[nk]=True


def rek(tab,wynik, y, x):
    wynik[y][x]=True
    if (tab[y-1][x]=='.' or tab[y-1][x]=='G') and wynik[y-1][x]==False:
        wynik = rek(tab,wynik, y-1, x)
    if (tab[y+1][x]=='.' or tab[y+1][x]=='G') and wynik[y+1][x]==False:
        wynik = rek(tab,wynik, y+1, x)
    if (tab[y][x-1]=='.' or tab[y][x-1]=='G') and wynik[y][x-1]==False:
        wynik = rek(tab,wynik, y, x-1)
    if (tab[y][x+1]=='.' or tab[y][x+1]=='G') and wynik[y][x+1]==False:
        wynik = rek(tab,wynik, y, x+1)
    
    return wynik

def dostepne_pola(p):
    wynik = []
    pom = [False for i in range(len(p.tab[0]))]
    wynik = [copy.deepcopy(pom) for i in range(len(tab))]

    return rek(p.tab, wynik, p.gracz.y, p.gracz.x)

def w_gore(teraz,kolejka,visited,cele,i):
    if teraz.d_pola[teraz.skrzynie[i].y+1][teraz.skrzynie[i].x]==True:
        nowa = copy.deepcopy(teraz)
        nowa.gracz.y = nowa.skrzynie[i].y
        nowa.gracz.x = nowa.skrzynie[i].x
        a = teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]
        b = a[1:len(a)]
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x][0]=='B':
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='.'
            else:
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='G'
        if teraz.tab[teraz.skrzynie[i].y-1][teraz.skrzynie[i].x][0]=='.':
            nowa.skrzynie[i].y-=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = 'B'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)
        elif teraz.tab[teraz.skrzynie[i].y-1][teraz.skrzynie[i].x][0]=='G':
            nowa.skrzynie[i].y-=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = '*'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)

def w_dol(teraz,kolejka,visited,cele,i):
    if teraz.d_pola[teraz.skrzynie[i].y-1][teraz.skrzynie[i].x]==True:
        nowa = copy.deepcopy(teraz)
        nowa.gracz.y = nowa.skrzynie[i].y
        nowa.gracz.x = nowa.skrzynie[i].x
        a = teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]
        b = a[1:len(a)]
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x][0]=='B':
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='.'
            else:
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='G'
        if teraz.tab[teraz.skrzynie[i].y+1][teraz.skrzynie[i].x][0]=='.':
            nowa.skrzynie[i].y+=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = 'B'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)
        elif teraz.tab[teraz.skrzynie[i].y-1][teraz.skrzynie[i].x][0]=='G':
            nowa.skrzynie[i].y+=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = '*'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)

def w_lewo(teraz,kolejka,visited,cele,i):
    if teraz.d_pola[teraz.skrzynie[i].y][teraz.skrzynie[i].x+1]==True:
        nowa = copy.deepcopy(teraz)
        nowa.gracz.y = nowa.skrzynie[i].y
        nowa.gracz.x = nowa.skrzynie[i].x
        a = teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]
        b = a[1:len(a)]
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x][0]=='B':
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='.'
            else:
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='G'
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x-1][0]=='.':
            nowa.skrzynie[i].x-=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = 'B'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)
        elif teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x-1][0]=='G':
            nowa.skrzynie[i].x-=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = '*'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)

def w_prawo(teraz,kolejka,visited,cele,i):
    if teraz.d_pola[teraz.skrzynie[i].y][teraz.skrzynie[i].x-1]==True:
        nowa = copy.deepcopy(teraz)
        nowa.gracz.y = nowa.skrzynie[i].y
        nowa.gracz.x = nowa.skrzynie[i].x
        a = teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]
        b = a[1:len(a)]
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x][0]=='B':
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='.'
            else:
                nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x]='G'
        if teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x+1][0]=='.':
            nowa.skrzynie[i].x+=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = 'B'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)
        elif teraz.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x+1][0]=='G':
            nowa.skrzynie[i].x+=1
            nowa.tab[teraz.skrzynie[i].y][teraz.skrzynie[i].x] = '*'+b
            dodaj_do_kolejki(nowa, teraz, kolejka, cele)




w = []

f = open("zad_input.txt")
x = f.read()

tab = []

print(x)
t = []


for c in x:
    t.append(c)

t.append('\n')

#print(t)
w.clear

tab = []

for i in t:
    if i!='\n':
        w.append(i)
    else:
        tab.append(copy.copy(w))
        w.clear()


#k = tuple(tuple(k[0] for k in x) for x in tab)
visited = {}

#visited[k] = True



gracz = Obiekt()

skrzynie = []

cele = []

nr = 0
    

for i in range(len(tab)):
    for j in range(len(tab[i])):
        if tab[i][j]=='K':
            gracz.x=j
            gracz.y=i
        elif tab[i][j]=="B":
            tab[i][j]+=str(nr)
            nr+=1
            skrzynie.append(Obiekt(i,j))
        elif tab[i][j]=="*":
            tab[i][j]+=str(nr)
            nr+=1
            cele.append(Obiekt(i,j))
            skrzynie.append(Obiekt(i,j))
        elif tab[i][j]=="G":
            cele.append(Obiekt(i,j))
        elif tab[i][j]=="+":
            gracz.x=j
            gracz.y=i
            cele.append(Obiekt(i,j))

k = tuple(tuple(p[0] for p in x) for x in tab)
visited[k] = True

kolejka = []

heapify(kolejka)

teraz = Plansza()
teraz.tab = copy.deepcopy(tab)
teraz.skrzynie = copy.deepcopy(skrzynie)
pom = Plansza()
pom.h = 10000000
teraz.oblicz_h2(cele, pom)
teraz.gracz = copy.deepcopy(gracz)


heappush(kolejka,copy.deepcopy(teraz))


while koniec(teraz.tab,cele)==False:
    teraz = heappop(kolejka)
    for i in range(len(teraz, skrzynie)):
        w_gore(teraz,kolejka,visited,cele,i)
        w_dol(teraz, kolejka, visited, cele,i)
        w_lewo(teraz, kolejka, visited, cele,i)
        w_prawo(teraz, kolejka, visited, cele,i)

wyjscie = open("zad_output.txt", "w")
wyjscie.write(teraz.sekwencja)
print(teraz.sekwencja)