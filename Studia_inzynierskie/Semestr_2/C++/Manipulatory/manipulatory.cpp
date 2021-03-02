#include "manipulatory.h"

using namespace strumienie;
using namespace std;

inline istream &clearline(istream &is)
{
    while (is.get() != '\n');
    return is;
}

inline ostream &comma(ostream &os)
{
    return os << ", ";
}

inline ostream &colon(ostream &os)
{
    return os << ": ";
}

void strumienie::test_manipulatora()
{
    fstream tekst("tekst");
        
    string napis;
    vector<pair<string, int>> v;

    int i = 1;

    while (getline(tekst, napis))
    {
        v.push_back(make_pair(napis, i));
        i++;
    }

    sort(v.begin(), v.end());

    for (unsigned i = 0; i < v.size(); i++)
    {
        cout << index(v[i].second, 6) << v[i].first << endl;
    }


}


index::index(int x, int w)
{
    int cyfr = 0;
    int a;
    liczba = x;
    if (x >= 0)
    {
        a = x;
    }
    else
    {
        a = -x;
        cyfr = 1;
    }
    do
    {
        a /= 10;
        cyfr++;
    } while (a > 0);

    for (int i = cyfr; i < w; i++)
    {
        spacje += " ";
    }
}

Wejscie::Wejscie(string sciezka)
{
    try
    {
        is.open(sciezka);
    }
    catch (...)
    {
        throw invalid_argument(sciezka);
    }
}

Wejscie::~Wejscie()
{
    if ((is.rdstate()&ios_base::badbit || is.rdstate()&ios_base::failbit) && !this->koniec())
    {
        throw new ios_base::failure("Error");
    }
    is.close();   
}

bool Wejscie::koniec()
{
    return this->is.eof();
}

Wyjscie::Wyjscie(string sciezka)
{
    try
    {
        os.open(sciezka);
    }
    catch (...)
    {
        throw invalid_argument(sciezka);
    }
}

Wyjscie::~Wyjscie()
{
    if (os.rdstate()&ios_base::badbit || os.rdstate()&ios_base::failbit)
    {
        throw new ios_base::failure("Error");
    }
    os.close();
}

void strumienie::test_plikow(string n_we, string n_wy)
{
    Wejscie we(n_we);
    Wyjscie wy(n_wy);

    int x;

    while(!we.koniec())
    {
        we>>x;
        cout << x << " ";
        x >>=1;
        cout << x << endl;
        wy << x;
    }
}