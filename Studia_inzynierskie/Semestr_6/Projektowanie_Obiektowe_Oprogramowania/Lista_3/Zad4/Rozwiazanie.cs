// Rozwiązanie, żeby kod klienta działał poprawnie
// public class Square : Rectangle
// {
//     public override int Width
//     {
//         get { return base.Width; }
//         set { base.Width = value; }
//     }
//     public override int Height
//     {
//         get { return base.Height; }
//         set { base.Height = value; }
//     }
// }



// Bardziej sensowne rozwiązanie, ale kod klienta nie zadziała
using System;

public abstract class Shape
{
    public abstract int area();
}

public class Rectangle : Shape
{
    public int Width { get; set; }
    public int Height { get; set; }

    public override int area()
    {
        return Width * Height;
    }
}
public class Square : Shape
{
    public int Width { get; set;}

    public override int area()
    {
        return Width * Width;
    }
}

//---------------------------------------------------

public class AreaCalculator
{
    public int CalculateArea(Rectangle rect)
    {
        return rect.Width * rect.Height;
    }
}

public class Program
{
    public static void Main()
    {
        int w = 4, h = 5;
        Rectangle rect = new Rectangle() { Width = w, Height = h };
        AreaCalculator calc = new AreaCalculator();
        Console.WriteLine( "prostokąt o wymiarach {0} na {1} ma pole {2}",
        w, h, calc.CalculateArea( rect ) );
    }
}
