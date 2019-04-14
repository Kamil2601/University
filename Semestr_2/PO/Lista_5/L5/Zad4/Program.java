// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
// Program
// Program.java
// 2018-03-29

public class Program
{
    //Program testujący
    public static void main(String args[])
    {
        Zmienna x = new Zmienna("x");
        Dzielenie l = new Dzielenie(new Stala(2), new Mnozenie(x,x));
        Wyrazenie poch = l.pochodna();
        Dodawanie suma = new Dodawanie( new Mnozenie(x,x),
                        new Mnozenie(x,x));
        Wyrazenie p_sumy = suma.pochodna();
        x.dodaj(1);
        System.out.print("f1(x) = ");
        System.out.println(suma);
        System.out.print("f1'(x) = ");
        System.out.println(p_sumy);
        System.out.print("f1'(1) = ");
        System.out.println(p_sumy.oblicz());
        System.out.print("f2(x) = ");
        System.out.println(l);
        System.out.print("f2'(x) = ");
        System.out.println(poch);
        System.out.print("f2'(1) = ");
        System.out.println(poch.oblicz());

        Mnozenie iloczyn = new Mnozenie(new Dodawanie(x, new Mnozenie(x, x)),
                            new Odejmowanie(x, new Stala(2)));
        System.out.print("f3(x) = ");
        System.out.println(iloczyn);
        System.out.println(iloczyn.pochodna());
        System.out.print("f3(1) = ");
        System.out.println(iloczyn.pochodna().oblicz());
    }
}