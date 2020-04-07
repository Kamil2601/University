using System;

class Data{
    private string data;

    public Data(string d)
    {
        data = d;
    }

    public void PrintData()
    {
        Formatter formatter = new Formatter(data);
        formatter.FormatDocument();
        formatter.PrintDocument();
    }
}

class Formatter{
    private string document;

    public Formatter(string data)
    {
        document = data;
    }

    public void FormatDocument()
    {
        document = "Report\n" + document;
    }

    public void PrintDocument()
    {
        Printer printer = new Printer(document);
        printer.PrintDocument();
    }
}

class Printer{

    private string document;
    public Printer(string doc)
    {
        document = doc;
    }

    public void PrintDocument(){
        Console.WriteLine(document);
    }
}

class Program{
    public static void Main()
    {
        Data data = new Data("Some data");
        data.PrintData();
    }
}