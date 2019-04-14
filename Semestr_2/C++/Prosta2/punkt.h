#pragma once
#include "wektor.h"

class Punkt
{
    public:
    const double x,y;

    Punkt & operator= (Punkt &) = delete;

    Punkt()=default;

    Punkt(double x_p, double y_p);

    Punkt(Punkt p, Wektor w);

    Punkt(const Punkt &pukt);

    void wypisz();
};