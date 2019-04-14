#include "wymierne.h"
#include <cmath>
#include <sstream>
#include <string>
#include <map>

using namespace obliczenia;
using namespace std;

int nwd(int a, int b)
{
    int pom;
    if (b>a)
    {
        pom = a;
        a = b;
        b = pom;
    }
    if (b == 0) 
        return a;
    return nwd(b, a % b);
}

int nww(int a, int b)
{
    return a*b/nwd(a,b);
}

Wymierna::Wymierna(int l, int m) throw(Dzielenie_przez_0, Przekroczenie_zakresu)
{
    if (m==0)
    {
        throw Dzielenie_przez_0();
    }

    try
    {
        int dzielnik = nwd(abs(l), abs(m));

        licz = l/dzielnik;
        mian = m/dzielnik;


        if (mian<0)
        {
            licz=-licz;
            mian=-mian;
        }
    }
    catch (...)
    {
        throw Przekroczenie_zakresu();
    }
}

Wymierna::Wymierna(int x) : Wymierna::Wymierna(x,1)
{

}

Wymierna::Wymierna(const Wymierna &w)
{
    licz = w.licz;
    mian = w.mian;
}

Wymierna &Wymierna::operator=(const Wymierna &w)
{
    licz = w.licz;
    mian = w.mian;

    return *this;
}

Wymierna Wymierna::operator-()
{
    Wymierna wynik(-this->licz, this->mian);

    return wynik;
}

Wymierna Wymierna::operator!() throw(Dzielenie_przez_0)
{
    if (licz==0)
    {
        throw Dzielenie_przez_0();
    }

    Wymierna wynik(this->mian, this->licz);

    if (wynik.mian<0)
    {
        wynik.licz = -wynik.licz;
        wynik.mian = -wynik.mian;
    }

    return wynik;
}

Wymierna Wymierna::operator+(const Wymierna &w) throw(Przekroczenie_zakresu)
{
    try
    {
        int n_mian = nww(this->mian,w.mian);
        int n_licz = this->licz*(n_mian/this->mian)+w.licz*(n_mian/w.mian);

        Wymierna wynik(n_licz,n_mian);

        return wynik;
    }
    catch (...)
    {
        throw Przekroczenie_zakresu();
    }
}

Wymierna Wymierna::operator-(const Wymierna &w) throw(Przekroczenie_zakresu)
{
    try
    {
        int n_mian = nww(this->mian,w.mian);
        int n_licz = this->licz*(n_mian/this->mian)-w.licz*(n_mian/w.mian);

        Wymierna wynik(n_licz,n_mian);
        return wynik;
    }
    catch (...)
    {
        throw Przekroczenie_zakresu();
    }

    
}

Wymierna Wymierna::operator*(const Wymierna &w) throw(Przekroczenie_zakresu)
{
    try
    {
        Wymierna wynik(this->licz*w.licz,this->mian*w.mian);
        return wynik;
    }
    catch (...)
    {
        throw Przekroczenie_zakresu();
    }
}

Wymierna::operator double()
{
    return (double)licz/(double)mian;
}

Wymierna::operator int()
{
    return licz/mian;
}

Wymierna Wymierna::operator/(const Wymierna &w) throw (Dzielenie_przez_0)
{
    if (w.licz==0)
    {
        throw Dzielenie_przez_0();
    }
    Wymierna pom = w;
    return *this * !pom;
}

void Wymierna::wypisz()
{
    cout << licz << "/" << mian;
}

ostream &obliczenia::operator<<(ostream &wy, Wymierna &w)
{
    if (w.mian==1)
    {
        wy << w.licz;
        return wy;
    }
    bool ujemna = false;
    if (w.licz<0)
    {
        ujemna = true;
    }

    int p = abs(w.licz);
    int q = w.mian;
    bool okres = false;
    ostringstream out;
    out << p/q << '.';
    p%=q;
    map<unsigned int, int> reszty;
 
    while(p!=0)
    {
        reszty[p] = out.tellp();
        p = p*10;
        out << p/q;
        p%=q;
 
        if (reszty.find(p)!=reszty.end())
        {
             out << ')';
             okres = true;
             break;
        }
    }
    string wynik;

    if (okres==true)
    {
        wynik = out.str().insert(reszty[p], "(");
    }
    else
    {
        wynik = out.str();
    }
    if (ujemna)
    {
        wynik = "-"+wynik;
    }
    wy << wynik;
    return wy;
}

