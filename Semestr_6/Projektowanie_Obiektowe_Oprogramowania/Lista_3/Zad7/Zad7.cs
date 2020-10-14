using System;

class DataLoader{
    public string LoadData()
    {
        return "Some data";
    }
}

class Formatter{
    public string FormatDocument(string document)
    {
        return "Report\n" + document;
    }
}

class Printer{

    public void PrintDocument(string document){
        Console.WriteLine(document);
    }
}

class ReportComposer
{
    DataLoader dataLoader;
    Formatter formatter;
    Printer printer;

    public ReportComposer(DataLoader dataLoader, Formatter formatter, Printer printer)
    {
        this.dataLoader = dataLoader;
        this.formatter = formatter;
        this.printer = printer;
    }

    public void ComposeReport()
    {
        string data = dataLoader.LoadData();
        string report = formatter.FormatDocument(data);
        printer.PrintDocument(report);
    }
}

class Program{
    public static void Main()
    {
        var composer = new ReportComposer(
            new DataLoader(), new Formatter(), new Printer());
        composer.ComposeReport();
    }
}