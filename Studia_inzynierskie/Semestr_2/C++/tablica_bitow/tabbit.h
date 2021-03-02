#include <iostream>

using namespace std;


class tab_bit
{
    typedef uint64_t slowo;        // komorka w tablicy
    

    class ref // klasa pomocnicza do adresowania bitów
    {
      public:
        slowo *s;
        int indeks;

        ref(slowo *tb, int i);
        operator bool() const;
        ref& operator=(const ref);
        ref& operator=(const bool);
        //~ref();
         
    };

  private:
    int dl;     // liczba bitów
    slowo *tab; // tablica bitów
    
  public:
    static const int rozmiarSlowa = 64; // rozmiar slowa w bitach
    explicit tab_bit(int rozm); // wyzerowana tablica bitow [0...rozm]
    explicit tab_bit(slowo tb); // tablica bitów [0...rozmiarSlowa]
    // zainicjalizowana wzorcem
    tab_bit(const tab_bit &tb);            // konstruktor kopiujący
    tab_bit(tab_bit &&tb);                 // konstruktor przenoszący
    tab_bit &operator=(const tab_bit &tb); // przypisanie kopiujące
    tab_bit &operator=(tab_bit &&tb);      // przypisanie przenoszące
    ~tab_bit();                            // destruktor

  private:
    bool czytaj(int i) const; // metoda pomocnicza do odczytu bitu
    //bool pisz(int i, bool b); // metoda pomocnicza do zapisu bitu

  public:
    bool operator[](int i) const; // indeksowanie dla stałych tablic bitowych
    ref operator[](int i);        // indeksowanie dla zwykłych tablic bitowych
    inline int rozmiar() const;   // rozmiar tablicy w bitach

  public:
    // operatory bitowe: | i |=, & i &=, ^ i ^= oraz !
    friend tab_bit operator|(const tab_bit &tb1, const tab_bit &tb2);
    tab_bit &operator|=(const tab_bit &tb);
    friend tab_bit operator&(const tab_bit &tb1, const tab_bit &tb2);
    tab_bit &operator&=(const tab_bit &tb);
    friend tab_bit operator^(const tab_bit &tb1, const tab_bit &tb2);
    tab_bit &operator^=(const tab_bit &tb);
    friend tab_bit operator!(const tab_bit &tb);

  public:

    // zaprzyjaźnione operatory strumieniowe: << i >>
    friend istream &operator>>(istream &we, tab_bit &tb);
    friend ostream &operator<<(ostream &wy, const tab_bit &tb);
};

tab_bit operator|(const tab_bit &tb1, const tab_bit &tb2);

tab_bit operator&(const tab_bit &tb1, const tab_bit &tb2);

tab_bit operator!(const tab_bit &tb);

tab_bit operator^(const tab_bit &tb1, const tab_bit &tb2);

istream &operator>>(istream &we, tab_bit &tb);

ostream &operator<<(ostream &wy, const tab_bit &tb);