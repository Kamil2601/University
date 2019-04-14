// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
// Stala
// Stala.java
// 2018-03-29

//Klasa obsługująca stałą - liczbę
public class Stala extends Wyrazenie
{
    //Wartość stałej
    float liczba;

    //Konstruktor
    public Stala(float x)
    {
        liczba = x;
    }

    //Zwrócenie wartośći
    public float oblicz()
    {
        return liczba;
    }

    //Zwrócenie liczby jako napisu
    public String toString()
    {
        return Float.toString(liczba);
    }

    public Wyrazenie pochodna()
    {
        return new Stala(0);
    }
}