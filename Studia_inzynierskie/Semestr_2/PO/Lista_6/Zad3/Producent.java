// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Producent-Konsument
// Producent
// Producent.java
// 2018-04-05


//Klasa producenta
class Producent extends Thread
{
    Bufor<String> buf;

    public Producent(Bufor<String>  b)
    {
        //Podpięcie bufora w klasie do bufora zewnętrznego
        buf = b;
    }

    //Działanie producenta
    public void run()
    {
        //Uśpienie wątku jeśli bufor jest pełny
        for (int i = 0; i < 1000; i++)
        {
            if (buf.pelny())
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
                //w pp wątek dodaje element do bufora
                System.out.println("Producent dodaje: " + i); 
                buf.dodaj(Integer.toString(i));
            }
        }
    }
}