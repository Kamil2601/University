#pragma once
#include <string>

using namespace std;

class Wyjatek : exception
{
    public:
    string napis;
    Wyjatek();
    Wyjatek(string n);
    string what();
};

class Wyznacznik_rowny_0 : public Wyjatek
{
    public:
    Wyznacznik_rowny_0();
};

class Niewlasciwe_wymiary : public Wyjatek
{
    public:
    Niewlasciwe_wymiary();
};

class Poza_zakresem : public Wyjatek
{
    public:
    Poza_zakresem();
};