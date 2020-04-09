using System;
using System.Collections.Generic;

namespace Factory
{
    public interface IShape{
        int getWidth();
        int getHeight();
    }

    public interface IShapeFactoryWorker{
        bool AcceptParameters(string name, params object[] parameters);
        IShape Create(params object[] parameters);
    }

    public class Square : IShape{
        public int size;

        public Square(int size)
        {
            this.size = size;
        }

        public int getHeight()
        {
            return this.size;
        }

        public int getWidth()
        {
            return this.size;
        }
    }

    public class SquareFactoryWorker : IShapeFactoryWorker{

        public bool AcceptParameters(string name, params object[] parameters)
        {
            return name == "Square" && parameters.Length==1;
        }

        public IShape Create(params object[] parameters)
        {
            return new Square((int)parameters[0]);
        }
    }

    public class ShapeFactory
    {
        private List<IShapeFactoryWorker> workers = new List<IShapeFactoryWorker>();

        public ShapeFactory()
        {
            RegisterWorker(new SquareFactoryWorker());
        }

        public void RegisterWorker(IShapeFactoryWorker worker)
        {
            workers.Add(worker);
        }

        public IShape CreateShape(string shapeName, params object[] parameters)
        {
            foreach (IShapeFactoryWorker worker in workers)
            {
                if (worker.AcceptParameters(shapeName,parameters))
                {
                    return worker.Create(parameters);
                }
            }

            throw new ArgumentNullException();
        }
    }
}
