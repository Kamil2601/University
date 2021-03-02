// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
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

    //Obliczenie pochodnej
    public Wyrazenie pochodna()
    {
        Wyrazenie lewy = left.pochodna();
        Wyrazenie prawy = right.pochodna();
        if (lewy instanceof Stala && prawy instanceof Stala)
        {
            return new Stala(lewy.oblicz()+prawy.oblicz());
        }
        else if (lewy instanceof Zmienna && prawy instanceof Zmienna)
        {
            return new Mnozenie(new Stala(2), prawy);
        }
        else if(lewy instanceof Stala && lewy.oblicz()==0)
        {
            return prawy;
        }
        else if(prawy instanceof Stala && prawy.oblicz()==0)
        {
            return lewy;
        }
        else
        {
            return new Dodawanie(lewy, prawy);
        }
    }
}