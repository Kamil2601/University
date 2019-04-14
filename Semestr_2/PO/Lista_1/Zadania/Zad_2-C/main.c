//Kamil Michalak 299089
//Program liczacy na ulamkach
#include "ulamki.h"

int main()
{
    printf("Program wykonuje obliczenia na ulamkach. \nPodaj 2 ulamki.\n");
    Ulamek a = wczytaj_ulamek();
    Ulamek b = wczytaj_ulamek();
    Ulamek kopia = b;
    Ulamek *wynik;

    wynik = dodawanie_w(a, b);
    printf ("\nDodawanie: ");
    wypisz_ulamek(*wynik);

    wynik = odejmowanie_w(a, b);
    printf ("Odejmowanie: ");
    wypisz_ulamek(*wynik);

    wynik = mnozenie_w(a, b);
    printf ("Mnozenie: ");
    wypisz_ulamek(*wynik);

    wynik = dzielenie_w(a, b);
    if (wynik!=NULL)
    {
        printf ("Dzielenie: ");
        wypisz_ulamek(*wynik);
    }

    printf("\nDruga metoda:");

    dodawanie_m(a, &kopia);
    printf ("\nDodawanie: ");
    wypisz_ulamek(kopia);
    kopia = b;

    odejmowanie_m(a, &kopia);
    printf ("Odejmowanie: ");
    wypisz_ulamek(kopia);
    kopia = b;

    mnozenie_m(a, &kopia);
    printf ("Mnozenie: ");
    wypisz_ulamek(kopia);
    kopia = b;

    dzielenie_m(a, &kopia);
    if (kopia.licznik != 0)
    {
        printf("Dzielenie: ");
        wypisz_ulamek(kopia);
    }    
    return 0;
}