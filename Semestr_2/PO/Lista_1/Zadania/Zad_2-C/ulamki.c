//Kamil Michalak 299089
#include "ulamki.h"

int nwd(int a, int b)
{
    if (b>a)
    {
        int pom = b;
        b = a;
        a = pom;
    }
    if (b == 0)
    { 
        return a;
    }
    return nwd(b, (a % b));
}

int nww(int a, int b)
{
    return (a*b)/nwd(a,b);
}

void wspolny_mianownik(Ulamek *a, Ulamek *b)
{
    int nowy_mianownik = nww(a->mianownik, b->mianownik);

    a->licznik *= nowy_mianownik/a->mianownik;
    a->mianownik = nowy_mianownik;

    b->licznik *= nowy_mianownik/b->mianownik;
    b->mianownik = nowy_mianownik;
}

Ulamek skroc (Ulamek x)
{
    bool ujemny = false;
    if (x.mianownik < 0)
    {
        x.mianownik *= -1;
        x.licznik *= -1;
    }
    if (x.licznik < 0)
    {
        ujemny = true;
        x.licznik *= -1;
    }

    int dzielnik = nwd (x.licznik, x.mianownik);
    x.licznik/=dzielnik;
    x.mianownik/=dzielnik;

    if (ujemny == true)
    {
        x.licznik *= -1;
    }

    return x;
}

Ulamek wczytaj_ulamek()
{
    Ulamek x;
    printf("Podaj licznik: ");
    scanf("%d", &x.licznik);
    printf("Podaj mianownik: ");
    scanf("%d", &x.mianownik);
    
    while (x.mianownik == 0)
    {
        printf("Podaj mianownik różny od 0!: ");
        scanf("%d", &x.mianownik);
    }

    if (x.mianownik < 0)
    {
        x.mianownik *= -1;
        x.licznik *= -1;
    }

    return x;
}

Ulamek *dodawanie_w(Ulamek a, Ulamek b)
{
    wspolny_mianownik(&a, &b);

    Ulamek *wynik = malloc (sizeof(Ulamek));

    wynik->licznik = a.licznik + b.licznik;
    wynik->mianownik = a.mianownik;

    *wynik = skroc(*wynik);

    return wynik;
}

void dodawanie_m(Ulamek a, Ulamek *b)
{
    wspolny_mianownik(&a, b);

    b->licznik = a.licznik + b->licznik;
    b->mianownik = a.mianownik;

    *b = skroc(*b);
}

Ulamek *odejmowanie_w(Ulamek a, Ulamek b)
{
    
    wspolny_mianownik(&a, &b);

    Ulamek *wynik = malloc (sizeof(Ulamek));

    wynik->licznik = a.licznik - b.licznik;
    wynik->mianownik = a.mianownik;

    *wynik = skroc(*wynik);

    return wynik;

}

void odejmowanie_m(Ulamek a, Ulamek *b)
{
    wspolny_mianownik(&a, b);

    b->licznik = a.licznik - b->licznik;
    b->mianownik = a.mianownik;

    *b = skroc(*b);
}

Ulamek *mnozenie_w(Ulamek a, Ulamek b)
{
    Ulamek *wynik = malloc (sizeof(Ulamek));

    wynik->licznik = a.licznik * b.licznik;
    wynik->mianownik = a.mianownik * b.mianownik;

    *wynik = skroc(*wynik);

    return wynik;
}

void mnozenie_m(Ulamek a, Ulamek *b)
{
    b->licznik = a.licznik * b->licznik;
    b->mianownik = a.mianownik * b->mianownik;

    *b = skroc(*b);
}

Ulamek *dzielenie_w(Ulamek a, Ulamek b)
{
    if (b.licznik == 0)
    {
        printf("Dzielenie przez 0!\n");
        return NULL;
    }
    int pom = b.licznik;
    b.licznik = b.mianownik;
    b.mianownik = pom;

    return mnozenie_w(a, b);
}

void dzielenie_m(Ulamek a, Ulamek *b)
{
    if (b->licznik == 0)
    {
        printf("Dzielenie przez 0!\n");
    }
    else
    {
        int pom = b->licznik;
        b->licznik = b->mianownik;
        b->mianownik = pom;

        mnozenie_m(a, b);
    }
}

void wypisz_ulamek(Ulamek x)
{
    printf ("%d / %d \n", x.licznik, x.mianownik);
}
