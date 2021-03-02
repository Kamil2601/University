#include "wektor.h"

using namespace std;

Wektor::Wektor(double x, double y) : dx(x), dy(y)
{

}

Wektor::Wektor(const Wektor &wektor) : dx(wektor.dx), dy(wektor.dy)
{
    
}

void Wektor::wypisz()
{
    cout << "[ " << dx << " , " << dy << " ]" << endl;
}

Wektor zlozenie(Wektor a, Wektor b)
{
    Wektor wynik((a.dx+b.dx), (a.dy+b.dy));

    return wynik;
}