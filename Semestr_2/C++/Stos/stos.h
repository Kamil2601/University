#include <string>
#include <iostream>
#include <vector>
using namespace std;

class Stos
{
    private:
    string *stos;
    int pojemnosc;
    int ile;

    public:

    Stos(int rozmiar);

    Stos();

    Stos(initializer_list<string> lista);

    Stos(Stos &s);

    Stos & operator= (Stos &s);

    Stos(Stos &&s);

    Stos & operator= (Stos &&s);

    ~Stos();

    void wloz(string napis);

    string sciagnij();

    string sprawdz();

    int rozmiar();

};