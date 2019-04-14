def wartosc_podzialu(lista):
    wynik = 0;
    for i in lista:
        wynik+=len(i)*len(i)
    return wynik

def podzial(linia, maxdl, slownik, slowa, maks):
    if len(linia) == 0:
        if (wartosc_podzialu(slowa)>wartosc_podzialu(maks)):
            maks.clear()
            maks.extend(slowa)    
        if (len(slowa)!=0):
           slowa.pop()
    elif len(slowa)>len(maks)*10 and len(maks)>0:
        if (len(slowa)!=0):
            slowa.pop()
    else:
        for i in range(min(maxdl,len(linia)),0,-1):
            if linia[0: i] in slownik:
                slowa.append(linia[0:i])
                podzial(linia[i:len(linia)], maxdl, slownik, slowa,maks)
        if (len(slowa)!=0):
            slowa.pop()


def podzial_lini(linia, maxdl, slownik):
    slowa = []
    wynik = []
    podzial(linia, maxdl, slownik, slowa, wynik)
    return wynik
                

f = open("slownik.txt");

dane = open("dane")

lista = []

lista = f.readlines();
maxdl = 0


for i,slowo in enumerate(lista):
   lista[i] = lista[i].strip()
   if len(lista[i]) > maxdl:
       maxdl = len(lista[i])


slownik = set(lista)

l = []

for i in range(25):
    napis = input()
    #print(napis)
    lista.clear()
    l = podzial_lini(napis,maxdl,slownik)
    print(l)