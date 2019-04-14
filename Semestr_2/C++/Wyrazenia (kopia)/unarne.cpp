#include "unarne.h"

using namespace std;

Sin::Sin(Wyrazenie *x)
{
    arg = x;
}

double Sin::oblicz()
{
    return sin(arg->oblicz());
}

string Sin::opis()
{
    return "sin(" + arg->opis() + ")";
}

Cos::Cos(Wyrazenie *x)
{
    arg = x;
}

double Cos::oblicz()
{
    return cos(arg->oblicz());
}

string Cos::opis()
{
    return "cos(" + arg->opis() + ")";
}

Exp::Exp(Wyrazenie *x)
{
    arg = x;
}

double Exp::oblicz()
{
    return exp(arg->oblicz());
}

string Exp::opis()
{
    return "exp(" + arg->opis() + ")";
}

Ln::Ln(Wyrazenie *x)
{
    arg = x;
}

double Ln::oblicz()
{
    double l = arg->oblicz();
    if (l<=0)
    {
        throw logic_error("Liczba logarytmowana =0!");
    }

    return log(arg->oblicz());
}

string Ln::opis()
{
    return "ln(" + arg->opis() + ")";
}

Abs::Abs(Wyrazenie *x)
{
    arg = x;
}

double Abs::oblicz()
{
    return abs(arg->oblicz());
}

string Abs::opis()
{
    return "|" + arg->opis() + "|";
}

Przeciw::Przeciw(Wyrazenie *x)
{
    arg = x;
}

double Przeciw::oblicz()
{
    return -arg->oblicz();
}

string Przeciw::opis()
{
    return "(-" + arg->opis() + ")";
}

Odwrot::Odwrot(Wyrazenie *x)
{
    arg = x;
}

double Odwrot::oblicz()
{
    double a = arg->oblicz();

    if (a==0)
    {
        throw std::logic_error("Dzielenie przez 0!");
    }

    return 1/arg->oblicz();
}

string Odwrot::opis()
{
    return "(1/" + arg->opis() + ")";
}