#include "wektor.h"
#include "punkt.h"
#include "prosta.h"

using namespace std;

int main()
{
    cout << "Punkty A(10, 20) i B(1,1). Prosta p przechodząca przez A i B: " << endl << "p:";
    Punkt a(10,20);
    Punkt b(1,1);
    Prosta p(a,b);
    p.wypisz();

    Wektor u(-2,8);
    cout << endl <<"Utworzono wektor u=";
    u.wypisz();

    Punkt c(b, u);

    cout << "Punkt C, przesuniety o wektor u, wzgledem punktu B(1,1): C";
    c.wypisz();

    Prosta k(p, u);
    cout << "Prosta k, przesunieta wzgledem prostej p o wektor u:" << endl << "k: ";
    k.wypisz();

    cout << endl << "Czy proste p i k sa rownolegle (0-nie, 1-tak)?: " << rownolegle(p, k) << endl;
    cout << "Czy proste p i k sa prostopadle (0-nie, 1-tak)?: " << prostopadle(p, k) << endl;
    cout << "Czy punkt a lezy na prostej p?: " << p.pkt_na_prostej(a) << endl;
    cout << "Czy punkt a lezy na prostej k?: " << k.pkt_na_prostej(a) << endl;
    cout << "Odleglosc punktu a od prostej k: " << k.odl_od_pkt(a) << endl << endl;

    Prosta l(3,2,1);

    cout << "Utworzenie prostej z podanymi wspolrzednymi" << endl;
    cout << "l: ";
    l.wypisz();

    Wektor v(-1,1);
    cout << endl << "Zlozenie wektorow" << endl;
    cout << "u = ";
    u.wypisz();
    cout << "v = ";
    v.wypisz();

    Wektor zlozony = zlozenie(u,v);

    cout << "u+v = ";
    zlozony.wypisz();

    Punkt x = przeciecie(k,l);

    cout << "Punkt przeciecia prostych k i l: ";
    x.wypisz();

    Prosta blad(b,b);

    return 0;
}
