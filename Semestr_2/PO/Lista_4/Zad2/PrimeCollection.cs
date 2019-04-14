// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z2, PrimeCollection
// PrimeCollection
// PrimeCollection.cs
// 2018-03-12


using System;

using System.Collections;

namespace Zad2
{
	public class PrimeCollection : IEnumerable
	{

		public IEnumerator GetEnumerator()
		{
			return new PrimeEnum();
		}
	}

	public class PrimeEnum : IEnumerator
	{
		int liczba=1;

		//sprawdzenie czy liczba jest pierwsza
		private bool pierwsza()
		{
			for (int i=2; i<=Math.Sqrt(liczba); i++)
			{
				if (liczba%i==0)
				{
					return false;
				}
			}
			return true;
		}

		//Znalezienie kolejnej liczby pierwszej
		public bool MoveNext()
		{
			liczba++;
			while (!pierwsza() && liczba<Int32.MaxValue)
			{
				liczba++;
			}
			if (liczba==Int32.MaxValue)
			{
				return false;
			}
			else
			{
				return true;
			}

		}

		//zwrócenie aktualnej liczby
		object IEnumerator.Current
		{
			get
			{
				return liczba;
			}
		}
		//resetowanie kolekcji
		public void Reset()
		{
			liczba = 1;	
		}
	}
}

