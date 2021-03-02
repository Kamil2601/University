// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z3, Grafy
// Grafy
// Program.cs
// 2018-03-23

using System;


namespace Zad3
{
	class MainClass
	{
		
		public static void Main (string[] args)
		{
			//TESTY
			Console.WriteLine("Graf jako macierz sasiedztwa");
			GrafMacierz g = new GrafMacierz(10, 20);
			g.wypisz();

			Console.WriteLine("Inny graf jako lista sasiedztwa");
			GrafLista x = new GrafLista(10,15);
			x.wypisz();



			x.zmien_nazwe(1,"jeden");
			x.zmien_nazwe(2,"dwa");
			x.zmien_nazwe(3,"trzy");
			Console.WriteLine(x.BFS("0","5"));

			GrafMacierz test1 = new GrafMacierz(10000, 30000);
			GrafLista test2 = new GrafLista(10000, 30000);

			Console.WriteLine("Test algorytmu szukania najkrotszej sciezki w grafach obu typow " +
				"(10000 wierzcholkow, 30000 krawedzi)");

			DateTime startTime = DateTime.Now;

			Console.WriteLine("Dlugosc sciezki w grafie macierzowym: {0}",test1.BFS("1","1000"));

			DateTime stopTime = DateTime.Now;
			TimeSpan roznica = stopTime - startTime;
			Console.WriteLine("Czas w ms:" + roznica.TotalMilliseconds);

			startTime = DateTime.Now;

			Console.WriteLine("Dlugosc sciezki w grafie listowym: {0}",test2.BFS("1","1000"));

			stopTime = DateTime.Now;
			roznica = stopTime - startTime;
			Console.WriteLine("Czas w ms:" + roznica.TotalMilliseconds);
		}
	}
}
