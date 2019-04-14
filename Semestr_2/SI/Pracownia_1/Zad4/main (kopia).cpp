#include <iostream>
#include <string>

using namespace std;

int opt_dist(string ciag, int jedynek)
{
    int ruchow=0;;
    int minimum=ciag.length();
    int dl = ciag.length();
    for (int i=0; i<(dl-jedynek); i++)
    {
        ruchow = 0;
        for (int j=0; j<jedynek; j++)
        {
            if (ciag[i+j]=='0')
            {
                ruchow++;
            }
        }
        for (int j=0; j<i; j++)
        {
            if (ciag[j]=='1')
            {
                ruchow++;
            }
        }
        for (int j=i+jedynek; j<dl; j++)
        {
            if (ciag[j]=='1')
            {
                ruchow++;
            }
        }

        if (ruchow < minimum)
        {
            minimum = ruchow;
        }
    }

    return minimum;

}

int main()
{
    string napis;
    int liczba;
    int wynik;
    while (cin >> napis)
    {
        cin >> liczba;

        wynik = opt_dist(napis, liczba);

        cout << wynik << endl;
    }
}