#pragma once
#include <iostream>

class Wektor
{
    public:
    const double dx,dy;
    
    Wektor & operator= (Wektor &) = delete;

    Wektor() = default;
    
    Wektor(double x, double y);

    Wektor(const Wektor &wektor);

    void wypisz();
};

Wektor zlozenie(Wektor a, Wektor b);