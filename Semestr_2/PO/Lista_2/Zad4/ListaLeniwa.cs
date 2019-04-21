//Kamil Michalak 299089
//Klasy implementujace listy leniwe
using System.Collections.Generic;
using System;

namespace Zad_4
{
	public class ListaLeniwa
	{
		protected List<int> lista;
		private static readonly Random losuj = new Random();

		public ListaLeniwa ()
		{
			lista = new List<int>();
		}

		public int size()
		{
			return lista.Count;
		}

		public int element(int i)
		{
			if (i < 0)
			{
				Console.WriteLine ("Podano bledny indeks");
				return 0;
			} 
			else if (i < lista.Count)
			{
				return lista[i];
			} 
			else 
			{
				for (int j = lista.Count; j <= i; j++) 
				{
					lista.Add (losuj.Next ());
				}
				return lista[i];
			}

		}

		public void wyswietl_element()
		{
			int indeks;
			Console.Clear();
			Console.Write("Podaj indeks elementu: ");
			indeks = Convert.ToInt32(Console.ReadLine());
			Console.WriteLine(element(indeks));
			Console.Read();
		}

		public void wyswietl_przedzial()
		{
			int poczatek, koniec;
			Console.Clear();
			Console.Write("Podaj poczatek przedzialu: ");
			poczatek = Convert.ToInt32(Console.ReadLine());
			if (poczatek<0)
				poczatek=0;

			Console.Write("Podaj koniec przedzialu: ");
			koniec = Convert.ToInt32(Console.ReadLine());

			for (int i=poczatek; i<=koniec; i++)
			{
				Console.WriteLine(this.element(i));
			}

			Console.Read();
		}

		public void wyswietl_rozmiar()
		{
			Console.Clear();
			Console.Write("Rozmiar tablicy: {0}", size());
			Console.Read();
		}
	}

	public class Pierwsza : ListaLeniwa
	{
		private bool pierwsza(int x)
		{
			for (int i = 2; i <= Math.Sqrt(x); i++)
			{
				if (x % i == 0)
				{
					return false;
				}
			}
			return true;
		}

		new public int element(int i)
		{
			if (i < 0)
			{
				Console.WriteLine ("Podano bledny indeks");
				return 0;
			} 
			else if (i < lista.Count)
			{
				return lista[i];
			} 
			else 
			{
				for (int j = lista.Count; j <= i; j++) 
				{
					int p;
					if (j == 0)
					{
						p = 1;
					}
					else
					{
						p = lista[j-1];
					}
					for (int k = p+1; k<= Int32.MaxValue; k++)
					{
						if (pierwsza(k))
						{
							lista.Add (k);
							break;
						}
					}
				}
				return lista[i];
			}

		}

		new public void wyswietl_element()
		{
			int indeks;
			Console.Clear();
			Console.Write("Podaj indeks elementu: ");
			indeks = Convert.ToInt32(Console.ReadLine());
			Console.WriteLine(element(indeks));
			Console.Read();
		}

		new public void wyswietl_przedzial()
		{
			int poczatek, koniec;
			Console.Clear();
			Console.Write("Podaj poczatek przedzialu: ");
			poczatek = Convert.ToInt32(Console.ReadLine());
			if (poczatek<0)
				poczatek=0;

			Console.Write("Podaj koniec przedzialu: ");
			koniec = Convert.ToInt32(Console.ReadLine());

			for (int i=poczatek; i<=koniec; i++)
			{
				Console.WriteLine(this.element(i));
			}

			Console.Read();
		}
	}
}

