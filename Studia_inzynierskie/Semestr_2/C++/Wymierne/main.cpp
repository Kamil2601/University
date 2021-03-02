#include "wymierne.h"

using namespace obliczenia;
using namespace std;

int main()
{
    Wymierna a(1,-3);
    a.wypisz();
    cout << endl;
    cout << (int)a << endl;
    cout << a << endl << endl;
    Wymierna b = !a;
    b.wypisz();
    cout << endl;
    cout << b << endl;
    cout << (int)b << endl << endl;
    Wymierna c(2,7);
    cout << c << endl;
    Wymierna d = c-a;
    d.wypisz();
    cout << endl;
    cout << (double)d << endl;
    cout << d << endl;
    Wymierna e = a*a;
    e.wypisz();
    cout << endl;
    Wymierna f = c/a;
    f.wypisz();
    cout << endl;
    cout << f << endl;
    Wymierna m(1,6);
    cout << m << endl;
}