import copy
import string
from heapq import heappush, heappop, heapify

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
        self.skrzynie = []
        self.h =0

    def __lt__(self, other):
        return (self.h+len(self.sekwencja)) < (other.h+len(other.sekwencja))

    def oblicz_h(self, cele, stara):
        min_gs = -1
        nr = 0
        nr2 = 0
        max_ss = 0
        min_sc = -1
        for i in range(len(skrzynie)):
            gs = abs(skrzynie[i].x-gracz.x)+abs(skrzynie[i].y-gracz.y)
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

    def oblicz_h2(self, cele, stara):
        min_gs = -1
        for box in skrzynie:
            gs = abs(box.x-gracz.x)+abs(box.y-gracz.y)
            if tab[box.y][box.x][0]=='B' and (gs<min_gs or min_gs==-1):
                min_gs = gs

        suma_skrzyn = 0

        targets = [False for c in cele]

        for box in skrzynie:
            min_sc = -1
            if tab[box.y][box.x][0]=='*':
                min_sc = 0
            else:
                for i in range(len(cele)):
                    sc = abs(box.x-cele[i].x)+abs(box.y-cele[i].y)
                    if tab[cele[i].y][cele[i].x][0]=='G' and (sc<min_sc or min_sc==-1):
                        min_sc = sc
                        if targets[i]==True:
                            min_sc+=1
                        targets[i]=True
            suma_skrzyn+=min_sc
        
        self.h = min_gs+suma_skrzyn
        #if self.h>stara.h:
        #    self.h = stara.h+1

    def oblicz_h3(self, cele, stara):
        wynik = 0
        for b in skrzynie:
            if tab[b.y][b.x][0]!='*':
                wynik+=1
        self.h = wynik



def koniec(tab, cele):
    for k in cele:
        if tab[k.y][k.x][0]!='*' and tab[k.y][k.x][0]!='B':
            return False
    return True

def dodaj_do_kolejki(nowa, stara, kolejka, cele):
    nk = tuple(tuple(k[0] for k in p) for p in nowa.tab)
    #sk = tuple(tuple(k[0] for k in p) for p in stara.tab)
    if not nk in visited:
        nowa.oblicz_h3(cele, stara)
        heappush(kolejka, nowa)
        visited[nk]=True

def w_gore(teraz, kolejka, visited, cele):
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
        dodaj_do_kolejki(nowa,teraz,kolejka, cele)
    elif nowa.tab[nowa.gracz.y-1][nowa.gracz.x][0]=='B' or nowa.tab[nowa.gracz.y-1][nowa.gracz.x][0]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        pom = nowa.tab[nowa.gracz.y-1][nowa.gracz.x][1:len(nowa.tab[nowa.gracz.y-1][nowa.gracz.x])]
        if nowa.tab[nowa.gracz.y-2][nowa.gracz.x]=='.':
            nowa.gracz.y-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y-1][nowa.gracz.x]='B'+pom
            t = nowa.tab[nowa.gracz.y-1][nowa.gracz.x]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].y-=1
            nowa.sekwencja=teraz.sekwencja+"U"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)
        elif nowa.tab[nowa.gracz.y-2][nowa.gracz.x]=='G':
            nowa.gracz.y-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'

            nowa.tab[nowa.gracz.y-1][nowa.gracz.x]='*'+pom
            t = nowa.tab[nowa.gracz.y-1][nowa.gracz.x]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].y-=1
            nowa.sekwencja=teraz.sekwencja+"U"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)

def w_dol(teraz, kolejka, visited, cele):
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
        dodaj_do_kolejki(nowa,teraz,kolejka, cele)
    elif nowa.tab[nowa.gracz.y+1][nowa.gracz.x][0]=='B' or nowa.tab[nowa.gracz.y+1][nowa.gracz.x][0]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        pom = nowa.tab[nowa.gracz.y+1][nowa.gracz.x][1:len(nowa.tab[nowa.gracz.y+1][nowa.gracz.x])]
        if nowa.tab[nowa.gracz.y+2][nowa.gracz.x]=='.':
            nowa.gracz.y+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y+1][nowa.gracz.x]='B'+pom
            t = nowa.tab[nowa.gracz.y+1][nowa.gracz.x]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].y+=1
            nowa.sekwencja=teraz.sekwencja+"D"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)
        elif nowa.tab[nowa.gracz.y+2][nowa.gracz.x]=='G':
            nowa.gracz.y+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y+1][nowa.gracz.x]='*'+pom
            t = nowa.tab[nowa.gracz.y+1][nowa.gracz.x]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].y+=1
            nowa.sekwencja=teraz.sekwencja+"D"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)

