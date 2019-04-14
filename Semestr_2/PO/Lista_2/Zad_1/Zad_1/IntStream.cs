//Kamil Michalak 299089
//Klasy implementujace strumienie liczb calkowitych - strumien kolejnych liczb naturalnych,
//losowych liczb oraz kolejnych liczb pierwszych
//Klasa RandomWordStream implementuje strumien losowych napisow o dlugosciach rownych kolejnym liczbom calkowitym

using System;

namespace Zad_1
{
	public class IntStream
	{
		protected int liczba=0;

		virtual public int next()
		{
			if (!eos())
			{
				liczba++;
				return (liczba - 1);
			}
			else
			{
				return liczba;
			}
		}

		virtual public bool eos()
		{
			if (liczba == Int32.MaxValue)
			{
				return true;			
			}

			else
			{
				return false;
			}
		}

		virtual public void reset()
		{
			liczba = 0;
		}

		public void menu()
		{
			bool koniec = false;
			int wybor = 0;
			while (koniec==false)
			{
				Console.Clear();
				Console.WriteLine("Wybierz operacje");
				Console.WriteLine("1.next()");
				Console.WriteLine("2.next() * 10");
				Console.WriteLine("3.eos()");
				Console.WriteLine("4.reset()");
				Console.WriteLine("5.powrot");
				Console.Write("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch(wybor)
				{
				case 1:
					{
						Console.Clear();
						Console.WriteLine(next());
						Console.Read();
						break;
					}
				case 2:
					{
						Console.Clear();
						for (int i=0; i<10; i++)
						{
							Console.WriteLine(next());
						}
						Console.Read();
						break;
					}
				case 3:
					{
						Console.WriteLine (eos());
						Console.Read();
						break;
					}
				case 4:
					{
						reset();
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

	public class PrimeStream : IntStream
	{
		new private int liczba = 1;

		protected bool pierwsza()
		{
			for (int i = 2; i <= Math.Sqrt(liczba); i++)
			{
				if (liczba % i == 0)
				{
					return false;
				}
			}
			return true;
		}

		override public int next()
		{
			do
			{
				liczba++;
			} while (!pierwsza () && !eos ());

			return liczba;
		}

		override public void reset()
		{
			liczba = 1;
		}
	}

	public class RandomStream : IntStream
	{
		private static readonly Random losuj = new Random();

		override public int next()
		{

			liczba = losuj.Next (Int32.MaxValue);

			return liczba;
		}

		override public bool eos()
		{
			return false;
		}
	}

	public class RandomWordStream : PrimeStream
	{
		private static readonly Random losuj = new Random();

		private string napis = "";
		private char z;

		new public string next()
		{
			napis = "";
			liczba = base.next ();

			for (int i = 0; i < liczba; i++)
			{
				z = Convert.ToChar(losuj.Next(33,126));
				napis += z;
			}

			return napis;
		}

		new public void menu()
		{
			bool koniec = false;
			int wybor = 0;
			while (koniec==false)
			{
				Console.Clear();
				Console.WriteLine("Wybierz operacje");
				Console.WriteLine("1.next()");
				Console.WriteLine("2.next() * 10");
				Console.WriteLine("3.eos()");
				Console.WriteLine("4.reset()");
				Console.WriteLine("5.powrot");
				Console.Write("Wybor: ");

				wybor = Convert.ToInt32(Console.ReadLine());

				switch(wybor)
				{
				case 1:
					{
						Console.Clear();
						Console.WriteLine(next());
						Console.Read();
						break;
					}
				case 2:
					{
						Console.Clear();
						for (int i=0; i<10; i++)
						{
							Console.WriteLine(next());
						}
						Console.Read();
						break;
					}
				case 3:
					{
						Console.WriteLine (eos());
						Console.Read();
						break;
					}
				case 4:
					{
						reset();
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

