#include "stos.h"

using namespace std;

Stos::Stos(int rozmiar)
{
    stos = new string[rozmiar];
    pojemnosc = rozmiar;
    ile=0;
}

Stos::Stos() : Stos::Stos(1)
{
    
}

Stos::Stos(initializer_list<string> lista)
{
    stos = new string[lista.size()];
    pojemnosc = lista.size();
    ile = lista.size();
    vector <string> w = lista;
    for (int i=0; i<pojemnosc; i++)
    {
        stos[i] = w[i];
    }
}

Stos::Stos(Stos &s)
{
    stos = new string[s.pojemnosc];
    ile = s.ile;
    pojemnosc = s.pojemnosc;
    for (int i=0; i<pojemnosc; i++)
    {
        stos[i]=s.stos[i];
    }
}

Stos & Stos::operator= (Stos &s)
{
    delete [] stos;    
    stos = new string[s.pojemnosc];
    pojemnosc = s.pojemnosc;
    ile = s.ile;
    for (int i=0; i<ile; i++)
    {
        stos[i] = s.stos[i];
    }

    return *this;
}

Stos::Stos(Stos &&s)
{
    stos = s.stos;
    pojemnosc = s.pojemnosc;
    ile = s.ile;
    s.ile = 0;
    s.pojemnosc = 0;
    s.stos = NULL;
}

Stos & Stos::operator= (Stos &&s)
{
    delete [] stos;
    stos = s.stos;
    pojemnosc = s.pojemnosc;
    ile = s.ile;
    s.ile = 0;
    s.pojemnosc = 0;
    s.stos = NULL;

    return *this;
}

Stos::~Stos()
{
    delete [] stos;
}

void Stos::wloz(string napis)
{
    if (ile<pojemnosc)
    {
        stos[ile] = napis;
        ile++;
    }
    else
    {
        throw out_of_range("stos pelny!");
    }
}

string Stos::sciagnij()
{
    if (ile == 0)
    {
        throw logic_error("Stos pusty!");
    }
    else
    {
        string wynik;
        wynik = stos[ile-1];
        stos[ile-1]="";
        ile--;
        return wynik;
    }
}

string Stos::sprawdz()
{
    if (ile == 0)
    {
        throw logic_error("Stos pusty!");
    }
    else
    {
        string wynik;
        wynik = stos[ile-1];
        return wynik;
    }
}

int Stos::rozmiar()
{
    return ile;
}
