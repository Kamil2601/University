#include "stos.h"

using namespace std;

Stos *utworz_stos(Stos *s, Stos do_kopiowania)
{
    int wybor;

    system("clear");
    if (s!=NULL)
    {
        cout << "Stos już istnieje!" << endl;
        getchar();
        getchar();
        return s;
    }
    cout << "Wybierz sposób utworzenia stosu" << endl;
    cout << "1.Domyślny" << endl;
    cout << "2.Podanie rozmiaru" << endl;
    cout << "3.Lista inicjalizująca" << endl;
    cout << "4.Skopiowanie stosu wbudowanego" << endl;
    cout << "5.Przeniesienie stosu wbudowanego" << endl;
    cout << "Wybor: ";
    cin >> wybor;
    cout << endl;
    
    switch (wybor)
    {
        case 2:
        {
            int rozmiar;
            cout << "Podaj rozmiar: ";
            cin >> rozmiar;
            s = new Stos(rozmiar);
            break;
        }
        case 3:
        {
            cout << "lista_inicjalizująca: {\"1_el_listy\", \"2_el_listy\"}" << endl;
            s = new Stos({"1_el_listy", "2_el_listy"});
            getchar();
            getchar();
            break;
        }
        case 4:
        {
            cout << "Skopiowanie stosu o pojemnosci 3 i dwóch elementach \"a\" i \"b\"" << endl;
            s = new Stos(do_kopiowania);
            getchar();
            getchar();
            break;
        }
        case 5:
        {
            cout << "Przeniesienie stosu o pojemnosci 3 i dwóch elementach \"a\" i \"b\"" << endl;
            s = new Stos(move(do_kopiowania));
            getchar();
            getchar();
            break;
        }
        default:
        {
            cout << "Utworzenie stosu przez konstruktor domyślny" << endl;
            s = new Stos();
            getchar();
            getchar();
        }
    }

    return s;
}

int main()
{
    Stos *test = NULL;
    Stos do_kopiowania(3);
    do_kopiowania.wloz("a");
    do_kopiowania.wloz("b");

    bool koniec = false;
    int wybor;

    while (!koniec)
    {
        system("clear");
        cout << "Program wykonujacy operacje na stosie" << endl;
        cout << "Wybierz operacje" << endl;
        cout << "1.Utworzenie stosu" << endl;
        cout << "2.Dodanie elementu" << endl;
        cout << "3.Sciagiecie elementu" << endl;
        cout << "4.Odczytanie górnego elementu" << endl;
        cout << "5.Sprawdzenie liczby elementów na stosie" << endl;
        cout << "6.Zakoncz" << endl;
        cout << "Wybor: ";
        cin >> wybor;

        switch (wybor)
        {
            case 1:
            {
                test = utworz_stos(test, do_kopiowania);
                break;
            }
            case 2:
            {
                string napis;
                cout << "Podaj napis: ";
                cin >> napis;
                test->wloz(napis);
                break;
            }
            case 3:
            {
                cout << "Pobrany element: " << test->sciagnij() << endl;
                getchar();
                getchar();
                break;
            }
            case 4:
            {
                cout << "Element na szczycie stosu: " << test->sprawdz() << endl;
                getchar();
                getchar();
                break;
            }
            case 5:
            {
                cout << "Liczba elementow na stosie: " << test->rozmiar() << endl;
                getchar();
                getchar();
                break;
            }
            default:
            {
                koniec = true;
                break;
            }
        }
    }

    delete test;

    return 0;
}