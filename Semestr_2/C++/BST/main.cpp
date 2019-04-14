#include "bst.h"
#include "bst.cpp"
#include <cstdio>

using namespace struktury;
using namespace std;

int main()
{
    bool quit = false;
    int choice = 0;
    int element;
    bool succes;

    Bst <int> *tree;
    system("clear");
    cout << "Drzewo przeszukiwań binarnych <int>" << endl
    << "Wybierz sposób inicjalizacji drzewa" << endl
    << "1.Drzewo puste" << endl
    << "2.Drzewo z podaną wartością w korzeniu" << endl
    << "3.Skopiowanie gotowego drzewa" << endl
    << "4.Inicjalizacja listą wartości" << endl;
    cin >> choice;

    switch(choice)
    {
        case 2:
        {
            cout << "Podaj wartość: ";
            cin >> element;
            tree = new Bst<int>(element);
            break;
        }
        case 3:
        {
            Bst<int> *temp = new Bst<int>();
            temp->push(10);
            temp->push(5);
            temp->push(20);
            temp->push(15);
            tree = new Bst<int>(*temp);
            break;
        }
        case 4:
        {
            tree = new Bst<int>({1,2,5,7,0,-4});
            break;
        }
        default:
        {
            tree = new Bst<int>();
            break;
        }
    }

    while(quit==false)
    {
        system("clear");
        cout << "Drzewo przeszukiwań binarnych <int>" << endl
        << "Wybierz operację:" << endl
        << "1.Dodanie elementu" << endl
        << "2.Usunięcie elementu" << endl
        << "3.Wyszukanie elementu" << endl
        << "4.Wypisanie elementów drzewa w kolejności rosnącej" << endl
        << "0.Wyjście" << endl
        << "Wybór: ";
        cin >> choice;
        switch (choice)
        {
            case 1:
            {
                cout << "Podaj element: ";
                cin >> element;
                succes = tree->push(element);
                if (succes)
                {
                    cout << "Dodano element do drzewa" << endl;
                }
                else
                {
                    cout << "Element już jest w drzewie" << endl;
                }
                cin.ignore(1024, '\n');
                cin.get();
                break;
            }
            case 2:
            {
                cout << "Podaj element: ";
                cin >> element;
                //cout << element << endl;
                succes = tree->pop(element);
                if (succes)
                {
                    cout << "Usunięto element z drzewa" << endl;
                }
                else
                {
                    cout << "Elementu nie ma w drzewie" << endl;
                }
                cin.ignore(1024, '\n');
                cin.get();
                break;
            }
            case 3:
            {
                cout << "Podaj element: ";
                cin >> element;
                succes = tree->search(element);
                if (succes)
                {
                    cout << "Znaleziono element w drzewie" << endl;
                }
                else
                {
                    cout << "Nie znaleziono elementu w drzewie" << endl;
                }
                cin.ignore(1024, '\n');
                cin.get();
                break;
            }
            case 4:
            {
                cout << "Elementy drzewa: " << endl;
                cout << *tree << endl;
                cin.ignore(1024, '\n');
                cin.get();
                break;
            }
            default:
            {
                quit = true;
                break;
            }
        }
    }

    delete tree;

    return 0;
}