#pragma once
#include <iostream>
#include "wyjatki.h"

using namespace std;

namespace obliczenia
{
    class Macierz
    {

    private:
        double **macierz;
        int wys, szer;

    public:
        Macierz(int bok);

        Macierz(int wys, int szer);

        Macierz(const Macierz &m);

        Macierz(Macierz &&m);

        Macierz &operator=(const Macierz &m);

        Macierz &operator=(Macierz &&m);

        ~Macierz();

        Macierz operator+(const Macierz &m);
            //throw (Niewlasciwe_wymiary);
        Macierz operator-(const Macierz &m);
            //throw (Niewlasciwe_wymiary);
        Macierz operator*(double sk);
        Macierz operator*(const Macierz &m);
            //throw (Niewlasciwe_wymiary);

        void transpozycja();

        void zamiana_wierszy(int i, int j);
            //throw (Poza_zakresem);

        void zamiana_kolumn(int i, int j);
            //throw (Poza_zakresem);

        void mnozenie_wiersza(int w, double st);
            //throw (Poza_zakresem);

        void mnozenie_kolumny(int k, double st);
            //throw (Poza_zakresem);

        void dodanie_wierszy(int i, int j, int st);
            //throw (Poza_zakresem);

        void dodanie_kolumn(int i, int j, int st);
            //throw (Poza_zakresem);

        Macierz minor_macierzy(int i, int j);

        Macierz macierz_odwrotna();
            //throw (Niewlasciwe_wymiary,Wyznacznik_rowny_0);

        double wyznacznik();

        friend istream &operator>>(istream &we, Macierz &m);

        friend ostream &operator<<(ostream &wy, const Macierz &m);

        friend Macierz operator+(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);

        friend Macierz operator-(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);

        friend Macierz operator*(const Macierz &m, double sk);

        friend Macierz operator*(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);

        
    };

    istream &operator>>(istream &we, Macierz &m);

    ostream &operator<<(ostream &wy, const Macierz &m);

    Macierz operator+(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);

    Macierz operator-(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);

    Macierz operator*(const Macierz &m, double sk);

    Macierz operator*(const Macierz &m1, const Macierz &m2);// throw(Niewlasciwe_wymiary);
}



