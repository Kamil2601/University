// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
// Zmienna
// Zmienna.java
// 2018-03-29

import java.util.ArrayList;
import java.util.List;

public class Zmienna extends Wyrazenie
{
    //Klasa zawierająca pary liczba-symbol
    public class Slownik
    {
        public float liczba;
        public String symbol;

        public Slownik(float x, String n)
        {
            liczba = x;
            symbol = n;
        }
    };

    //Lista par liczba-symbol
    static ArrayList<Slownik> tab = new ArrayList<Slownik>();

    String symbol;

    //Konstruktor
    public Zmienna(String x)
    {
       symbol = x;
    }

    //Dodanie pary liczba-symbol do listy
    public static void dodaj(String n, float x)
    {
        Zmienna pom = new Zmienna(n);
        pom.dodaj(x);
    }

    //Dodanie pary liczba-symbol do listy v2
    public void dodaj(float x)
    {
        Boolean koniec = false;
        for (int i=0; i<tab.size(); i++)
        {
            Slownik p = tab.get(i);
            if (p.symbol == symbol)
            {
                p.liczba = x;
                koniec = true;
            }
        }
        if (!koniec)
        {
            tab.add(new Slownik(x,symbol));
    
        }
    }

    //Obliczenie wartości zmiennej
    public float oblicz()
    {
        //Szukanie zmiennej w słowniku
        for (int i=0; i<tab.size(); i++)
        {
            Slownik p = tab.get(i);
            if (p.symbol == symbol)
            {
                return p.liczba;
            }
        }
        //Brak przypisania wartości zmiennej - wyjątek
        throw new ArithmeticException("Brak przypisania wartośći zmiennej");
    }

    //Zwrocenie symbolu jako napisu
    public String toString()
    {
        return symbol;
    }

    //Pochodna ze zmiennej równa 1
    public Wyrazenie pochodna()
    {
        return new Stala(1);
    }
};