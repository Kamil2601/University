using System;
using System.Diagnostics.CodeAnalysis;
using JPS.Algorithm;

namespace JPS
{

    class A : IComparable<A>
    {
        public A(int x)
        {
            X = x;
        }

        public int X { get; }

        public int CompareTo([AllowNull] A other)
        {
            var result = X.CompareTo(other.X);

            if (result == 0)
            {
                return this.GetHashCode().CompareTo(other.GetHashCode());
            }

            return result;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // Preprocessing preprocessing = new Preprocessing();
            // preprocessing.Run();
            // preprocessing.PrintSolution();

            Runtime runtime = new Runtime();
            runtime.LoadInput();
            runtime.Run();

            // PriorityQueue<A> q = new PriorityQueue<A>();
            // q.Push(new A(1));
            // q.Push(new A(1));

        }
    }
}
