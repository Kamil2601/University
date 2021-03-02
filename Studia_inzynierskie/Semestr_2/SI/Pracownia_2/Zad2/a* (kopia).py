import copy
import string
from heapq import heappush, heappop

class Obiekt:
    def __init__(self,a=0,b=0):
        self.x = b
        self.y = a

    def wypisz(self):
        print("x =", self.x, "y =", self.y)

class Plansza:
    def __init__(self):
        self.gracz = Obiekt()
        self.tab = []
        self.sekwencja = ""
        skrzynie = []
        self.h =-1

    def __lt__(self, other):
        return (self.h+len(self.sekwencja)) < (other.h+len(other.sekwencja))

    def oblicz_h(self, cele):
        max_sg = -1
        min_sc = -1
        wynik = -1
        for box in skrzynie:
            sg = abs(box.y-gracz.y)+abs(box.x-gracz.x)
            min_sc = -1
            for t in cele:
                sc = abs(box.y-t.y)+abs(box.x-t.x)
                if sc<min_sc or min_sc==-1:
                    min_sc = sc
            w = min_sc+sg
            if w<wynik or wynik==-1:
                w = wynik
        self.h = wynik




def koniec(tab, cele):
    for k in cele:
        if tab[k.y][k.x]!='*':
            return False
    return True

def dodaj_do_kolejki(nowa, stara, kolejka):
    nk = tuple(tuple(p) for p in nowa.tab)
    sk = tuple(tuple(p) for p in stara.tab)
    if not nk in visited:
        heappush(kolejka, nowa)
        visited[nk]=visited[sk]+1

def w_gore(teraz, kolejka, visited):
    nowa = Plansza()
    nowa = copy.deepcopy(teraz)
    if nowa.tab[nowa.gracz.y-1][nowa.gracz.x]=='.' or nowa.tab[nowa.gracz.y-1][nowa.gracz.x]=='G':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        nowa.gracz.y-=1
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
        nowa.sekwencja=teraz.sekwencja+"U"
        dodaj_do_kolejki(nowa,teraz,kolejka)
    elif nowa.tab[nowa.gracz.y-1][nowa.gracz.x]=='B' or nowa.tab[nowa.gracz.y-1][nowa.gracz.x]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'

        if nowa.tab[nowa.gracz.y-2][nowa.gracz.x]=='.':
            nowa.gracz.y-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y-1][nowa.gracz.x]='B'
            nowa.sekwencja=teraz.sekwencja+"U"
            dodaj_do_kolejki(nowa,teraz,kolejka)
        elif nowa.tab[nowa.gracz.y-2][nowa.gracz.x]=='G':
            nowa.gracz.y-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y-1][nowa.gracz.x]='*'
            nowa.sekwencja=teraz.sekwencja+"U"
            dodaj_do_kolejki(nowa,teraz,kolejka)

def w_dol(teraz, kolejka, visited):
    nowa = Plansza()
    nowa = copy.deepcopy(teraz)
    #nowa.gracz.wypisz()
    if nowa.tab[nowa.gracz.y+1][nowa.gracz.x]=='.' or nowa.tab[nowa.gracz.y+1][nowa.gracz.x]=='G':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        nowa.gracz.y+=1
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
        nowa.sekwencja=teraz.sekwencja+"D"
        dodaj_do_kolejki(nowa,teraz,kolejka)
    elif nowa.tab[nowa.gracz.y+1][nowa.gracz.x]=='B' or nowa.tab[nowa.gracz.y+1][nowa.gracz.x]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'

        if nowa.tab[nowa.gracz.y+2][nowa.gracz.x]=='.':
            nowa.gracz.y+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y+1][nowa.gracz.x]='B'
            nowa.sekwencja=teraz.sekwencja+"D"
            dodaj_do_kolejki(nowa,teraz,kolejka)
        elif nowa.tab[nowa.gracz.y+2][nowa.gracz.x]=='G':
            nowa.gracz.y+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y+1][nowa.gracz.x]='*'
            nowa.sekwencja=teraz.sekwencja+"D"
            dodaj_do_kolejki(nowa,teraz,kolejka)

