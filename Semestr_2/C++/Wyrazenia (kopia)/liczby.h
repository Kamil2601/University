#include "wyrazenie.h"
#include <vector>

class Liczba : public Wyrazenie
{
    double liczba;
    
    public:

    Liczba(double x);
    double oblicz();
    string opis();
};

class Stala : public Wyrazenie
{
    public:

    virtual double oblicz() = 0;

    virtual string opis() = 0;
};

class Pi : public Stala
{    
    public:

    double oblicz();
    string opis();
};

class E : public Stala
{    
    public:

    double oblicz();
    string opis();
};

class FI : public Stala
{
    public:

    double oblicz();
    string opis();
};

class Zmienna : public Wyrazenie
{
    string symbol;
    static vector<pair<string,double>> tab;
    
    public:

    static double czytaj(string sym);
    static void zapisz(string sym, double wart);
    
    Zmienna(string x);
    Zmienna(string x, double wart);
    double oblicz();
    string opis();
};