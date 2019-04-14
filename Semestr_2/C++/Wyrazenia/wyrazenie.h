#pragma once
#include <iostream>
#include <string>
#include <cmath>

using namespace std;

class Wyrazenie
{
    public:
    
    virtual double oblicz() = 0;

    virtual string opis() = 0;

};