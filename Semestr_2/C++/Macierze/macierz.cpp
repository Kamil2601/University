#include "macierz.h"

using namespace std;
using namespace obliczenia;

Macierz::Macierz(int bok)
{
    macierz = new double* [bok];

    wys = bok;
    szer = bok;

    for (int i=0; i<bok; i++)
    {
        macierz[i] = new double [bok];
    }

    for (int i=0; i<bok; i++)
    {
        for (int j=0; j<bok; j++)
        {
            if (i==j)
            {
                macierz[i][j] = 1;
            }
            else
            {
                macierz[i][j] = 0;
            }
        }
    }
}

Macierz::Macierz(int w, int s)
{
    wys = w;
    szer = s;

    macierz = new double* [wys];

    for (int i=0; i<wys; i++)
    {
        macierz[i] = new double [szer];
    }

    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            macierz[i][j]=0;
        }
    }
}

Macierz::Macierz(const Macierz &m)
{
    this->szer = m.szer;
    this->wys = m.wys;
    this->macierz = new double* [this->wys];

    for (int i=0; i<wys; i++)
    {
        this->macierz[i] = new double[this->szer];
    }
}

Macierz::Macierz(Macierz &&m)
{
    this->szer = m.szer;
    this->wys = m.wys;
    this->macierz = m.macierz;
    m.macierz = nullptr;
}

Macierz & Macierz::operator=(const Macierz &m)
{
    for (int i=0; i<this->wys; i++)
    {
        delete [] this->macierz[i];
    }

    delete [] this->macierz;

    this->wys = m.wys;
    this->szer = m.szer;

    this->macierz = new double* [this->wys];

    for (int i=0; i<this->wys; i++)
    {
        this->macierz[i] = new double [this->szer];
    }

    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            this->macierz[i][j] = m.macierz[i][j];
        }
    }

    return *this;
}

Macierz & Macierz::operator=(Macierz &&m)
{
    if (this == &m)
    {
        return *this;
    }


    for (int i=0; i<this->wys; i++)
    {
        if (this->macierz[i]!=nullptr)
            delete [] this->macierz[i];
    }

    if (this->macierz)
        delete [] this->macierz;

    this->macierz = m.macierz;

    m.macierz = nullptr;

    return *this;
}

Macierz::~Macierz()
{
    for (int i=0; i<wys; i++)
    {
        delete [] macierz[i];
    }

    delete [] macierz;
}

Macierz Macierz::operator+(const Macierz &m) throw (Niewlasciwe_wymiary)
{
    if (this->wys!=m.wys || this->szer!=m.szer)
    {
        throw Niewlasciwe_wymiary();
    }

    Macierz wynik(wys, szer);

    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            wynik.macierz[i][j] = this->macierz[i][j]+m.macierz[i][j];
        }
    }

    return wynik;
 }

 Macierz obliczenia::operator+(const Macierz &m1, const Macierz &m2) throw(Niewlasciwe_wymiary)
 {
    if (m1.wys!=m2.wys || m1.szer!=m2.szer)
    {
        throw new Niewlasciwe_wymiary();
    }

    Macierz wynik(m1.wys, m1.szer);

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            wynik.macierz[i][j] = m1.macierz[i][j]+m2.macierz[i][j];
        }
    }

    return wynik;
 }


Macierz Macierz::operator-(const Macierz &m) throw (Niewlasciwe_wymiary)
{
    if (this->wys!=m.wys || this->szer!=m.szer)
    {
        throw Niewlasciwe_wymiary();
    }

    Macierz wynik(wys, szer);

    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            wynik.macierz[i][j] = this->macierz[i][j]-m.macierz[i][j];
        }
    }

    return wynik;
 }

Macierz obliczenia::operator-(const Macierz &m1, const Macierz &m2) throw(Niewlasciwe_wymiary)
{
    if (m1.wys!=m2.wys || m1.szer!=m2.szer)
    {
        throw new Niewlasciwe_wymiary();
    }

    Macierz wynik(m1.wys, m1.szer);

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            wynik.macierz[i][j] = m1.macierz[i][j]-m2.macierz[i][j];
        }
    }

    return wynik;
}

Macierz Macierz::operator*(double sk)
{
    Macierz wynik(wys,szer);

    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            wynik.macierz[i][j] = this->macierz[i][j]*sk;
        }
    }

    return wynik;
}

Macierz obliczenia::operator*(const Macierz &m, double sk)
{
    Macierz wynik(m.wys,m.szer);

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            wynik.macierz[i][j] = m.macierz[i][j]*sk;
        }
    }

    return wynik;
}


Macierz Macierz::operator*(const Macierz &m) throw (Niewlasciwe_wymiary)
{
    if (this->szer!=m.wys)
    {
        throw new Niewlasciwe_wymiary();
    }

    int n = this->szer;

    Macierz wynik(this->wys, m.szer);

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            for (int k=0; k<n; k++)
            {
                wynik.macierz[i][j]+= this->macierz[i][k]*m.macierz[k][j];
            }
        }
    }

    return wynik;
}

Macierz obliczenia::operator*(const Macierz &m1, const Macierz &m2) throw(Niewlasciwe_wymiary)
{
    if (m1.szer!=m2.wys)
    {
        throw new Niewlasciwe_wymiary();
    }

    int n = m1.szer;

    Macierz wynik(m1.wys, m2.szer);

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            for (int k=0; k<n; k++)
            {
                wynik.macierz[i][j]+= m1.macierz[i][k]*m2.macierz[k][j];
            }
        }
    }

    return wynik;
}


