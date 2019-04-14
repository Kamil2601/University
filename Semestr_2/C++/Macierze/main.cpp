#include "macierz.h"
#include "wyjatki.h"

using namespace std;
using namespace obliczenia;

int main()
{
    Macierz a(3);
    cin >> a;
    cout << a;

    cout << endl << "Macierz odwrotna" << endl;
    cout << a.macierz_odwrotna() << endl;
    cout << a.wyznacznik() << endl;
    cout << a.minor_macierzy(0,0);

}