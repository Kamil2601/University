// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z2, Wyrazenia w drzewach
// Dodawanie
// Dodawanie.java
// 2018-03-29

//Klasa obliczająca sumę
public class Dodawanie extends Wyrazenie
{
    //Referencje do podwyrażeń
    Wyrazenie left;
    Wyrazenie right;

    //Konstruktor
    public Dodawanie(Wyrazenie a, Wyrazenie b)
    {
        left = a;
        right = b;
    }

    //Metoda obliczająca
    public float oblicz()
    {
        //Wywołanie rekurencyjne
        return left.oblicz()+right.oblicz();
    }
    
    //Zwrócenie działania w formie napisu
    public String toString()
    {
        return "(" + left.toString() + "+" + right.toString() + ")";
    }
}