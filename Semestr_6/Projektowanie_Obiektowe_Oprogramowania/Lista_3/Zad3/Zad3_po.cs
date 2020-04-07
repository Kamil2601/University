using System;

public abstract class TaxCalculator
{
    public abstract decimal CalculateTax(decimal Price);
}

public class TaxCalculator1 : TaxCalculator
{
    public override decimal CalculateTax(decimal Price)
    {
        return Price * (decimal)0.22;
    }
}

// Rozszerzenie - nowy kalkulator stawki podatkowej
public class TaxCalculator2 : TaxCalculator
{
    public override decimal CalculateTax(decimal Price)
    {
        return Price * (decimal)0.1 + (decimal)5;
    }
}

public class Item
{
    private decimal price;
    private string name;
    private TaxCalculator taxCalc;

    public Item(string name, decimal price, TaxCalculator taxCalc)
    {
        this.name = name;
        this.price = price;
        this.taxCalc = taxCalc;
    }

    public decimal Price { get { return price;}}
    public string Name { get { return name; } }

    public decimal CalculateTax()
    {
        return taxCalc.CalculateTax(price);
    }

    public decimal CalculatePrice()
    {
        return price + CalculateTax();
    }
}

public abstract class BillPrinter
{
    public abstract void PrintBill(Item[] Items);
    
}

public class NormalBillPrinter : BillPrinter
{
    public override void PrintBill(Item[] Items)
    {
        foreach (var item in Items)
        {
            Console.WriteLine("towar {0} : cena {1} + podatek {2}",
            item.Name, item.Price, item.CalculateTax());
        }
    }
}

// Rozszerzenie - drukowanie posortowanej listy
public class SortedBillPrinter : BillPrinter
{
    public override void PrintBill(Item[] Items)
    {
        Array.Sort(Items);

        foreach (var item in Items)
        {
            Console.WriteLine("towar {0} : cena {1} + podatek {2}",
            item.Name, item.Price, item.CalculateTax());
        }
    }
}

public class CashRegister
{
    BillPrinter billPrinter;

    public CashRegister(BillPrinter billPrinter)
    {
        SetBillPrinter(billPrinter);
    }

    public void SetBillPrinter(BillPrinter billPrinter)
    {
        this.billPrinter = billPrinter;
    }

    public decimal CalculatePrice(Item[] Items)
    {
        decimal _price = 0;
        foreach (Item item in Items)
        {
            _price += item.CalculatePrice();
        }
        return _price;
    }
    public void PrintBill(Item[] Items)
    {
        billPrinter.PrintBill(Items);
    }
}

class Program{
    public static void Main()
    {

    }
}