def w_lewo(teraz, kolejka, visited, cele):
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
        dodaj_do_kolejki(nowa,teraz,kolejka, cele)
    elif nowa.tab[nowa.gracz.y][nowa.gracz.x-1][0]=='B' or nowa.tab[nowa.gracz.y][nowa.gracz.x-1][0]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        pom = nowa.tab[nowa.gracz.y][nowa.gracz.x-1][1:len(nowa.tab[nowa.gracz.y][nowa.gracz.x-1])]
        if nowa.tab[nowa.gracz.y][nowa.gracz.x-2]=='.':
            nowa.gracz.x-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':# or nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x-1]='B'+pom
            t = nowa.tab[nowa.gracz.y][nowa.gracz.x-1]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].x-=1
            nowa.sekwencja=teraz.sekwencja+"L"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)
        elif nowa.tab[nowa.gracz.y][nowa.gracz.x-2]=='G':
            nowa.gracz.x-=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':# or nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x-1]='*'+pom
            t = nowa.tab[nowa.gracz.y][nowa.gracz.x-1]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].x-=1
            nowa.sekwencja=teraz.sekwencja+"L"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)

def w_prawo(teraz, kolejka, visited, cele):
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
        nowa.skrzynie = copy.deepcopy(teraz.skrzynie)
        dodaj_do_kolejki(nowa,teraz,kolejka, cele)
    elif nowa.tab[nowa.gracz.y][nowa.gracz.x+1][0]=='B' or nowa.tab[nowa.gracz.y][nowa.gracz.x+1][0]=='*':
        if nowa.tab[nowa.gracz.y][nowa.gracz.x]=='K':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='.'
        else:
            nowa.tab[nowa.gracz.y][nowa.gracz.x]='G'
        pom = nowa.tab[nowa.gracz.y][nowa.gracz.x+1][1:len(nowa.tab[nowa.gracz.y][nowa.gracz.x+1])]
        if nowa.tab[nowa.gracz.y][nowa.gracz.x+2]=='.':
            nowa.gracz.x+=1
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':# or nowa.tab[nowa.gracz.y][nowa.gracz.x]=='G':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            nowa.tab[nowa.gracz.y][nowa.gracz.x+1]='B'+pom
            t = nowa.tab[nowa.gracz.y][nowa.gracz.x+1]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].x+=1
            nowa.sekwencja=teraz.sekwencja+"R"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)
        elif nowa.tab[nowa.gracz.y][nowa.gracz.x+2]=='G':
            nowa.gracz.x+=1
            #print(nowa.tab[nowa.gracz.y][nowa.gracz.x])
            if nowa.tab[nowa.gracz.y][nowa.gracz.x][0]=='*':
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='+'
            else:
                nowa.tab[nowa.gracz.y][nowa.gracz.x]='K'
            #print(nowa.tab[nowa.gracz.y][nowa.gracz.x])
            nowa.tab[nowa.gracz.y][nowa.gracz.x+1]='*'+pom
            t = nowa.tab[nowa.gracz.y][nowa.gracz.x+1]
            nr = int(t[1:len(t)])
            nowa.skrzynie[nr].x+=1
            nowa.sekwencja=teraz.sekwencja+"R"
            dodaj_do_kolejki(nowa,teraz,kolejka, cele)
     


    

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
teraz.oblicz_h3(cele, pom)
teraz.gracz = copy.deepcopy(gracz)


heappush(kolejka,copy.deepcopy(teraz))


while koniec(teraz.tab,cele)==False:
    teraz = heappop(kolejka)
    w_gore(teraz,kolejka,visited,cele)
    w_dol(teraz, kolejka, visited, cele)
    w_lewo(teraz, kolejka, visited, cele)
    w_prawo(teraz, kolejka, visited, cele)

wyjscie = open("zad_output.txt", "w")
wyjscie.write(teraz.sekwencja)
print(teraz.sekwencja)
print(len(teraz.sekwencja))