def w_lewo(teraz, kolejka, visited):
    nowa = Plansza()
    nowa = copy.deepcopy(teraz)
    if nowa.tab[nowa.gracz.y][nowa.gracz.x-1]=='.' or nowa.tab[nowa.gracz.y][nowa.gracz.x-1]=='G':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        nowa.gracz.x-=1
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
        nowa.sekwencja=teraz.sekwencja+"L"
        dodaj_do_kolejki(nowa,teraz,kolejka)
    elif nowa.tab[nowa.gracz.y][nowa.gracz.x-1]=='B' or nowa.tab[nowa.gracz.y][nowa.gracz.x-1]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'

        if nowa.tab[nowa.gracz.y][nowa.gracz.x-2]=='.':
            nowa.gracz.x-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x-1]='B'
            nowa.sekwencja=teraz.sekwencja+"L"
            dodaj_do_kolejki(nowa,teraz,kolejka)
        elif nowa.tab[nowa.gracz.y][nowa.gracz.x-2]=='G':
            nowa.gracz.x-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x-1]='*'
            nowa.sekwencja=teraz.sekwencja+"L"
            dodaj_do_kolejki(nowa,teraz,kolejka)

def w_prawo(teraz, kolejka, visited):
    nowa = Plansza()
    nowa = copy.deepcopy(teraz)
    if nowa.tab[nowa.gracz.y][nowa.gracz.x+1]=='.' or nowa.tab[nowa.gracz.y][nowa.gracz.x+1]=='G':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        nowa.gracz.x+=1
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
        nowa.sekwencja=teraz.sekwencja+"R"
        dodaj_do_kolejki(nowa,teraz,kolejka)
    elif nowa.tab[nowa.gracz.y][nowa.gracz.x+1]=='B' or nowa.tab[nowa.gracz.y][nowa.gracz.x+1]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'

        if nowa.tab[nowa.gracz.y][nowa.gracz.x+2]=='.':
            nowa.gracz.x+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x+1]='B'
            nowa.sekwencja=teraz.sekwencja+"R"
            dodaj_do_kolejki(nowa,teraz,kolejka)
        elif nowa.tab[nowa.gracz.y][nowa.gracz.x+2]=='G':
            nowa.gracz.x+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x+1]='*'
            nowa.sekwencja=teraz.sekwencja+"R"
            dodaj_do_kolejki(nowa,teraz,kolejka)
     


    

w = []

f = open("dane")
x = f.read()

tab = []

print(x)

for c in x:
    if (c!='\n'):
        w.append(c)
    else:
        if w!=None:
            tab.append(copy.deepcopy(w))
        w.clear()
        
#tab.pop(-1)


p = [1,2,3]

k = tuple(tuple(x) for x in tab)
visited = {}

visited[k] = 0



gracz = Obiekt()

skrzynie = []

cele = []

for i in range(len(tab)):
    for j in range(len(tab[i])):
        if tab[i][j]=='K':
            gracz.x=j
            gracz.y=i
        elif tab[i][j]=="B":
            skrzynie.append(Obiekt(i,j))
        elif tab[i][j]=="*":
            cele.append(Obiekt(i,j))
            skrzynie.append(Obiekt(i,j))
        elif tab[i][j]=="G":
            cele.append(Obiekt(i,j))
        elif tab[i][j]=="+":
            gracz.x=j
            gracz.y=i
            cele.append(Obiekt(i,j))




kolejka = []


teraz = Plansza()
teraz.tab = copy.deepcopy(tab)
teraz.gracz = copy.deepcopy(gracz)

kolejka.append(copy.deepcopy(teraz))


while koniec(teraz.tab, cele)==False:
    teraz = kolejka.pop(0)
    w_gore(teraz,kolejka,visited)
    w_dol(teraz, kolejka, visited)
    w_lewo(teraz, kolejka, visited)
    w_prawo(teraz, kolejka, visited)

wyjscie = open("zad_output.txt", "w")
wyjscie.write(teraz.sekwencja)
print(teraz.sekwencja)
