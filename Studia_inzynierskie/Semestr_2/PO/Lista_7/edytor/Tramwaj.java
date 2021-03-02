// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L1, z1, Pojazdy
// Tramwaj
// Tramwaj.java
// 2018-04-12

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

//Klasa tramwaj
public class Tramwaj extends Pojazd implements Serializable
{
    private static final long serialVersionUID = 1L;

    //Pola klasy tramwaj
	public int linia;
    public int nr_tramwaju;
    public int miejsc;

    //Konstruktor
    public Tramwaj(String m, String k, int r, int l, int nr, int n)
    {
        marka = m;
        kolor = k;
        rocznik = r;
        linia = l;
        nr_tramwaju = nr;
        miejsc = n;
    }

    //Metoda toString
    public String toString()
    {
        return "Tramwaj" + marka + ", nr " +  Double.toString(nr_tramwaju) +
        ", linia " + Double.toString(linia) + ", miejsc" + Integer.toString(miejsc);
                 
    }

    //odczyt z pliku
    public boolean odczyt(String path)
    {
        try
        {
            
            FileInputStream plik = new FileInputStream("plik");
            ObjectInputStream input = new ObjectInputStream(plik);

            Tramwaj pom = (Tramwaj)input.readObject();

            marka = pom.marka;
            kolor = pom.kolor;
            rocznik = pom.rocznik;
            linia = pom.linia;
            nr_tramwaju = pom.nr_tramwaju;
            miejsc = pom.miejsc;
            
            input.close();
            plik.close();

            return true;

        }
        catch (Exception exc)
        {
            System.out.println(exc);
            return false;
        }
    }

    //zapis do pliku
    public boolean zapis(String path)
    {
        try
        {
            FileOutputStream plik = new FileOutputStream(path);
			ObjectOutputStream output = new ObjectOutputStream(plik);

            output.writeObject(this);
            
            output.close();
            plik.close();

            return true;

        }
        catch (Exception exc)
        {
            return false;
        }
    }
}