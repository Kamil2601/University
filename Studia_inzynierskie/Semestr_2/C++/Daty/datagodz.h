#pragma once
#include "data.h"

class Datagodz : public Data
{
    protected:
    int godz, min, sek;

    private:
    bool poprawny_czas(int r, int m ,int d , int g, int min_, int s);

    public:

    Datagodz(int r, int m ,int d , int g, int min_, int s);
    Datagodz();
    Datagodz(const Datagodz &d) = default;
    Datagodz & operator= (Datagodz &) = default;
    int godzina() const;
    int minuta() const;
    int sekunda() const;
    Datagodz & operator--();
    Datagodz & operator++();
    Datagodz & operator+=(int sekund);
    Datagodz & operator-=(int sekund);
    bool operator<(Datagodz &);
    bool operator==(Datagodz &);
    void wypisz();

};

int operator-(const Datagodz &d1, const Datagodz &d2);