#include "wyrazenie.h"
#include "unarne.h"

class Operator2arg : public Operator1arg
{
    protected:
    Wyrazenie *arg2;

    public:
    virtual double oblicz() = 0;
    virtual string opis() = 0;
};

class Dodawanie : public Operator2arg
{
    public:
    
    Dodawanie(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Odejmowanie : public Operator2arg
{

    public:

    Odejmowanie(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Mnozenie : public Operator2arg
{
    public:

    Mnozenie(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Dzielenie : public Operator2arg
{

    public:

    Dzielenie(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Modulo : public Operator2arg
{
    public:

    Modulo(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Potega : public Operator2arg
{
    public:

    Potega(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};

class Logarytm : public Operator2arg
{
    public:

    Logarytm(Wyrazenie *a, Wyrazenie *b);
    double oblicz();
    string opis();
};
