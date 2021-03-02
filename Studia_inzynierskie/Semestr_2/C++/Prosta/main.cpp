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
    cout << "Utworzono wektor u=";
    u.wypisz();

    Punkt c(b, u);

    cout << "Punkt C, przesuniety o wektor u, wzgledem punktu B(1,1): C";
    c.wypisz();

    Prosta k(p, u);
    cout << "Prosta k, przesunieta wzgledem prostej p o wektor u:" << endl << "k: ";
    k.wypisz();

    cout << "Czy proste p i k sa rownolegle (0-nie, 1-tak)?: " << rownolegle(p, k) << endl;
    cout << "Czy proste p i k sa prostopadle (0-nie, 1-tak)?: " << prostopadle(p, k) << endl;
    cout << "Czy punkt a lezy na prostej p?: " << p.pkt_na_prostej(a) << endl;
    cout << "Czy punkt a lezy na prostej k?: " << k.pkt_na_prostej(a) << endl;
    cout << "Odleglosc punktu a od prostej k: " << k.odl_od_pkt(a) << endl;

    return 0;
}