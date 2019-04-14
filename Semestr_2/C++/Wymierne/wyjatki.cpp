#include "wyjatki.h"


Wyjatek_wymierny::Wyjatek_wymierny()
{
    napis = "Blad";
}

Wyjatek_wymierny::Wyjatek_wymierny(string n)
{
    napis = n;
}

string Wyjatek_wymierny::what()
{
    return napis;
}

Dzielenie_przez_0::Dzielenie_przez_0() : Wyjatek_wymierny("Dzielenie_przez_0!")
{

}

Przekroczenie_zakresu::Przekroczenie_zakresu() : Wyjatek_wymierny("Przekroczenie zakresu!")
{
    
}

