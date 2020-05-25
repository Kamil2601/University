using System;
using Container;

namespace Zad1
{
    class A
    {
        public A(int a)
        {
            Console.WriteLine("A created");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            SimpleContainer xd = new SimpleContainer();
            // Console.WriteLine(xd.GetType());
            typeof(A).GetConstructor(Type.EmptyTypes).Invoke(Type.EmptyTypes);
        }
    }
}
