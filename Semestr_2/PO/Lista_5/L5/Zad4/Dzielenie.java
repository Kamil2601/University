// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
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

    public Wyrazenie pochodna()
    {
        Wyrazenie lp = left.pochodna();
        Wyrazenie pp = right.pochodna();

        if (right instanceof Stala && right.oblicz()==0)
        {
            throw new ArithmeticException("Dzielenie przez 0!");
        }
        else if (left instanceof Stala && right instanceof Stala)
        {
            return new Stala(0);
        }
        else if (left instanceof Zmienna && right instanceof Zmienna)
        {
            return new Stala(0);
        }
        else if (left instanceof Stala && right instanceof Zmienna)
        {
            return new Dzielenie(new Stala(-left.oblicz()), new Mnozenie(right, right));
        }
        else if (right instanceof Stala && left instanceof Zmienna)
        {
            return new Stala(1/right.oblicz());
        }
        
        else if (lp instanceof Stala && lp.oblicz()==0)
        {
            Mnozenie licznik = new Mnozenie(new Stala(-1), pp);
            return new Dzielenie(licznik, new Mnozenie(right, right));
        }
        else if (pp instanceof Stala && pp.oblicz()==0)
        {
            return new Dzielenie(new Mnozenie(lp, right), new Mnozenie(right, right));
        }
        else
        {
            Odejmowanie licznik =  new Odejmowanie(new Mnozenie(lp, right), new Mnozenie(left, pp));
            return new Dzielenie(licznik, new Mnozenie(right, right));
        }
    }
}