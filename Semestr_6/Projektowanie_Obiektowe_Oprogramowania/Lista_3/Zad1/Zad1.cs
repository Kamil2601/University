using System;
using System.Collections.Generic;



abstract class Shape
{
    public abstract void moveBy(float delta_x, float delta_y);
};

class Point : Shape
{
    public float x, y;

    public Point(float x_, float y_)
    {
        x = x_;
        y = y_;
    }

    public override void moveBy(float delta_x, float delta_y)
    {
        x += delta_x;
        y += delta_y;
    }

    public override String ToString()
    {
        return "Point(" + x + "," + y + ")";
    }
}

class Square : Shape
{
    public Point a, b;

    public Square(float xa, float ya, float xb, float yb)
    {
        // Creator - obiekty Point są składowymi obiektu Square, więc są tworzone przez obiekt Square
        // Expert - obiekt Square zawiera wszystkie informacje potrzebne do stworzenia Point i go tworzy
        a = new Point(xa, ya);
        b = new Point(xb, yb);
    }

    public override void moveBy(float delta_x, float delta_y)
    {
        a.moveBy(delta_x, delta_y);
        b.moveBy(delta_x, delta_y);
    }

    public override String ToString()
    {
        return "Square[" + a + "," + b + "]";
    }
};

class Circle : Shape
{
    public Point center;
    private float radius;

    public override void moveBy(float delta_x, float delta_y)
    {
        center.moveBy(delta_x, delta_y);
    }

    public Circle(float x, float y, float r)
    {
        center = new Point(x,y);
        radius = r;
    }

    public float getRadius()
    {
        return radius;
    }

    public void setRadius(float newRadius)
    {
        if (newRadius > 0)
        {
            radius = newRadius;
        }
    }

    public override String ToString()
    {
        return "Circle[" + center + "," + radius + "]";
    }
}

class Surface
{
    public List<Shape> shapeList;

    public Surface()
    {
        shapeList = new List<Shape>();
    }

    // Polimorfizm, Low coupling - klasa Surface jest powiązana z klasą Shape, nie jest powiązana z klasami konkretnych figur
    // Po wprowadzeniu klas innych figur, klasa surface dalej będzie dobrze działała
    public void moveAllShapes(float delta_x, float delta_y)
    {
        foreach (Shape s in shapeList)
        {
            s.moveBy(delta_x, delta_y);
        }
    }

    public void addShape(Shape shape)
    {
        shapeList.Add(shape);
    }

    public void showAll()
    {
        foreach (Shape s in shapeList)
        {   
            // Protected variations - zmiany w metodach ToString klas nie wpłyną na działanie metody showAll
            Console.WriteLine(s.ToString());
        }
    }
}


class Program
{
    public static void Main()
    {
        Console.WriteLine("Hello World");

        Surface surf = new Surface();
        surf.addShape(new Square(1.0f,1.0f,2.0f,2.0f));
        surf.addShape(new Square(1.0f,1.0f,3.0f,2.0f));
        surf.addShape(new Circle(0.0f,0.0f,2.0f));

        surf.moveAllShapes(3.0f, 3.0f);

        surf.showAll();
    }
}