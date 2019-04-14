//Kamil Michalak 299089
#include <stdio.h>
#include <stdlib.h>

typedef int nowy_typ;

typedef struct Tablica
{
    int dlugosc;
    int pocz_indeks;
    nowy_typ *tablica;
} Tablica;

Tablica inicjuj();

void rozszerz_tablice(Tablica *tab, int poz, nowy_typ el);

void dodaj_element(Tablica *tab, int pozycja, nowy_typ element);

nowy_typ pobierz_element(Tablica tab, int pozycja);
