using System;

namespace Zad2
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Dict <double, string> slownik = new Dict<double,string>();

			bool koniec = false;

			int wybor;



			while (!koniec)
			{
				Console.Clear();
				Console.WriteLine ("Program obslugujacy slownik napisow indeksowanych liczbami typu double");
				Console.WriteLine ("Wybierz operacje: ");
				Console.WriteLine ("1.Dodaj obiekt");
				Console.WriteLine ("2.Usun obiekt");
				Console.WriteLine ("3.Znajdz obiekt");
				Console.WriteLine ("4.Wyjdz");
				Console.Write ("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch (wybor)
				{
				case 1:
					{
						double klucz;
						string napis;
						Console.Write ("Podaj klucz: ");
						klucz = Convert.ToDouble(Console.ReadLine());
						Console.Write ("Podaj wartosc: ");
						napis = Console.ReadLine();
						slownik.addto(klucz, napis);
						Console.WriteLine("Dodano obiekt");
						Console.Read();
						break;
					}
				case 2:
					{
						double klucz;
						Console.Write ("Podaj klucz: ");
						klucz = Convert.ToDouble(Console.ReadLine());
						if (slownik.search_b(klucz))
						{
							slownik.delfrom(klucz);
							Console.WriteLine ("Usunieto obiekt");
							Console.Read();
						}
						else
						{
							Console.WriteLine("Nie znaleziono obiektu");
							Console.Read();
						}
						break;
					}
				case 3:
					{
						double klucz;
						string napis;
						Console.Write ("Podaj klucz: ");
						klucz = Convert.ToDouble(Console.ReadLine());
						if (slownik.search_b(klucz))
						{
							napis = slownik.search(klucz);
							Console.WriteLine ("Znaleziono obiekt: {0}", napis);
							Console.Read();
						}
						else
						{
							Console.WriteLine("Nie znaleziono obiektu");
							Console.Read();
						}
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
