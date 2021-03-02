#pragma once
#include "datagodz.h"
#include <string>

using namespace std;

class Wydarzenie
{
    public:
    Datagodz czas;
    string wyd;

    bool operator<(Wydarzenie &);
    bool operator==(Wydarzenie &);

    //Wydarzenie & operator= ( Wydarzenie &) = default;
    Wydarzenie (Datagodz, string);
    //Wydarzenie(Wydarzenie &&) = default;
    //Wydarzenie(const Wydarzenie &);
    void wypisz();
};