//Kamil Michalak 299089
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct Ulamek
{
    int licznik;
    int mianownik;
} Ulamek;

int nwd(int a, int b);

int nww(int a, int b);

void wspolny_mianownik(Ulamek *a, Ulamek *b);

Ulamek skroc (Ulamek x);

Ulamek wczytaj_ulamek();

Ulamek *dodawanie_w(Ulamek a, Ulamek b);

void dodawanie_m(Ulamek a, Ulamek *b);

Ulamek *odejmowanie_w(Ulamek a, Ulamek b);

void odejmowanie_m(Ulamek a, Ulamek *b);

Ulamek *mnozenie_w(Ulamek a, Ulamek b);

void mnozenie_m(Ulamek a, Ulamek *b);

Ulamek *dzielenie_w(Ulamek a, Ulamek b);

void dzielenie_m(Ulamek a, Ulamek *b);

void wypisz_ulamek(Ulamek x);