void Macierz::transpozycja()
{
    if (wys==szer)
    {
        double pom;
        for (int i=0; i<wys; i++)
        {
            for (int j=i+1; j<szer; j++)
            {
                pom = macierz[i][j];
                macierz[i][j] = macierz[j][i];
                macierz[j][i] = pom;
            }
        }
    }
    else
    {
        double **pom = new double*[this->szer];

        for (int i=0; i<this->szer; i++)
        {
            pom[i] = new double[this->wys];
        }

        for (int i=0; i<this->szer; i++)
        {
            for (int j=0; j<this->wys; j++)
            {
                pom[i][j] = this->macierz[j][i];
            }
        }

        for (int i=0; i<this->wys; i++)
        {
            delete [] this->macierz[i];
        }
        delete [] this->macierz;

        int k = this->wys;
        this->wys = this->szer;
        this->szer = k;

        this->macierz = pom;
    }
}

void Macierz::zamiana_wierszy(int i, int j) throw (Poza_zakresem)
{
    if (i<0 || j<0 || i>=wys || j>=wys)
    {
        throw Poza_zakresem();
    }

    double *pom = new double[szer];
    for (int k=0; k<szer; k++)
    {
        pom[k] = macierz[i][k];
        macierz[i][k] = macierz[j][k];
    }
    for (int k=0; k<szer; k++)
    {
        macierz[j][k] = pom[k];
    }

    delete [] pom;
}

void Macierz::zamiana_kolumn(int i, int j) throw (Poza_zakresem)
{
    if (i<0 || j<0 || i>=szer || j>=szer)
    {
        throw Poza_zakresem();
    }

    double *pom = new double [wys];
    for (int k=0; k<wys; k++)
    {
        pom[k] = macierz[k][i];
        macierz[k][i] = macierz[k][j];
    }
    for (int k=0; k<szer; k++)
    {
        macierz[k][j] = pom[k];
    }

    delete [] pom;
}

void Macierz::mnozenie_wiersza(int w, double st) throw(Poza_zakresem)
{


    if (w<0 || w>=wys)
    {
        throw Poza_zakresem();
    }

    for (int i=0; i<szer; i++)
    {
        macierz[w][i]*=st;
    }
}

void Macierz::mnozenie_kolumny(int k, double st) throw(Poza_zakresem)
{
    
    if (k<0 || k>=szer)
    {
        throw Poza_zakresem();
    }

    for (int i=0; i<wys; i++)
    {
        macierz[i][k]*=st;
    }
}

void Macierz::dodanie_wierszy(int i, int j, int st) throw(Poza_zakresem)
{
    if (i<0 || j<0 || i>=wys || j>=wys)
    {
        throw Poza_zakresem();
    }

    for (int k=0; k<szer; k++)
    {
        macierz[i][k]+=(macierz[j][k]*st);
    }
}

void Macierz::dodanie_kolumn(int i, int j, int st) throw(Poza_zakresem)
{
    if (i<0 || j<0 || i>=wys || j>=wys)
    {
        throw Poza_zakresem();
    }

    for (int k=0; k<wys; k++)
    {
        macierz[k][i]+=(macierz[k][j]*st);
    }
}

Macierz Macierz::minor_macierzy(int i, int j)
{
    Macierz nowa(wys-1, szer-1);

    for (int k=0; k<i; k++)
    {
        for (int l=0; l<j; l++)
        {
            nowa.macierz[k][l] = this->macierz[k][l];
        }

        for (int l=j; l<nowa.szer; l++)
        {
            nowa.macierz[k][l] = this->macierz[k][l+1];
        }
    }

    for (int k=i; k<nowa.wys; k++)
    {
        for (int l=0; l<j; l++)
        {
            nowa.macierz[k][l] = this->macierz[k+1][l];
        }

        for (int l=j; l<nowa.szer; l++)
        {
            nowa.macierz[k][l] = this->macierz[k+1][l+1];
        }
    }


    return nowa;
}

Macierz Macierz::macierz_odwrotna() throw (Niewlasciwe_wymiary, Wyznacznik_rowny_0)
{
    if (this->wys!=this->szer)
    {
        throw Niewlasciwe_wymiary();
    }

    Macierz wynik(this->wys);
    double wyz = this->wyznacznik();

    if (wyz==0)
    {
        throw Wyznacznik_rowny_0();
    }

    for (int i=0; i<wynik.wys; i++)
    {
        for (int j=0; j<wynik.szer; j++)
        {
            double pom = this->minor_macierzy(j,i).wyznacznik();
            wynik.macierz[i][j] = pom/wyz;
        }
    }

    return wynik;
}

double Macierz::wyznacznik()
{
    if (szer==1)
    {
        return macierz[0][0];
    }
    else
    {
        double suma = 0;
        for (int i=0; i<szer; i++)
        {
            Macierz minor_m = this->minor_macierzy(0, i);
            if (i%2 == 0)
            {
                suma+=minor_m.wyznacznik()*this->macierz[0][i];
            }
            else
            {
                suma-=minor_m.wyznacznik()*this->macierz[0][i];
            }
        }
        return suma;
    }
}


ostream &obliczenia::operator<<(ostream &wy, const Macierz &m)
{
    for (int i=0; i<m.wys; i++)
    {
        for (int j=0; j<m.szer; j++)
        {
            wy << m.macierz[i][j] << " ";
        }

        cout << endl;
    }

    return wy;
}

istream &obliczenia::operator>>(istream &we, Macierz &m)
{
    string pom;

    for (int i=0; i<m.wys; i++)
    {
        for (int j=0; j<m.szer; j++)
        {
            we >> pom;
            m.macierz[i][j] = stof(pom);
        }
    }

    return we;
}



