// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Filtrowanie i sortowanie
// Program
// Program.java
// 2018-04-05

import java.util.Vector;

class Program
{
    public static void main(String[] args)
    {
        Bufor<String> kolejka = new Bufor<String>(10);
        Czytanie k = new Czytanie(kolejka);
        Sortowanie l = new Sortowanie(kolejka);
        k.start();
        l.start();
        
    }
}