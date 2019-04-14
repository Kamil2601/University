#include "tabbit.h"

using namespace std;

int main()
{

   
    tab_bit a(64);
    tab_bit b(64);



    tab_bit c(64);

    c[1] = 1;
    c[10] = 1;
    c[11] = c[10];

    cout << c[1] << endl;
    cout << c << endl;

    cout << "a:";
    cin >> a;
    cout << "b:";
    cin >> b;

    tab_bit w(64);

    w = a|b;
    cout << "alternatywa: "  << w << endl;

    w = a&b;
    cout << "koniunkcja: "  << w << endl;

    w = a^b;
    cout << "alternatywa wykluczajaca: " << w << endl;

    //cout << c;

    //cout << x << endl;
}