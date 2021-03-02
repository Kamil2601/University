// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z3, Grafy
// Grafy
// GrafMacierz.cs
// 2018-03-23


using System;

namespace Zad3
{
	//Klasa implementujaca graf jako macierz sąsiedztwa (wszystkie metody opisane w interfejsie!)
	public class GrafMacierz : Graf
	{
		private static readonly Random losuj = new Random();
		int n;
		bool [][] macierz;
		string [] etykiety;

		public GrafMacierz (int w, int k)
		{
			n = w;
			macierz = new bool[n][];
			etykiety = new string[n];
			for (int i=0; i<n; i++)
			{
				macierz[i] = new bool[n];
				etykiety[i] = Convert.ToString(i);
			}
				
			for (int i=0; i<n; i++)
			{
				macierz[i][i] = true;
			}

			if (k>maks_k())
			{
				for (int i=0; i<n; i++)
				{
					for (int j=0; j<n; j++)
					{
						macierz[i][j]=true;
					}
				}
			}
			else
			{
				for (int i=0; i<k; i++)
				{
					int p = losuj.Next(0,n);
					int q = losuj.Next(0,n);
					if (p==q || macierz[p][q]==true)
					{
						i--;
					}
					else
					{
						macierz[p][q]=true;
						macierz[q][p]=true;
					}
				}
			}
			
		}

		public void dodaj_w(string e)
		{
			bool [][]pom = macierz;
			n++;
			macierz = new bool[n][];

			string []pom_e = etykiety;

			etykiety = new string[n];

			for (int i=0; i<n-1; i++)
			{
				etykiety[i] = pom_e[i];
			}
			etykiety[n-1] = e;

			for (int i=0; i<n; i++)
			{
				macierz[i] = new bool[n];
			}



			for (int i=0; i<n; i++)
			{
				for (int j=0; j<n; j++)
				{
					if (i==n-1 || j==n-1)
					{
						macierz[i][j]=false;
					}
					else
					{
						macierz[i][j]=pom[i][j];
					}
				}
			}
		}

		public void dodaj_k(int i, int j)
		{
			macierz[i][j]=true;
			macierz[j][i]=true;
		}

		public void dodaj_k(string e1, string e2)
		{
			int i=-1,j=-1;

			for (int k=0; k<n; k++)
			{
				if (etykiety[k]==e1)
				{
					i=k;
				}
				if (etykiety[k]==e2)
				{
					j=k;
				}
			}

			dodaj_k(i,j);

		}

		public void usun_k(string e1, string e2)
		{
			int i=-1,j=-1;

			for (int k=0; k<n; k++)
			{
				if (etykiety[k]==e1)
				{
					i=k;
				}
				if (etykiety[k]==e2)
				{
					j=k;
				}
			}

			usun_k(i,j);

		}

		public void usun_k(int i, int j)
		{
			macierz[i][j]=false;
			macierz[j][i]=false;
		}

		public void wypisz()
		{
			for (int i=0; i<n; i++)
			{

				for (int j=0; j<n; j++)
				{

					if (macierz[i][j]==true)
					{
						Console.Write("1 ");
					}
					else
					{
						Console.Write("0 ");
					}
				}

				Console.Write("<-- {0}", etykiety[i]);
				Console.WriteLine();
			}
		}

		private int maks_k()
		{
			int wynik =0;
			for (int i=0; i<n; i++)
			{
				for (int j=0; j<i; j++)
				{
					wynik++;
				}
			}
			return wynik;
		}

		public int BFS(string e1, string e2)
		{
			int start = -1, koniec = -1;
			int [] kroki = new int[n];
			int [] p = new int[n]; 
			for (int i=0; i<n; i++)
			{
				kroki[i] = -1;
				if (etykiety[i]==e1)
				{
					start = i;
				}
				if (etykiety[i]==e2)
				{
					koniec = i;
				}
						
			}

			if (start == -1 || koniec == -1)
			{
				return -1;
			}


			Kolejka <int> kolejka = new Kolejka<int>();

			kolejka.push(start);

			int v=0;
			kroki[start] = 0;

			while (kolejka.pusta()==false && v!=koniec)
			{
				v = kolejka.pop();

				for (int i=0; i<n; i++)
				{
					if (macierz[v][i] == true && i!=v && kroki[i]==-1)
					{
						kolejka.push(i);
						kroki[i]=kroki[v]+1;
					}
				}
			}

			return kroki[koniec];
		}

		public void zmien_nazwe(int i, string e)
		{
			if (i<n)
			{
				etykiety[i] = e;
			}
		}
			
	}
}



