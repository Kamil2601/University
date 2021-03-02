#include "prosta.h"

using namespace std;

const double epsilon = 0.000001;

Prosta::Prosta(Punkt p1, Punkt p2)
{
    if (p1.x == p2.x && p1.y == p2.y)
    {
        throw invalid_argument("Nie można jednoznacznie utworzyć prostej\n");
    }
    else
    {
        a = p2.y - p1.y;
        b = p1.x - p2.x;
        c = p2.x * p1.y - p1.x * p2.y;
    }

    unormuj();
}

Prosta::Prosta(Wektor w)
{
    if (w.dx == 0 && w.dy == 0)
    {
        throw invalid_argument("Nie można jednoznacznie utworzyć prostej (podano wektor zerowy)\n");
    }
    else
    {
        a = w.dx;
        b = w.dy;
        c = -(a * w.dx + b * w.dy);
    }

    unormuj();
}

Prosta::Prosta(double w_a, double w_b, double w_c)
{
    if (w_a == 0 && w_b == 0)
    {
        throw invalid_argument("Wspolczynniki A i B rowne 0\n");
    }
    else
    {
        a = w_a;
        b = w_b;
        c = w_c;
    }

    unormuj();
}

Prosta::Prosta(Prosta p, Wektor w)
{
    if (p.a == 0 && p.b == 0)
    {
        throw invalid_argument("Wspolczynniki a i b rowne 0\n");
    }
    else
    {
        a = p.a;
        b = p.b;
        c = -(a * w.dx + b * (c + w.dy));
    }

    unormuj();
}

double Prosta::wsp_a()
{
    return this->a;
}

double Prosta::wsp_b()
{
    return this->b;
}

double Prosta::wsp_c()
{
    return this->c;
}

void Prosta::unormuj()
{
    double u;
    if (this->c < 0)
    {
        u = sqrt(this->a * this->a + this->b * this->b);
    }
    else
    {
        u = -sqrt(this->a * this->a + this->b * this->b);
    }

    (this->a) /= u;
    (this->b) /= u;
    (this->c) /= u;
}

void Prosta::wypisz()
{
    cout << a << "x + " << b << "y + " << c << " = 0" << endl;
}

bool Prosta::wektor_prostopadly(Wektor w)
{
    if (wsp_a() * w.dy - wsp_b() * w.dx < epsilon)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool Prosta::wektor_rownolegly(Wektor w)
{
    if (wsp_a() * w.dx + wsp_b() * w.dy < epsilon)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool Prosta::pkt_na_prostej(Punkt p)
{
    if (odl_od_pkt(p) == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

double Prosta::odl_od_pkt(Punkt p)
{
    double d = (abs(a * p.x + b * p.y + c)) / (sqrt(a * a + b * b));

    int x = d * 100000;
    d = (double)x / 100000;

    return d;
}

bool rownolegle(Prosta k, Prosta l)
{
    if (abs(k.wsp_a() * l.wsp_b() - k.wsp_b() * l.wsp_a()) < epsilon)
    {
        return true;
    }
    else
    {
        return false;
    }
}

bool prostopadle(Prosta k, Prosta l)
{
    if (abs(k.wsp_a() * l.wsp_a() + k.wsp_b() * l.wsp_b()) < epsilon)
    {
        return true;
    }
    else
    {
        return false;
    }
}

Punkt przeciecie(Prosta k, Prosta l)
{
    if (!rownolegle(k, l))
    {
        double d = k.wsp_a() * l.wsp_b() - k.wsp_b() * l.wsp_a();

        double x_p = (k.wsp_b()*l.wsp_c() - l.wsp_b()*k.wsp_c())/d;
        double y_p = -(k.wsp_a()*l.wsp_c() - l.wsp_a()*k.wsp_c())/d;
        Punkt wynik(x_p, y_p);
        return wynik;
    }
    else
    {
        throw invalid_argument("Proste rownolegle 0\n");
    }
}
