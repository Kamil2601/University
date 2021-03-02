using NUnit.Framework;
using Factory;
using System;

public class Rectangle : IShape
{
    public int width, height;

    public Rectangle(int width, int height)
    {
        this.width = width;
        this.height = height;
    }

    public int getWidth()
    {
        return width;
    }

    public int getHeight()
    {
        return height;
    }

}

public class RectangleFactoryWorker : IShapeFactoryWorker
{
    public bool AcceptParameters(string name, params object[] parameters)
    {
        return name == "Rectangle" && parameters.Length >= 2;
    }

    public IShape Create(params object[] parameters)
    {
        return new Rectangle((int)parameters[0], (int)parameters[1]);
    }
}

namespace UnitTests
{
    public class Tests
    {
        [Test]
        public void CreateIntSquare()
        {
            ShapeFactory factory = new ShapeFactory();
            IShape square = factory.CreateShape("Square", 5);

            Assert.IsNotNull(square);
            Assert.AreEqual(square.getHeight(), 5);
        }

        [Test]

        public void ShapeNotExist()
        {
            ShapeFactory factory = new ShapeFactory();

            Assert.Throws<ArgumentNullException>( () =>
                factory.CreateShape("Circle", 5)
            );
        }

        [Test]
        public void ExtendFactory()
        {
            ShapeFactory factory = new ShapeFactory();
            factory.RegisterWorker(new RectangleFactoryWorker());
            IShape rect = factory.CreateShape("Rectangle", 3, 5);

            Assert.IsNotNull(rect);
        }
    }
}