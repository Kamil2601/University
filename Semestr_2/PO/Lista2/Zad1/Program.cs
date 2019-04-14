//Kamil Michalak 299089
//Program obsluguje 4 strumienie (opisane w pliku z klasami i w interfejsie)
using System;

namespace Zad_1
{
	class MainClass
	{

		public static void Main (string[] args)
		{
			IntStream liczby = new IntStream();
			PrimeStream pierwsze = new PrimeStream();
			RandomStream losowe = new RandomStream();
			RandomWordStream napisy = new RandomWordStream();

			bool koniec = false;
			int wybor = 0;

			while (koniec == false)
			{
				Console.Clear();
				Console.WriteLine("Program obsluguje 4 strumienie, wybierz strumien.");
				Console.WriteLine("1.Liczby naturalne.");
				Console.WriteLine("2.Liczby pierwsze.");
				Console.WriteLine("3.Liczby losowe");
				Console.WriteLine("4.Losowe napisy o dlugosciach kolejnych liczb pierwszych");
				Console.WriteLine ("5.Zakoncz");
				Console.Write ("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch (wybor)
				{
				case 1:
					{
						liczby.menu();
						break;
					}
				case 2:
					{
						pierwsze.menu();
						break;
					}
				case 3:
					{
						losowe.menu();
						break;
					}
				case 4:
					{
						napisy.menu();
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
