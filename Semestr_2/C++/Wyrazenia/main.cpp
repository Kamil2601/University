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
    cout << w3->opis() << " = " <<  w3->oblicz() << endl;

    Wyrazenie *log1 = new Logarytm(new Liczba(4), new Liczba(2));
    cout << log1->opis() << " = " <<  log1->oblicz() << endl;

    Wyrazenie *iloczyn1 = new Mnozenie(new Liczba(6), new Liczba(5));
    cout << iloczyn1->opis() << " = " << iloczyn1->oblicz() << endl;
    Wyrazenie *suma1 = new Dodawanie(iloczyn1, w3);
    cout << suma1->opis() << " = " << suma1->oblicz() << endl;

    Wyrazenie *dzielenie1 = new Dzielenie(suma1, w2);
    cout << dzielenie1->opis() << " = " << dzielenie1->oblicz() << endl;

    Wyrazenie *ln1 = new Ln(w3);
    cout << ln1->opis() << " = " << ln1->oblicz() << endl;

    Wyrazenie *test = new Ln(dzielenie1);
    cout << test->opis() << " = " << test->oblicz() << endl;

    Wyrazenie *test2 = new Ln(ln1);
    cout << test2->opis() << endl; //" = " << test2->oblicz() << endl;

    return 0;
}