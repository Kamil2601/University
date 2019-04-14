// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L1, z1, Pojazdy
// Samochod
// Samochod.java
// 2018-04-12

import java.io.Serializable;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;


//Klasa samochod
public class Samochod extends Pojazd// implements Serializable
{
    private static final long serialVersionUID = 1L;

    //pola klasy samochod
	public int vmax;
    public double spalanie;
    public double poj_silnika;    

    //kontruktor
    public Samochod(String m, String k, int r, int vm, double sp, double poj)
    {
        marka = m;
        kolor = k;
        rocznik = r;
        vmax = vm;
        spalanie = sp;
        poj_silnika = poj;
    }

    //Metoda toString
    public String toString()
    {
        return "Samochod " + marka + " rocznik: " + rocznik + ", spalanie (l/100 km): " + spalanie +
        ", vmax (km/h): " + vmax + " poj silnika (l): " + poj_silnika;
    }


    //odczyt z pliku
    public boolean odczyt(String path)
    {
        try
        {
            
            FileInputStream plik = new FileInputStream(path);
            ObjectInputStream input = new ObjectInputStream(plik);

            Samochod pom = (Samochod)input.readObject();

            marka = pom.marka;
            kolor = pom.kolor;
            rocznik = pom.rocznik;
            vmax = pom.vmax;
            spalanie = pom.spalanie;
            poj_silnika = pom.poj_silnika;
            
            input.close();
            plik.close();

            return true;

        }
        catch (Exception exc)
        {
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

            output.writeObject(this.toString());
            
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