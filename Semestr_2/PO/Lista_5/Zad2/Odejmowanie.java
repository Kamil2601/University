// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z2, Wyrazenia w drzewach
// Odejmowanie
// Odejmowanie.java
// 2018-03-29


//Klasa obliczająca róznicę
public class Odejmowanie extends Wyrazenie
{
    //Referencje do podwyrażeń
    Wyrazenie left;
    Wyrazenie right;


    //Konstruktor
    public Odejmowanie(Wyrazenie a, Wyrazenie b)
    {
        left = a;
        right = b;
    }

    public float oblicz()
    {
        return left.oblicz()-right.oblicz();
    }

    public String toString()
    {
        return "(" + left.toString() + "-" + right.toString() + ")";
    }
}