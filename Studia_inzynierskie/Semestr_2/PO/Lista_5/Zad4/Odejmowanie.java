// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
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

    //Liczenie pochodnej
    public Wyrazenie pochodna()
    {
        Wyrazenie lewy = left.pochodna();
        Wyrazenie prawy = right.pochodna();
        if (lewy instanceof Stala && prawy instanceof Stala)
        {
            return new Stala(lewy.oblicz()-prawy.oblicz());
        }
        else if (lewy instanceof Zmienna && prawy instanceof Zmienna)
        {
            return new Stala(0);
        }
        else if(lewy instanceof Stala && lewy.oblicz()==0)
        {
            return new Mnozenie(new Stala(-1), prawy);
        }
        else if(prawy instanceof Stala && prawy.oblicz()==0)
        {
            return lewy;
        }
        else if(lewy == prawy)
        {
            return new Stala(0);
        }
        else
        {
            return new Odejmowanie(lewy, prawy);
        }
    }
}