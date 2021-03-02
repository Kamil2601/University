#include "wydarzenie.h"

/*Wydarzenie::Wydarzenie(Wydarzenie &&w)
{
    wyd = w.wyd;
    czas = w.czas;
}

Wydarzenie::Wydarzenie(const Wydarzenie &w)
{
    wyd = w.wyd;
}*/

Wydarzenie::Wydarzenie(Datagodz d, string w)
{
    czas = d;
    wyd = w;
}

bool Wydarzenie::operator<(Wydarzenie &w)
{
    return czas < w.czas;
}

bool Wydarzenie::operator==(Wydarzenie &w)
{
    return czas == w.czas;
}

void Wydarzenie::wypisz()
{
    cout << wyd << " ";
    cout << czas.d() << "." << czas.m() << "." << czas.r() << " r. " << czas.godzina() << ":" << czas.minuta() << "." << czas.sekunda() << endl;
}