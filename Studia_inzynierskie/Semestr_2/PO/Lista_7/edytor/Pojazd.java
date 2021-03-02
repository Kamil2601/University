// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pojazdy
// Pojazd
// Pojazd.java
// 2018-04-12

import java.io.Serializable;

//Abstrakcyjna klasa pojazd
public abstract class Pojazd implements Serializable
{
    private static final long serialVersionUID = 1L;

    public String marka;
    public String kolor;
    public int rocznik;

    public String toString()
    {
        return "";
    }

    public abstract boolean odczyt(String path);

    public abstract boolean zapis(String path);
}