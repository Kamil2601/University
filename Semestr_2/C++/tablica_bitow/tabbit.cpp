#include "tabbit.h"
#include <cmath>
#include <iomanip>

using namespace std;

tab_bit::tab_bit(int rozmiar)
{
    int r = rozmiar;
    //cout << r << endl;
    int komorek = 0;
    if (r % rozmiarSlowa == 0)
    {
        komorek = r / rozmiarSlowa;
    }
    else
    {
        komorek = r / rozmiarSlowa + 1;
    }
    this->tab = new slowo[komorek];
    this->dl = rozmiar;
    //cout << komorek << endl;
    //cout << rozmiar << endl;
    for (int i = 0; i < komorek; i++)
    {
        this->tab[i] = 0;
    }
}

tab_bit::tab_bit(slowo tb)
{
    this->dl = rozmiarSlowa;
    this->tab = new slowo[1];
    this->tab[0] = tb;
}

tab_bit::tab_bit(const tab_bit &tb) // konstruktor kopiujący
{
    int komorek;
    if (tb.dl % rozmiarSlowa == 0)
    {
        komorek = tb.dl / rozmiarSlowa;
    }
    else
    {
        komorek = tb.dl / rozmiarSlowa + 1;
    }

    this->tab = new slowo[komorek];
    this->dl = tb.dl;
    for (int i = 0; i < tb.dl; i++)
    {
        this->tab[i] = tb.tab[i];
    }
}
tab_bit::tab_bit(tab_bit &&tb) // konstruktor przenoszący
{
    this->dl = tb.dl;
    this->tab = tb.tab;
    tb.tab = nullptr;
    tb.dl = 0;
}

tab_bit &tab_bit::operator=(const tab_bit &tb) // przypisanie kopiujące
{
    if (this->tab != nullptr)
        delete[] this->tab;
    int komorek;
    if (tb.dl % rozmiarSlowa == 0)
    {
        komorek = tb.dl / rozmiarSlowa;
    }
    else
    {
        komorek = tb.dl / rozmiarSlowa + 1;
    }
    this->tab = new slowo[komorek];
    this->dl = tb.dl;
    for (int i = 0; i < komorek; i++)
    {
        this->tab[i] = tb.tab[i];
    }
    return *this;
}
tab_bit &tab_bit::operator=(tab_bit &&tb) // przypisanie przenoszące
{
    if (this->tab != nullptr)
        delete[] this->tab;
    this->dl = tb.dl;
    this->tab = tb.tab;
    tb.dl = 0;
    tb.tab = nullptr;
    return *this;
}
tab_bit::~tab_bit()
{
    delete[] this->tab;
}

bool tab_bit::czytaj(int i) const
{
    if (i >= (this->dl))
    {
        throw invalid_argument("Bit spoza zakresu tablicy!");
    }
    int komorka = i / rozmiarSlowa;
    int przesuniecie = rozmiarSlowa - (i % rozmiarSlowa) - 1;
    bool wynik = (tab[komorka] >> przesuniecie) & 1;
    return wynik;
}
/*
bool tab_bit::pisz(int i, bool b)
{
    if (i >= (this->dl))
    {
        throw invalid_argument("Bit spoza zakresu tablicy!");
    }
    else
    {
        int komorka = i / rozmiarSlowa;
        int przesuniecie = rozmiarSlowa - (i % rozmiarSlowa) - 1;
        if (b == true)
        {
            this->tab[komorka] = this->tab[komorka] | (1 << przesuniecie);
        }
        else
        {
            this->tab[komorka] = this->tab[komorka] & ~(1 << przesuniecie);
        }

        return 1;
    }
}*/

bool tab_bit::operator[](int i) const
{
    return czytaj(i);
}

tab_bit::ref tab_bit::operator[](int i)
{
    //ref wynik;
    if (i >= (this->dl))
    {
        throw invalid_argument("Bit spoza zakresu tablicy!");
    }
    int komorka = i / rozmiarSlowa;
    int p = rozmiarSlowa - (i % rozmiarSlowa) - 1;
    p = rozmiarSlowa - p - 1;
    ref wynik(&tab[komorka],p);//rozmiarSlowa - (i % rozmiarSlowa) - 1);
    return wynik;
}

tab_bit operator|(const tab_bit &tb1, const tab_bit &tb2)
{
    if (tb1.tab == nullptr && tb1.tab == nullptr)
    {
        throw invalid_argument("Obie tablice puste");
    }

    int r, k;
    if (tb1.dl > tb2.dl)
    {
        r = tb1.dl;
        k = tb2.dl;
    }
    else
    {
        r = tb2.dl;
        k = tb1.dl;
    }
    tab_bit wynik(r);
    int p = wynik.dl / wynik.rozmiarSlowa + 1;
    int q = k / wynik.rozmiarSlowa + 1;

    for (int i = 0; i < q; i++)
    {
        wynik.tab[i] = tb1.tab[i] | tb2.tab[i];
    }
    for (int i = q; i < p; i++)
    {
        if (tb1.dl > tb2.dl)
        {
            wynik.tab[i] = tb1.tab[i];
        }
        else
        {
            wynik.tab[i] = tb2.tab[i];
        }
    }

    return wynik;
}

