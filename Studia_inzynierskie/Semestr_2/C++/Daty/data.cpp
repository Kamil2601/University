#include "data.h"

using namespace std;

int Data::dniwmiesiacach[2][13] = {
{0,31,28,31,30,31,30,31,31,30,31,30,31}, // lata zwykłe
{0,31,29,31,30,31,30,31,31,30,31,30,31} // lata przestępne
};

int Data::dniodpoczroku[2][13] = {
{0,31,59,90,120,151,181,212,243,273,304,334,365}, // lata zwykłe
{0,31,60,91,121,152,182,213,244,274,305,335,366} // lata przestępne
};

using namespace std;

bool Data::przestepny(int r)
{
    if (r % 400 == 0)
    {
        return true;
    }
    else if (r%100 == 0)
    {
        return false;
    }
    else if (r%4 == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool Data::poprawna_data(int r, int m, int d)
{
    int n;
    if (przestepny(r))
    {
        n = 1;
    }
    else
    {
        n = 0;
    }
    if (m < 1 || m > 12)
    {
        return false;
    }
    else if (d < 1 || d > dniwmiesiacach[n][m])
    {
        return false;
    }
    else
    {
        return true;
    }
}

int Data::ileminelo(const Data& d)
{
    int lat_p = d.rok/4 - d.rok/100 + d.rok/400;
    int dni = (d.rok-1)*365+lat_p;
    int n=0;
    if (przestepny(d.rok))
    {
        n=1;
    }
    int wynik = dni+dniodpoczroku[n][d.mies-1]+d.dzien;

    return wynik;
}

Data::Data()
{
    time_t czas = time( NULL );
    struct tm * t;
    t = localtime( & czas );
    rok = t->tm_year+1900;
    mies = t->tm_mon+1;
    dzien = t->tm_mday;
}

Data::Data(int r, int m, int d)
{
    if (!poprawna_data(r,m,d))
    {
        throw invalid_argument("Podano bledna date!");
    }
    else
    {
        rok = r;
        mies = m;
        dzien = d;
    }
}


int Data::operator-(const Data& d)
{
    return ileminelo(*this) - Data::ileminelo(d);
}

int Data::d() const
{
    return dzien;
}

int Data::m() const
{
    return mies;
}

int Data::r() const
{
    return rok;
}

Data & Data::operator++()
{
    /*int n=0;
    if (przestepny(rok))
    {
        n=1;
    }
    if (dzien<dniwmiesiacach[n][mies])
    {
        dzien++;
    }
    else if (mies<12)
    {
        dzien = 1;
        mies++;
    }
    else
    {
        dzien = 1;
        mies = 1;
        rok++;
    }*/

    return *this+=1;
}
Data & Data::operator--()
{
    /*int n=0;
    if (przestepny(rok))
    {
        n=1;
    }
    if (dzien>1)
    {
        dzien--;
    }
    else if (mies>1)
    {
        mies--;
        dzien = dniwmiesiacach[n][mies];
    }
    else
    {
        rok--;
        mies = 12;
        dzien = 31;
    }*/

    return *this-=1;
}

Data & Data::operator+=(int dni)
{
    int n=0;
    
    while (dni>0)
    {
        n=0;
        if (przestepny(rok))
        {
            n=1;
        }
        if (dzien+dni<=dniwmiesiacach[n][mies])
        {
            dzien+=dni;
            dni = 0;
        }
        else if (mies<12)
        {
            dni-=(dniwmiesiacach[n][mies]-dzien+1);
            mies++;
            dzien = 1;  
        }
        else
        {
            dni-=(dniwmiesiacach[n][mies]-dzien+1);
            rok++;
            mies = 1;
            dzien = 1;  
        }
    }

    return *this;
}

Data & Data::operator-=(int dni)
{
    int n=0;
    
    while (dni>0)
    {
        n=0;
        if (przestepny(rok))
        {
            n=1;
        }
        if (dzien-dni>0)
        {
            dzien-=dni;
            dni = 0;
        }
        else if (mies>1)
        {
            dni-=dzien;
            mies--;
            dzien = dniwmiesiacach[n][mies];  
        }
        else
        {
            dni-=dzien;
            rok--;
            mies = 12;
            dzien = 31;  
        }
    }

    return *this;
}

void Data::wypisz() const
{
    cout << dzien << "." << mies << "." << rok << " r" << endl;
}