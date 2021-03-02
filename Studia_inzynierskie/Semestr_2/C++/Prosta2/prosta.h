#pragma once
#include "wektor.h"
#include "punkt.h"
#include <cmath>

class Prosta
{
    private:
    double a=0,b=0,c=0;

    void unormuj();

    public:

    Prosta() = default;

    Prosta(Punkt p1, Punkt p2);

    Prosta(Wektor w);

    Prosta(double w_a, double w_b, double w_c);

    Prosta(Prosta p, Wektor w);

    double wsp_a();

    double wsp_b();

    double wsp_c();

    void wypisz();

    bool wektor_prostopadly(Wektor w);

    bool wektor_rownolegly(Wektor w);

    bool pkt_na_prostej(Punkt p);

    double odl_od_pkt(Punkt p);
};

bool rownolegle(Prosta k, Prosta l);

bool prostopadle(Prosta k, Prosta l);

Punkt przeciecie(Prosta k, Prosta l);
