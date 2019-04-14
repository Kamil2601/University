// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Filtrowanie i sortowanie
// Bufor
// Bufor.java
// 2018-04-05

import java.util.concurrent.ConcurrentLinkedQueue;


//Klasa buforu-kolejki
public class Bufor <T>
{
    ConcurrentLinkedQueue<T> bufor;
    int rozmiar;
    int head;

    //Konstruktor
    public Bufor (int n)
    {
        rozmiar = n;
        bufor = new ConcurrentLinkedQueue<T>();
    }

    //Dodanie elementu do bufora
    public synchronized void dodaj(T obj)
    {
        if (pelny()==false)
        {
            bufor.add(obj);
        }
    }

    //Pobranie elementu z bufora
    public T pobierz()
    {
        return bufor.poll();
    }

    //Sprawdzenie czy bufor jest pusty
    public boolean pusty()
    {
        return bufor.isEmpty();
    }

    //Sprawdzenie czy bufor jest pełny
    public boolean pelny()
    {
        return bufor.size()>=rozmiar;
    }
}