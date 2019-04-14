// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L3, z1, Lista
// Lista
// Program.cs
// 2018-03-15


using System;

namespace Zad_1
{
	class MainClass
	{
		public static void Main (string[] args)
		{		
			bool koniec = false;
			int wybor = 0;

			Lista<int> lista = new Lista<int>();
			int liczba;

			while (koniec == false)
			{
				Console.Clear();
				Console.WriteLine("Program obsluguje liste liczb calkowitych. Wybierz operacje");
				Console.WriteLine("1.push_front()");
				Console.WriteLine("2.push_back()");
				Console.WriteLine("3.pop_front()");
				Console.WriteLine("4.pop_back()");
				Console.WriteLine ("5.Zakoncz");
				Console.Write ("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch (wybor)
				{
				case 1:
					{
						Console.Write("Podaj element: ");
						liczba = Convert.ToInt32(Console.ReadLine());
						lista.push_front(liczba);
						break;
					}
				case 2:
					{
						Console.WriteLine("Podaj element: ");
						liczba = Convert.ToInt32(Console.ReadLine());
						lista.push_back(liczba);
						break;
					}
				case 3:
					{
						if (lista.pusta())
						{
							Console.WriteLine("Lista pusta!");
						}
						else
						{
							Console.Write("Element usuniety z listy: ");
							Console.Write(lista.pop_front());
						}
						Console.Read();
						break;
					
					}
				case 4:
					{
						if (lista.pusta())
						{
							Console.WriteLine("Lista pusta!");
						}
						else
						{
							Console.Write("Element usuniety z listy: ");
							Console.Write(lista.pop_back());
						}
						Console.Read();
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
