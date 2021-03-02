#pragma once
#include <ctime>
#include <iostream>

class Data
{
    protected:
    static int dniwmiesiacach[2][13];
    static int dniodpoczroku[2][13];
    int dzien, mies, rok;

    static bool przestepny(int r);

    private:
    bool poprawna_data(int r, int m, int d);
    int ileminelo(const Data &d);

    public:
    Data();
    Data(int r, int m, int d);
    Data(const Data &d) = default;
    Data & operator= (Data &) = default;
    virtual int operator-(const Data &d);
    Data & operator--();
    Data & operator++();
    Data & operator+=(int dni);
    Data & operator-=(int dni);
    int d() const;
    int m() const;
    int r() const;
    void wypisz() const;
    
};

