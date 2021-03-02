def podzial(linia, maxdl, slownik):
    lewa = []
    prawa = []
    maks = []
    lista = []

    if len(linia)==0:
        return ["|"]
        
    for i in range( min(maxdl,len(linia)), 0, -1):
        print("i:", i)
        for j in range (0, len(linia)-i+1):
            if linia[j:j+i] in slownik:
                print("j:", j)
                for k in range(j, min(j+i,len(linia))):
                    print("k:",k)
                    if linia[k:k+i] in slownik:
                        print("if")
                        lewa = podzial(linia[0:k], maxdl, slownik)
                        prawa = podzial(linia[k+i:len(linia)], maxdl, slownik)
                        if len(lewa)==0 or len(prawa)==0:
                            continue
                        lista.clear()
                        lista.extend(lewa)
                        lista.append(linia[j:j+i])
                        lista.extend(prawa)
                        if (wartosc_podzialu(lista)>wartosc_podzialu(maks)):
                            maks.clear();
                            maks.extend(lista)
                        lista.clear()
                if len(maks)!=0:
                    return maks
    return []

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

'''for i in range(25):
    napis = input()
    #print(napis)
    lista.clear()
    l = podzial(napis,maxdl,slownik)
    print(l)'''

napis = "aa"
#print(napis)
l = podzial(napis,maxdl,slownik)
print(l)