#include "binarne.h"
#include <exception>
#include <cmath>

Dodawanie::Dodawanie(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Dodawanie::oblicz()
{
    return (arg->oblicz() + arg2->oblicz());
}

string Dodawanie::opis()
{
    return "(" + arg->opis() + "+" + arg2->opis() + ")";
}

Odejmowanie::Odejmowanie(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Odejmowanie::oblicz()
{
    return (arg->oblicz() - arg2->oblicz());
}

string Odejmowanie::opis()
{
    return "(" + arg->opis() + "-" + arg2->opis() + ")";
}

Mnozenie::Mnozenie(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Mnozenie::oblicz()
{
    return (arg->oblicz() * arg2->oblicz());
}

string Mnozenie::opis()
{
    return "(" + arg->opis() + "*" + arg2->opis() + ")";
}

Dzielenie::Dzielenie(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Dzielenie::oblicz()
{
    if (arg2->oblicz() == 0)
    {
        throw std::logic_error("Dzielenie przez 0!");
    }

    return (arg->oblicz() / arg2->oblicz());
}

string Dzielenie::opis()
{
    return "(" + arg->opis() + "/" + arg2->opis()  + ")";
}

Modulo::Modulo(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Modulo::oblicz()
{
    if (arg2->oblicz() == 0)
    {
        throw std::logic_error("Dzielenie przez 0!");
    }

    return fmod(arg->oblicz(), arg2->oblicz());
}

string Modulo::opis()
{
    return "(" + arg->opis() + "mod" + arg2->opis() + ")";
}

Potega::Potega(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Potega::oblicz()
{
    return pow(arg->oblicz(), arg2->oblicz());
}

string Potega::opis()
{
    return "(" + arg->opis() + "^" + arg2->opis() + ")";
}

Logarytm::Logarytm(Wyrazenie *a, Wyrazenie *b)
{
    arg = a;
    arg2 = b;
}

double Logarytm::oblicz()
{
    double a = arg->oblicz();
    double b = arg2->oblicz();

    if (a==1)
    {
        throw std::logic_error("Podstawa logarytmu = 1!");
    }
    else if (a<=0)
    {
        throw std::logic_error("Podstawa logarytmu <= 0!");
    }
    else if (b<=0)
    {
        throw std::logic_error("Liczba logarytmowana <= 0!");
    }

    return log(arg2->oblicz())/ log(arg->oblicz());
}

string Logarytm::opis()
{
    return "log[" + arg->opis() + "](" + arg2->opis() + ")";
}