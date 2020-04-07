// Projekt jest niezgodny z zasadami OCP, żeby dopisać nowe możliwości np. nową stawkę podatkową
// trzeba modyfikować istniejące klasy.

using System;

public class TaxCalculator
{
    // Rozszerzenie 1 - różne stawki podatkowe
    public decimal CalculateTax(decimal price, decimal taxRate)
    {
        return price * taxRate;
    }
}
public class Item
{
    private decimal price, taxRate; //Rozszerzenie 1 cd
    private string name;

    public Item(string name, decimal price, decimal taxRate)
    {
        this.name = name;
        this.price = price;
    }

    public decimal Price { get { return price;}}
    public decimal TaxRate { get { return taxRate;}} //Rozszerzenie 1 cd
    public string Name { get { return name; } }
}
public class CashRegister
{
    public TaxCalculator taxCalc = new TaxCalculator();
    public decimal CalculatePrice(Item[] Items)
    {
        decimal _price = 0;
        foreach (Item item in Items)
        {
            _price += item.Price + taxCalc.CalculateTax(item.Price, item.TaxRate); // Rozszerzenie 1 cd
        }
        return _price;
    }
    public void PrintBill(Item[] Items, int printType)
    {
        // Rozszerzenie 2 - wypisanie posortowanej listy towarów
        if (printType == 1)
        {
            Array.Sort(Items);
        }

        foreach (var item in Items)
        {
            Console.WriteLine("towar {0} : cena {1} + podatek {2}",
            item.Name, item.Price, taxCalc.CalculateTax(item.Price, item.TaxRate));
        }
    }
}

class Program{
    public static void Main()
    {

    }
}