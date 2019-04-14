#include "datagodz.h"

using namespace std;
/*
Datagodz::Datagodz(Datagodz &d)
{
    dzien = d.dzien;
    mies = d.mies;
    rok = d.rok;
    sek = d.sek;
    min = d.min;
    godz = d.godz;
}*/

/*Datagodz::Datagodz(const Datagodz &d)
{
    rok = d.r();
    mies = d.m();
    dzien = d.d();
    godz = d.godzina();
    min = d.minuta();
    sek = d.sekunda();
}*/

bool Datagodz::poprawny_czas(int r, int m ,int d , int g, int min_, int s)
{
    int n=0;
    if (przestepny(r))
    {
        n = 1;
    }
    if (m<1 || m>12 || d < 1 || d > dniwmiesiacach[n][m] || g < 0 || g > 23 || min_ < 0 || min_ > 59 || s < 0 || s>59)
    {
        return false;
    }
    else
    {
        return true;
    }
}


Datagodz::Datagodz(int r = 2000, int m = 1,int d = 1 , int g = 12, int min_ = 0, int s = 0)
{
    
    if (poprawny_czas(r, m , d , g, min_, s)==false)
    {
        throw invalid_argument("Bledne dane");
    }
    rok = r;
    mies = m;
    dzien = d;
    godz = g;
    min = min_;
    sek = s;
}

Datagodz::Datagodz()
{
    time_t czas = time( NULL );
    struct tm * t;
    t = localtime( & czas );
    rok = t->tm_year+1900;
    mies = t->tm_mon+1;
    dzien = t->tm_mday;
    godz = t->tm_hour;
    min = t->tm_min;
    sek = t->tm_sec;
}

int Datagodz::godzina() const
{
    return godz;
}

int Datagodz::minuta() const
{
    return min;
}

int Datagodz::sekunda() const
{
    return sek;
}

int operator-(const Datagodz &d1, const Datagodz &d2)
{
    Data pom1(d1.r(),d1.m(),d1.d());
    Data pom2(d2.r(),d2.m(),d2.d());

    int x = pom1 - pom2;
    x*=24*60*60;
    int s1 = d1.godzina()*3600+d1.minuta()*60+d1.sekunda();
    int s2 = d2.godzina()*3600+d2.minuta()*60+d2.sekunda();
    int wynik = x + (s1-s2);
    return wynik;
}

Datagodz & Datagodz::operator++()
{
    /*int n = 0;
    if (przestepny(rok))
    {
        n=1;
    }

    if (sek<60)
    {
        sek++;
    }
    else if (min<60)
    {
        sek = 0;
        min++;
    }
    else if (godz<23)
    {
        godz++;
        sek = 0;
        min = 0;
    }
    else if (dzien < dniwmiesiacach[n][mies])
    {
        dzien++;
        sek = 0;
        min = 0;
        godz = 0;
    }
    else if (mies < 12)
    {
        mies++;
        dzien = 1;
        sek = 0;
        min = 0;
        godz = 0;
    }
    else
    {
        rok++;
        mies = 1;
        dzien = 1;
        sek = 0;
        min = 0;
        godz = 0;
    }*/

    return *this+=1;
}

Datagodz & Datagodz::operator--()
{
    /*
    int n = 0;
    if (przestepny(rok))
    {
        n=1;
    }
    if (sek>0)
    {
        sek--;
    }
    else if (min>0)
    {
        min--;
        sek = 59;
    }
    else if (godz>0)
    {
        godz--;
        min = 59;
        sek = 59;
    }
    else if (dzien>1)
    {
        dzien--;
        godz = 23;
        min = 59;
        sek = 59;
    }
    else if (mies>1)
    {
        mies--;
        dzien = dniwmiesiacach[n][mies];
        godz = 23;
        min = 59;
        sek = 59;
    }
    else
    {
        rok--;
        mies = 12;
        dzien = dniwmiesiacach[n][mies];
        godz = 23;
        min = 59;
        sek = 59;
    }*/

    return *this-=1;
}

Datagodz & Datagodz::operator+=(int sekund)
{
    int n = 0;
    while (sekund>0)
    {
        n = 0;
        if (przestepny(rok))
        {
            n = 1;
        }
        if (sek+sekund<60)
        {
            sek+=sekund;
            sekund = 0;
        }
        else if (min<59)
        {
            min++;
            sekund -= (60 - sek);
            sek = 0;
        }
        else if (godz < 23)
        {
            godz++;
            sekund -= (60 - sek);
            sek = 0;
            min = 0;
        }
        else if (dzien<dniwmiesiacach[n][mies])
        {
            dzien++;
            sekund -= (60 - sek);
            sek = 0;
            min = 0;
            godz = 0;
        }
        else if (mies < 12)
        {
            mies++;
            sekund -= (60 - sek);
            sek = 0;
            min = 0;
            godz = 0;
            dzien = 1;
        }
        else
        {
            rok++;
            sekund -= (60 - sek);
            sek = 0;
            min = 0;
            godz = 0;
            dzien = 1;
            mies = 1;
        }
    }

    return *this;
}

Datagodz & Datagodz::operator-=(int sekund)
{
    int n = 0;
    while (sekund>0)
    {
        n = 0;
        if (przestepny(rok))
        {
            n = 1;
        }
        if (sek-sekund>=0)
        {
            sek-=sekund;
            sekund=0;
        }
        else if (min>0)
        {
            min--;
            sekund -= (sek+1);
            sek = 59;
        }
        else if (godz>0)
        {
            godz--;
            sekund -= (sek+1);
            sek = 59;
            min = 59;
        }
        else if (dzien>1)
        {
            dzien--;
            sekund -= (sek+1);
            sek = 59;
            min = 59;
            godz = 23;
        }
        else if (mies>1)
        {
            mies--;
            sekund -= (sek+1);
            sek = 59;
            min = 59;
            godz = 23;
            dzien = dniwmiesiacach[n][mies];
        }
    }

    return *this;
}

bool Datagodz::operator<(Datagodz &d)
{
    if (rok<d.r())
    {
        return true;
    }
    else if (rok>d.rok)
    {
        return false;
    }
    else if (mies < d.mies)
    {
        return true;
    }
    else if (mies > d.mies)
    {
        return false;
    }
    else if (dzien < d.dzien)
    {
        return true;
    }
    else if (dzien > d.dzien)
    {
        return false;
    }
    else if (godz < d.godz)
    {
        return true;
    }
    else if (godz > d.godz)
    {
        return false;
    }
    else if(min < d.min)
    {
        return true;
    }
    else if(min > d.min)
    {
        return false;
    }
    else if (sek < d.sek)
    {
        return true;
    }
    else 
    {
        return false;
    }
    
}

bool Datagodz::operator==(Datagodz &d)
{
    if (rok == d.rok && mies == d.mies && dzien == d.dzien && godz == d.godz && min == d.min && sek == d.sek)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void Datagodz::wypisz()
{
    cout << dzien << "." << mies << "." << rok << " r. " << godz << ":" << min << "." << sek << endl;
}