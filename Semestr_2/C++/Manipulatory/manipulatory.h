#pragma once
#include <iomanip>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <stdexcept>

using namespace std;

namespace strumienie
{

    inline istream &clearline(istream &is);
    
    inline ostream &comma(ostream &os);
   
    inline ostream &colon(ostream &os);
    

    class index
    {
        int liczba;
        string spacje = "";

    public:

        friend ostream &operator<<(ostream &os, const index &x)
        {
            return os << "[" + x.spacje + to_string(x.liczba) + "]";
        }

        index(int x, int w);
    };

    void test_manipulatora();
    

    class Wejscie
    {
        
        ifstream is;

    public:
        Wejscie(string sciezka);
    
        ~Wejscie();

        bool koniec();

        friend Wejscie& operator>>(Wejscie &we, int &x)
        {
            x = we.is.get();
            return we;
        }
    };

    class Wyjscie
    {
        ofstream os;

        public:

        Wyjscie(string sciezka);
        
        ~Wyjscie();
    

        friend Wyjscie& operator<<(Wyjscie &wy, int &x)
        {
            wy.os.put(x);
            return wy;
        }
    };

    void test_plikow(string wejscie, string wyjscie);
}