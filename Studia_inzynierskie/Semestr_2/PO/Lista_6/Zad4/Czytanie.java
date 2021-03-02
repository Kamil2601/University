// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Filtrowanie i sortowanie
// Czytanie
// Czytanie.java
// 2018-04-05

import java.util.Scanner;

import javax.xml.stream.events.EndDocument;

class Czytanie extends Thread
{
    Bufor<String> buf;
    String nazwisko;


    //Konstruktor wątku
    public Czytanie(Bufor<String>  b)
    {
        buf = b;
    }

    //Funkcja filtrująca nazwiska
    private boolean filtr(String nazw)
    {
        if (nazw.charAt(0)=='K')
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //Działanie wątku
    public void run()
    {
        Scanner odczyt = new Scanner(System.in);
        while (odczyt.hasNextLine())
        {
            if (buf.pelny())
            {
                try
                {
                    sleep(100);
                }
                catch (InterruptedException e) {}
            }
            else
            {
                nazwisko = odczyt.nextLine();
                if (filtr(nazwisko))
                {
                    buf.dodaj(nazwisko);
                }
            }   
        }

        odczyt.close();
    }
}