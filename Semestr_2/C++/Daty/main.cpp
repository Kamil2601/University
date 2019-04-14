#include "data.h"
#include "datagodz.h"
#include "wydarzenie.h"
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
    Data test;
    test.wypisz();
    Data test2;
    test2-=1000;
    test2.wypisz();
    cout << test - test2 << endl;
    --test2;
    test2.wypisz();

    Datagodz g1;
    Datagodz g2;
    g1.wypisz();
    g2-=1000;
    g2.wypisz();
    cout << "Roznica: " << g1 - g2 << endl;


    Datagodz teraz;
    teraz.wypisz();

    Wydarzenie pracownia(teraz, "c++");

    vector <Wydarzenie> tab;
    tab.push_back(pracownia);

    pracownia.wypisz();
  
}