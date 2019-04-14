//Kamil Michalak 299089
#include "tablica.h"

Tablica inicjuj()
{
    Tablica tab;
    tab.dlugosc = 0;
    tab.pocz_indeks = 0;
    tab.tablica = NULL;

    return tab;
}

void rozszerz_tablice(Tablica *tab, int poz, nowy_typ el)
{

    if (poz < tab->pocz_indeks)
    {
        tab->dlugosc += (tab->pocz_indeks - poz);
        tab->tablica = realloc(tab->tablica, tab->dlugosc*sizeof(nowy_typ));
        int przesuniecie = tab->pocz_indeks - poz;
        for (int i=(tab->dlugosc-1); i>=przesuniecie; i--)
        {
            tab->tablica[i] = tab->tablica[i-przesuniecie];
        }
        for (int i=1; i < przesuniecie; i++)
        {
            tab->tablica[i] = 0;
        }
        tab->pocz_indeks = poz;
        tab->tablica[0] = el;
    }
    else
    {
        tab->dlugosc += (poz - (tab->pocz_indeks+tab->dlugosc-1));
        tab->tablica = realloc(tab->tablica, tab->dlugosc*sizeof(nowy_typ));
        tab->tablica[poz-tab->pocz_indeks] = el;

    }
}

void dodaj_element(Tablica *tab, int pozycja, nowy_typ element)
{
    if (tab->dlugosc==0)
    {
        tab->tablica = malloc (sizeof (nowy_typ));
        tab->pocz_indeks = pozycja;
        tab->dlugosc = 1;
        tab->tablica[0] = element;
    }
    else
    {
        if (pozycja >= tab->pocz_indeks && pozycja < (tab->pocz_indeks+tab->dlugosc))
        {
            tab->tablica[pozycja-tab->pocz_indeks] = element;
        }
        else
        {
            rozszerz_tablice(tab, pozycja, element);
        }
    }
}

nowy_typ pobierz_element(Tablica tab, int pozycja)
{
    nowy_typ wynik = tab.tablica[pozycja - tab.pocz_indeks];

    return wynik;
}
