// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z2, Wyrazenia w drzewach
// Mnozenie
// Mnozenie.java
// 2018-03-29


//Klasa obliczająca iloczyn
public class Mnozenie extends Wyrazenie
{
    //Referencje do podwyrażeń
    Wyrazenie left;
    Wyrazenie right;


    //Konstruktor
    public Mnozenie(Wyrazenie a, Wyrazenie b)
    {
        left = a;
        right = b;
    }

    //Metoda obliczająca
    public float oblicz()
    {
        //Wywołanie rekurencyjne
        return left.oblicz()*right.oblicz();
    }

    //Zwrócenie działania w formie napisu
    public String toString()
    {
        //Wywołanie rekurencyjne
        return "(" + left.toString() + "*" + right.toString() + ")";
    }
}