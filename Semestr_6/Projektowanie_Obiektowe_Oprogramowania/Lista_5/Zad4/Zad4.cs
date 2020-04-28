using System;
using System.Collections;

class Program
{
    /* this is the Comparison<int> to be converted */
    static int IntComparer(int x, int y)
    {
        return x.CompareTo(y);
    }

    class Adapter : IComparer
    {
        public int Compare(object x, object y)
        {
            return IntComparer((int)x, (int)y);
        }
    }

    static void Main(string[] args)
    {
        ArrayList a = new ArrayList() { 1, 5, 3, 3, 2, 4, 3 };

        /* the ArrayList's Sort method accepts ONLY an IComparer */
        a.Sort(new Adapter());

        for (int i=0; i<a.Count; i++)
        {
            Console.Write(a[i]);
        }
        Console.WriteLine();
    }
}