// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
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

    //Liczenie pochodnej
    public Wyrazenie pochodna()
    {
        Wyrazenie lp = left.pochodna();
        Wyrazenie pp = right.pochodna();
        if (left instanceof Stala && right instanceof Stala)
        {
            return new Stala(0);
        }
        else if (left instanceof Zmienna && right instanceof Zmienna)
        {
            return new Mnozenie(new Stala(2), right);
        }
        else if (left instanceof Stala && right instanceof Zmienna)
        {
            return left;
        }
        else if (right instanceof Stala && left instanceof Zmienna)
        {
            return right;
        }
        else if (lp instanceof Stala && lp.oblicz()==0)
        {
            return new Mnozenie(left, pp);
        }
        else if (pp instanceof Stala && pp.oblicz()==0)
        {
            return new Mnozenie(lp, right);
        }
        else
        {
            return new Dodawanie(new Mnozenie(lp, right), new Mnozenie(left, pp));
        }
    }
}