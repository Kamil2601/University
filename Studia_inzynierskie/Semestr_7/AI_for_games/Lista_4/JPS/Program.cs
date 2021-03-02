using System;
using System.Diagnostics.CodeAnalysis;
using JPS.Algorithm;

namespace JPS
{


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
        }
    }
}