tab_bit &tab_bit::operator|=(const tab_bit &tb)
{
    *this = operator|(*this, tb);
    return *this;
}

tab_bit operator&(const tab_bit &tb1, const tab_bit &tb2)
{
    if (tb1.tab == nullptr && tb1.tab == nullptr)
    {
        throw invalid_argument("Obie tablice puste");
    }

    int r, k;
    if (tb1.dl > tb2.dl)
    {
        r = tb1.dl;
        k = tb2.dl;
    }
    else
    {
        r = tb2.dl;
        k = tb1.dl;
    }
    tab_bit wynik(r);
    int p = wynik.dl / wynik.rozmiarSlowa + 1;
    int q = k / wynik.rozmiarSlowa + 1;

    for (int i = 0; i < q; i++)
    {
        wynik.tab[i] = tb1.tab[i] & tb2.tab[i];
    }
    for (int i = q; i < p; i++)
    {
        wynik.tab[i] = 0;
    }

    return wynik;
}

tab_bit &tab_bit::operator&=(const tab_bit &tb)
{
    *this = operator&(*this, tb);
    return *this;
}

tab_bit operator^(const tab_bit &tb1, const tab_bit &tb2)
{
    if (tb1.tab == nullptr && tb1.tab == nullptr)
    {
        throw invalid_argument("Obie tablice puste");
    }
    int r, k;
    if (tb1.dl > tb2.dl)
    {
        r = tb1.dl;
        k = tb2.dl;
    }
    else
    {
        r = tb2.dl;
        k = tb1.dl;
    }
    tab_bit wynik(r);
    int p = wynik.dl / wynik.rozmiarSlowa + 1;
    int q = k / wynik.rozmiarSlowa + 1;

    for (int i = 0; i < q; i++)
    {
        wynik.tab[i] = tb1.tab[i] ^ tb2.tab[i];
    }
    for (int i = q; i < p; i++)
    {
        if (tb1.dl > tb2.dl)
        {
            wynik.tab[i] = tb1.tab[i];
        }
        else
        {
            wynik.tab[i] = tb2.tab[i];
        }
    }

    return wynik;
}

tab_bit &tab_bit::operator^=(const tab_bit &tb)
{
    *this = operator^(*this, tb);
    return *this;
}

tab_bit operator!(const tab_bit &tb)
{
    tab_bit wynik = tb;
    int komorek = wynik.rozmiar() / wynik.rozmiarSlowa + 1;
    for (int i = 0; i < komorek; i++)
    {
        wynik.tab[i] = ~wynik.tab[i];
    }

    return wynik;
}

inline int tab_bit::rozmiar() const
{
    return this->dl;
}

ostream &operator<<(ostream &wy, const tab_bit &tb)
{
    bool b;
    for (int i = 0; i < tb.rozmiar(); i++)
    {
        b = tb[i];
        wy << b;
    }
    return wy;
}

istream &operator>>(istream &we, tab_bit &tb)
{
    string bity;
    we >> bity;
    int nowa_dl = bity.size();
    while (bity.size() % 64 != 0)
    {
        bity += "0";
    }

    //cout << bity << endl;
    int l = bity.size();
    int komorek = l / tb.rozmiarSlowa;

    if (tb.tab != nullptr)
    {
        delete[] tb.tab;
    }
    tb.tab = new tab_bit::slowo[komorek];
    tb.dl = nowa_dl;

    for (int i = 0; i < komorek; i++)
    {
        tb.tab[i] = 0;
        for (int j = 0; j < tb.rozmiarSlowa; j++)
        {
            if (bity[i + j] == '1')
            {
                tb.tab[i] += (tab_bit::slowo)1 << (tb.rozmiarSlowa - j - 1);
            }
        }
    }
    return we;
}

tab_bit::ref::ref(slowo *tb, int i)
{
    s = tb;
    indeks = i;
}

/*tab_bit::ref::~ref()
{
    s = nullptr;
    indeks = 0;
}*/

tab_bit::ref::operator bool() const
{
    int przesuniecie = rozmiarSlowa - indeks -1;
    bool wynik = *s>>przesuniecie;
    return wynik;
}

tab_bit::ref &tab_bit::ref::operator=(const bool bit)
{
        int przesuniecie = rozmiarSlowa - indeks - 1;
        if (bit == true)
        {
            *s = *s|((uint64_t)1 << przesuniecie);
        }
        else
        {
            *s = *s&~((uint64_t)1 << przesuniecie);
        }

        return *this;
}

tab_bit::ref &tab_bit::ref::operator=(const ref x)
{
    int przesuniecie = rozmiarSlowa - x.indeks - 1;
    bool bit = *x.s>>przesuniecie;
    przesuniecie = rozmiarSlowa - indeks - 1;
    if (bit == true)
    {
        *s = *s|((uint64_t)1 << przesuniecie);
    }
    else
    {
        *s = *s&~((uint64_t)1 << przesuniecie);
    }

    return *this;
}