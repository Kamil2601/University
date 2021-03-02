#pragma once
#include <string>

using namespace std;

class Wyjatek_wymierny : public exception
{
    public:
    string napis;
    Wyjatek_wymierny();
    Wyjatek_wymierny(string n);
    string what();
};

class Dzielenie_przez_0 : public Wyjatek_wymierny
{
    public:
    Dzielenie_przez_0();
};

class Przekroczenie_zakresu : public Wyjatek_wymierny
{
    public:
    Przekroczenie_zakresu();
};