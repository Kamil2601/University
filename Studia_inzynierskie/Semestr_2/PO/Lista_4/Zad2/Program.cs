// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z2, PrimeCollection
// PrimeCollection
// Program.cs
// 2018-03-12

using System;

namespace Zad2
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			//Przeglądanie kolekcji
			PrimeCollection pc = new PrimeCollection();
			foreach(int p in pc)
			{
				Console.WriteLine(p);
				Console.Read();
			}
		}
	}
}
