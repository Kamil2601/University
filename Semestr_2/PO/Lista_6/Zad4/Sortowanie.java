// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Filtrowanie i sortowanie
// Sortowanie
// Sortowanie.java
// 2018-04-05

import java.util.Vector;

//Wątek
class Sortowanie extends Thread
{
    Bufor<String> buf;
    String nazwisko;
    Vector<String> posortowane = new Vector<String>();

    //Konstruktor wątku
    public Sortowanie(Bufor<String>  b)
    {
        buf = b;
    }


    //Funkcja porównująca leksykograficznie 2 napisy
    private boolean mniejszy(String a, String b)
    {
        int n;
        boolean wynik;
        if (a.length()<b.length())
        {
            n = a.length();
            wynik = true;
        }
        else
        {
            n = b.length();
            wynik = false;
        }

        for (int i=0; i<n; i++)
        {
            if (a.charAt(i)<b.charAt(i))
            {
                return true;
            }
            else if (a.charAt(i)>b.charAt(i))
            {
                return false;
            }
        }

        return wynik;
    }

    //Działanie wątku
    public void run()
    {
        int i = 0;
        boolean wstawiony = false;
        while (i<3)
        {
            if (buf.pusty())
            {
                try
                {
                    sleep(100);
                    i++;
                }
                catch (InterruptedException e) {}
            }
            else
            {
                i=0;
                wstawiony = false;
                nazwisko = buf.pobierz();
                for (int j=0; j<posortowane.size(); j++)
                {
                    if (mniejszy(nazwisko, posortowane.elementAt(j)))
                    {
                        posortowane.add(j, nazwisko);
                        wstawiony = true;
                        break;
                    }
                }
                if (wstawiony==false)
                {
                    posortowane.add(nazwisko);
                }
            }
        }

        for (int j=0; j<posortowane.size(); j++)
        {
            System.out.println(posortowane.elementAt(j));
        }
    }
}