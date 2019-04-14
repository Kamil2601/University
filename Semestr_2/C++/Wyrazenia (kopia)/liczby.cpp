#include "liczby.h"
#include <algorithm>
#include <cmath>

using namespace std;

vector<pair<string,double>> Zmienna::tab;

Liczba::Liczba(double x)
{
    liczba = x;
}

double Liczba::oblicz()
{
    return liczba;
}

string Liczba::opis()
{
    return to_string(liczba);
}

double Pi::oblicz()
{
    return M_PI;
}

string Pi::opis()
{
    return "pi";
}

double E::oblicz()
{
    return M_E;
}

string E::opis()
{
    return "e";
}

double FI::oblicz()
{
    return (1+sqrt(5))/2;
}

string FI::opis()
{
    return "fi";
}

Zmienna::Zmienna(string x)
{
    symbol = x;
}

Zmienna::Zmienna(string x, double wart)
{
    symbol = x;
    zapisz(x, wart);
}

void Zmienna::zapisz(string sym, double wart)
{
    bool dodane = false;
    for(auto &x : tab)
    {
        if(x.first==sym)
        {
             x.second = wart;
             dodane = true;
             break;
        }
    }
    if (!dodane)
    {
        tab.push_back(make_pair(sym,wart));
    }

}

double Zmienna::czytaj(string sym)
{
    for(auto &x : tab)
    {
        if(x.first==sym)
        {
            return x.second;
        }
    }

    throw invalid_argument("Brak przypisania wartosci do podanej zmiennej");
}

string Zmienna::opis()
{
    return symbol;
}

double Zmienna::oblicz()
{
    return czytaj(symbol);
}