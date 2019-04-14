//Kamil Michalak 299089
#include "tablica.h"
#include <stdbool.h>


int main()
{
    bool koniec = false;
    int wybor;
    int element, pozycja;

    Tablica tab = inicjuj();

    printf("Program obsluguje tablice o indeksach calkowitych\n");

    while (!koniec)
    {
        printf ("Wybierz operacje\n1.Dodanie elementu\n2.Pobranie elementu\n3.Koniec\nWybor: ");
        scanf ("%d", &wybor);

        switch (wybor)
        {
            case 1:
            {
                printf ("Podaj wartosc elementu (liczba calkowita): ");
                scanf ("%d", &element);
                printf ("Podaj nr indeksu: ");
                scanf ("%d", &pozycja);
                dodaj_element(&tab, pozycja, element);
                printf("\n");
                break;
            }
            case 2:
            {
                printf ("Podaj nr indeksu: ");
                scanf ("%d", &pozycja);
                if (pozycja < tab.pocz_indeks || pozycja >= (tab.pocz_indeks+tab.dlugosc))
                {
                    printf ("Tablica nie zawiera takiego indeksu!\n\n");
                }
                else
                {
                    printf ("Wartosc elementu:  %d\n\n", pobierz_element(tab, pozycja));
                }
                break;
            }
            default:
            {
                koniec = true;
                break;
            }
        }
    }

    return 0;
}
