#include <iostream>
//#include <cstdlib>
#include <climits>
#include <string>
#include <vector>
#include <cmath>
//#include <algorithm>

using namespace std;

string char_na_string(char *tab)
{
    string napis = tab;
    return napis;
}

bool czy_cyfra(char x)
{
    if (x >= '0' && x <= '9')
    {
        return true;
    }
    else
    {
        return false;
    }
}

int64_t string_na_int(string napis)
{
    int64_t liczba;
    if (napis[0]!='-' && !czy_cyfra(napis[0]))
    {
       throw invalid_argument("Bledny argument.");
    }
    for (unsigned i=1; i<napis.length(); i++)
    {
        if (!czy_cyfra(napis[i]))
        {
            throw invalid_argument("Bledny argument.");
        }
    }
    try
    {
        liczba = stoll(napis);
    }
    catch (invalid_argument& blad)
    {
        throw invalid_argument("Bledny argument.");
    }
    catch (out_of_range& blad)
    {
        throw invalid_argument("Przekroczenie zakresu");
    }
    return liczba;
}

bool pierwsza(int64_t x)
{
    for (int64_t i = 2; i <= sqrt(x); i++)
    {
        if (x % i == 0)
        {
            return false;
        }
    }
    return true;
}

vector<int64_t> rozklad(int64_t liczba)
{
    vector<int64_t> czynniki;
    if (liczba == 0 || liczba == 1 || liczba == -1)
    {
        czynniki.push_back(liczba);
        return czynniki;
    }
    else if (liczba < 0)
    {
        czynniki.push_back(-1);
        if (liczba == LLONG_MIN)
        {
            liczba /= 2;
            czynniki.push_back(2);
        }
        liczba *= -1;
    }
    while (liczba > 1)
    {
        for (int64_t i = 2; i <= sqrt(liczba) + 1; i++)
        {
            if (liczba % i == 0)
            {
                czynniki.push_back(i);
                liczba /= i;
                break;
            }
            if (i > sqrt(liczba))
            {
                czynniki.push_back(liczba);
                liczba = 1;
            }
        }
    }
    return czynniki;
}

void wypisz(int64_t liczba, vector<int64_t> tab)
{
    cout << liczba << " = ";
    bool pierwszy = true;
    for (int64_t x : tab)
    {
        if (pierwszy == true)
        {
            cout << x;
            pierwszy = false;
        }
        else
        {
            cout << " * " << x;
        }
    }
    cout << endl;
}

void instrukcja()
{
    cerr << "Program rozklada liczby na czynniki pierwsze. Wywolaj go z argumentami liczbowymi aby zadzialal poprawnie." << endl;
}

int main(int argc, char **argv)
{
    string napis;
    int64_t liczba;
    vector<int64_t> tab;
    if (argc == 1)
    {
        instrukcja();
        return 0;
    }
    for (int i = 1; i < argc; i++)
    {
        napis = char_na_string(argv[i]);
        liczba = string_na_int(napis);
        tab = rozklad(liczba);
        wypisz(liczba, tab);
        tab.clear();
    }
    return 0;
}
