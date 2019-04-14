def drukuj_podzial(wart_pref, dl_ost, linia, index, File):
    if(index > 0):
        drukuj_podzial(wart_pref, dl_ost, linia, index - dl_ost[index], File)
        File.write(linia[index - dl_ost[index]:index] + " ")


def inicjuj(l, rozmiar):
    for i in range(0, rozmiar + 1):
        l.append(0)


def podzial_lini(linia, maxdl, slownik, wynik):
    dl = len(linia)
    wart_pref = []
    dl_ost = []
    inicjuj(wart_pref, dl)
    inicjuj(dl_ost, dl)
    for i in range(1, dl + 1):
        for j in range (1, min(i, maxdl) + 1):
            if linia[i - j: i] in slownik:
                if(wart_pref[i - j] > 0 or i == j):
                        if(wart_pref[i - j] + j * j > wart_pref[i]):
                            wart_pref[i] = wart_pref[i - j] + j * j
                            dl_ost[i] = j
    drukuj_podzial(wart_pref, dl_ost, linia, dl, wynik)
    wynik.write("\n")


f = open("slownik.txt")

dane = open("dane")

lista = []
lista = f.readlines()
maxdl = 0


f = open("slownik.txt")

wynik = open("wynik", "w")

dane = open("dane")

lista = []

lista = f.readlines()
maxdl = 0


for i,slowo in enumerate(lista):
   lista[i] = lista[i].strip()
   if len(lista[i]) > maxdl:
       maxdl = len(lista[i])


slownik = set(lista)

l = []
napis = "a"

while napis!="":
    napis = dane.readline()[:-1]
    lista.clear()
    podzial_lini(napis,maxdl,slownik, wynik)