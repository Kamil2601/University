// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L5, z4, Pochodne
// Wyrazenie
// Wyrazenie.java
// 2018-03-29

//klasa bazowa
public class Wyrazenie 
{
    //Metody przesłonięte w klasach pochodnych

    //obliczenie wartośći wyrażenia
    public float oblicz()
    {
        return 0;
    }

    //Wypisanie wartości jako napisu
    public String toString()
    {
        return "";
    }

    //Obliczenie pochodnej z funkcji
    //W większości przypadków metoda nie zwraca pochodnej w najkrótszej formie,
    //ale zawsze jest ona poprawna i przy podstawieniu liczby pod zmienną daje dobry wynik
    public Wyrazenie pochodna()
    {
        return this;
    }
}