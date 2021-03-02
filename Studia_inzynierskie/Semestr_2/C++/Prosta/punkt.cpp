#include "punkt.h"

using namespace std;

Punkt::Punkt(double x_p, double y_p) : x(x_p), y(y_p)
{

}

Punkt::Punkt(Punkt p, Wektor w) : x(p.x+w.dx), y(p.y+w.dy)
{

}

Punkt::Punkt(const Punkt &punkt) : x(punkt.x), y(punkt.y)
{
    
}

void Punkt::wypisz()
{
    cout << "( " << x << ", " << y << " )" << endl;
}