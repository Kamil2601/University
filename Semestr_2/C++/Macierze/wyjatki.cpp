#include "wyjatki.h"


Wyjatek::Wyjatek()
{
    napis = "Blad";
}

Wyjatek::Wyjatek(string n)
{
    napis = n;
}

string Wyjatek::what()
{
    return napis;
}

Wyznacznik_rowny_0::Wyznacznik_rowny_0() : Wyjatek("Wyznacznik_rowny_0")
{

}

Niewlasciwe_wymiary::Niewlasciwe_wymiary() : Wyjatek("Niewlasciwe_wymiary_macierzy")
{

}

Poza_zakresem::Poza_zakresem() : Wyjatek("Indeks poza, zakresem")
{
    
}