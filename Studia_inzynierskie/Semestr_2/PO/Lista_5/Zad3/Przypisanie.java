class Przypisanie extends Instrukcja
{
    String zmienna;
    Wyrazenie wartosc;

    Przypisanie(string n, Wyrazenie wyr)
    {
        zmienna = n;
        wartosc = wyr;
    }
}