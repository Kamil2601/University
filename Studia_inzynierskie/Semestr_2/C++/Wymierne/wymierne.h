#pragma once
#include <iostream>
#include "wyjatki.h"

namespace obliczenia
{
    class Wymierna
    {
        private:
        int licz, mian;

        public:

        Wymierna(int l, int m) throw (Dzielenie_przez_0, Przekroczenie_zakresu);

        Wymierna(int x);

        Wymierna(const Wymierna &w);

        Wymierna &operator=(const Wymierna &w);

        Wymierna operator-();

        Wymierna operator!() throw(Dzielenie_przez_0);

        Wymierna operator+(const Wymierna &w) throw(Przekroczenie_zakresu);

        Wymierna operator-(const Wymierna &w) throw(Przekroczenie_zakresu);

        Wymierna operator*(const Wymierna &w) throw(Przekroczenie_zakresu);

        Wymierna operator/(const Wymierna &w) throw(Dzielenie_przez_0);

        void wypisz();

        explicit operator double();

        explicit operator int();

        friend ostream &operator<<(ostream &wy, Wymierna &w);
    };

    ostream &operator<<(ostream &wy, Wymierna &w);

}