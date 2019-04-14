import java.awt.desktop.SystemEventListener;

// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z2, Wyrazenia w drzewach
// Program
// Program.java
// 2018-03-29

public class Program
{
    //Program testujący
    public static void main(String args[])
    {
        Odejmowanie a = new Odejmowanie(new Stala(2), new Zmienna("a"));
        Mnozenie b = new Mnozenie(a, new Zmienna("y"));
        Dzielenie c = new Dzielenie (a,a);
        Zmienna.dodaj("a", 1);
        Zmienna.dodaj("y", 10);
        System.out.print("a = ");
        System.out.println(a.oblicz());
        System.out.println(c);
        System.out.println(c.oblicz());
        Dodawanie suma = new Dodawanie (new Mnozenie(new Stala(3), new Zmienna("a")),
                        new Odejmowanie (new Stala(10), new Stala(2)));
        Dzielenie iloraz = new Dzielenie(a, suma);
        System.out.println(suma);
        System.out.println(suma.oblicz());
        System.out.println(iloraz);
        System.out.println(iloraz.oblicz());
        Odejmowanie roznica = new Odejmowanie (suma,suma);
        System.out.print(roznica);
        System.out.print(" = ");
        System.out.println(roznica.oblicz());
        Dodawanie suma2 = new Dodawanie (suma,roznica);
        System.out.print(suma2);
        System.out.print(" = ");
        System.out.println(suma.oblicz());
        Mnozenie iloczyn = new Mnozenie(new Stala(2), new Stala(3));
        Dzielenie iloraz2 = new Dzielenie (suma2, iloczyn);
        System.out.print(iloraz2);
        System.out.print(" = ");
        System.out.println(iloraz2.oblicz());  
    }
}