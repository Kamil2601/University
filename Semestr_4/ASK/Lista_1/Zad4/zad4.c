#include <stdio.h>



void dodaj(int liczba)
{
    static int zmienna = 0;
    zmienna = zmienna + liczba;
    printf("Wartosc zmiennej %d\n", zmienna);
}

int main()
{
    static int k = 2;
    volatile int n = 1; //object of volatile-qualified type
    int *p = (int *)&n;
    int val = *p; //undefined behavior

    dodaj(1);
    dodaj(2);
    dodaj(3);


    return 0;
}