#include "wyrazenie.h"
#include "binarne.h"
#include "unarne.h"
#include "liczby.h"

using namespace std;

int main()
{
    Wyrazenie *w1 = new Odejmowanie(
        new Pi(),
        new Dodawanie(
            new Liczba(2),
            new Mnozenie(
                new Zmienna("x"),
                new Liczba(7))));
    cout << w1->opis() << " = ";
    Zmienna::zapisz("x", 3);
    cout << w1->oblicz() << endl;

    Wyrazenie *w2 = new Dodawanie(new Liczba(1), new Liczba(2));
    cout << w2->opis() << " = " << w2->oblicz() << endl;

    Wyrazenie *w3 = new Sin(new Liczba(1));
    cout << w3->oblicz() << endl;

    Wyrazenie *log1 = new Logarytm(new Liczba(4), new Liczba(2));
    cout << log1->opis() << " = " <<  log1->oblicz() << endl;
    return 0;
}