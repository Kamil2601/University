// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Producent-Konsument
// Konsument
// Konsument.java
// 2018-04-05

import java.util.Vector;


//Klasa konsumenta
class Konsument extends Thread
{
    Bufor<String> buf;

    //Kontruktor
    public Konsument(Bufor<String>  b)
    {
        //Podpięcie bufora w klasie do bufora zewnętrznego
        buf = b;
    }

    //Działanie Konsumenta
    public void run()
    {
        for (int i = 0; i < 1000; i++)
        {
            //Uśpienie wątku jeśli bufor jest pusty
            if (buf.pusty())
            {
                try
                {
                    sleep(100);
                }
                catch (InterruptedException e)
                {

                }
            }
            else
            {
                //W pp pobranie elementu z bufora
                System.out.println("Konsument pobiera: " + buf.pobierz()); 
            }
        }
    }
}