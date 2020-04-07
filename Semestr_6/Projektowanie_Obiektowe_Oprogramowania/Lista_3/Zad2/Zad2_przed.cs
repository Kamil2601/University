using System;

class ReportPrinter{

    private string document;
    public string GetData(){
        return "Some data";
    }

    public void FormatDocument(){
        document = "Report\n" + GetData();
    }

    public void PrintReport(){
        Console.WriteLine(document);
    }
};


class Program{
    public static void Main()
    {
        ReportPrinter reportPrinter = new ReportPrinter();
        reportPrinter.FormatDocument();
        reportPrinter.PrintReport();
    }
}