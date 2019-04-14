// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z2, Wyrazenia w drzewach
// Dzielenie
// Dzielenie.java
// 2018-03-29

//Klasa obliczająca iloraz
public class Dzielenie extends Wyrazenie
{
    //Referencje do podwyrażeń
    Wyrazenie left;
    Wyrazenie right;

    //Konstruktor
    public Dzielenie(Wyrazenie a, Wyrazenie b)
    {
        left = a;
        right = b;
    }

    //Metoda obliczająca
    public float oblicz()
    {
        //Wyjątek - dzielenie przez 0
        if (right.oblicz()==0)
        {
            throw new ArithmeticException("Nie mozna dzielić przez 0");
        }
        //Wywołanie rekurencyjne
        return left.oblicz()/right.oblicz();
    }

    //Zwrócenie działania w formie napisu
    public String toString()
    {
        //Wywołanie rekurencyjne
        return "(" + left.toString() + "/" + right.toString() + ")";
    }
}