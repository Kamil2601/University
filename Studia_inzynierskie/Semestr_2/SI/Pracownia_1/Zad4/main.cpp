#include <iostream>
#include <string>

using namespace std;

int opt_dist(string ciag, int jedynek)
{
    int ruchow = 0;
    int minimum = 0;
    int dl = ciag.length();

    cout << "dl: " << dl << endl;

    for (int i=0; i<jedynek; i++)
    {
        if (ciag[i]=='0')
        {
            minimum++;
        }
    }

    for (int i=jedynek; i<dl; i++)
    {
        if (ciag[i]=='1')
        {
            minimum++;
        }
    }

    ruchow = minimum;

    for (int i=1; i<(dl-jedynek); i++)
    {
        if (ciag[i-1]=='1')
        {
            ruchow++;
        }
        else if (ciag[i-1]=='0')
        {
            ruchow--;
        }

        if (ciag[i+jedynek-1]=='0')
        {
            ruchow++;
        }
        else if (ciag[i+jedynek-1]=='1')
        {
            ruchow--;
        }

        if (ruchow<minimum)
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