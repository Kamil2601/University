//Kamil Michalak 299089
//Program obslugujacy 2 listy leniwe, jedna z nich zawiera liczby losowe, druga kolejne liczby pierwsze.
//Dostepne operacje widoczne w interfejsie.

using System;

namespace Zad_4
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			ListaLeniwa lista = new ListaLeniwa ();
			Pierwsza pierwsze = new Pierwsza();

			bool koniec = false;
			int wybor = 0;

			while (koniec == false)
			{
				Console.Clear();
				Console.WriteLine ("Program operujacy na 2 listach leniwych - jednej z liczbami losowymi, druga z kolejnymi liczbami pierwszymi");
				Console.WriteLine ("Wybierz operacje:");
				Console.WriteLine ("1.Wyswietlenie elementu o podanym indeksie (lista losowa).");
				Console.WriteLine ("2.Wyswietlenie elementow z podanego przedzialu (lista losowa).");
				Console.WriteLine ("3.Wyswietlenie rozmiaru listy (lista losowa).");
				Console.WriteLine ("4.Wyswietlenie elementu o podanym indeksie (lista pierwsza).");
				Console.WriteLine ("5.Wyswietlenie elementow z podanego przedzialu (lista pierwsza).");
				Console.WriteLine ("6.Wyswietlenie rozmiaru listy (lista pierwsza).");
				Console.WriteLine ("7.Zakoncz");
				Console.Write ("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch(wybor)
				{
				case 1:
					{
						lista.wyswietl_element();
						break;
					}
				case 2:
					{
						lista.wyswietl_przedzial();
						break;
					}
				case 3:
					{
						lista.wyswietl_rozmiar();
						break;
					}
				case 4:
					{
						pierwsze.wyswietl_element();
						break;
					}
				case 5:
					{
						pierwsze.wyswietl_przedzial();
						break;
					}
				case 6:
					{
						pierwsze.wyswietl_rozmiar();
						break;
					}
				default:
					{
						koniec = true;
						break;
					}
				}
			}
		}
	}
}
