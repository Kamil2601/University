#pragma once
#include "wyrazenie.h"

class Operator1arg : public Wyrazenie
{
    protected:
    Wyrazenie *arg;

    public:
    virtual double oblicz() = 0;
    virtual string opis() = 0;
};

class Sin : public Operator1arg
{
    public:

    Sin(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Cos : public Operator1arg
{

    public:

    Cos(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Exp : public Operator1arg
{

    public:

    Exp(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Ln : public Operator1arg
{
    public:

    Ln(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Abs : public Operator1arg
{

    public:

    Abs(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Przeciw : public Operator1arg
{

    public:

    Przeciw(Wyrazenie *x);
    double oblicz();
    string opis();
};

class Odwrot : public Operator1arg
{

    public:

    Odwrot(Wyrazenie *x);
    double oblicz();
    string opis();
};
