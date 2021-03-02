// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z3, Grafy
// Grafy
// Graflista.cs
// 2018-03-23


using System;

namespace Zad3
{
	//Klasa implementujaca graf jako listę sąsiedztwa (wszystkie metody opisane w interfejsie!)
	public class GrafLista : Graf
	{
		private static readonly Random losuj = new Random();
		int n;
		string [] etykiety;

		public class Lista
		{
			public int nr;
			public Lista next;
		}

		Lista [] lista;

		public GrafLista (int w, int k)
		{
			n = w;

			etykiety = new string[n];
			lista = new Lista[n];

			for (int i=0; i<n; i++)
			{
				etykiety[i] = Convert.ToString(i);
				lista[i] = new Lista();
				lista[i].nr = i;
			}

			if (k>maks_k())
			{
				for (int i=0; i<n; i++)
				{
					for (int j=0; j<n; j++)
					{
						if (i!=j)
						{
							wstaw(i,j);
						}
					}
				}
			}
			else
			{
				for (int i=0; i<k; i++)
				{
					int p = losuj.Next(0,n);
					int q = losuj.Next(0,n);
					if (p==q)
					{
						i--;
					}
					else
					{
						if (wstaw(p,q)==false)
						{
							i--;
						}
						else
						{
							wstaw(q,p);
						}
					}
				}
			}
		}

		private bool wstaw(int p, int q)
		{
			Lista pom = lista[p];
			while (pom.next!=null)
			{
				if (pom.next.nr==q)
				{
					return false;
				}
				pom = pom.next;

			}
			pom.next = new Lista();
			pom.next.nr = q;
			return true;
		}

		public void wypisz()
		{
			for (int i=0; i<n; i++)
			{
				Console.Write("{0}. {1}: ",i,etykiety[i]);
				Lista pom = lista[i].next;
				while (pom!=null)
				{
					Console.Write("{0} ",pom.nr);
					pom = pom.next;
				}
				Console.WriteLine();
			}
		}

		public void dodaj_w(string e)
		{
			n++;
			Lista []pom = lista;
			lista = new Lista[n];
			string []pom_e = etykiety;
			etykiety = new string[n];
			for (int i=0; i<n-1; i++)
			{
				etykiety[i] = pom_e[i];
				lista[i] = pom[i];
			}
			etykiety[n-1] = e;
			lista[n-1].nr = n-1;
		}

		public void dodaj_k(int i, int j)
		{
			if (i!=j && i>0 && i<n && j>0 && j<n)
			{
				wstaw(i,j);
				wstaw(j,i);
			}
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

			if (i!=j && i>0 && i<n && j>0 && j<n)
			{
				wstaw(i,j);
				wstaw(j,i);
			}
		}

		public void usun_k(int i, int j)
		{
			Lista pom = lista[i];
			while (pom.next.nr!=j && pom.next!=null)
			{
				pom=pom.next;
			}
			if (pom.next!=null)
			{
				pom.next = pom.next.next;
			}

			pom = lista[j];
			while (pom.next.nr!=i && pom.next!=null)
			{
				pom=pom.next;
			}
			if (pom.next!=null)
			{
				pom.next = pom.next.next;
			}
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

			if (i!=j && i>0 && i<n && j>0 && j<n)
			{
				usun_k(i,j);
				usun_k(j,i);
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
				Lista pom = lista[v].next;

				while (pom!=null)
				{
					if (kroki[pom.nr] == -1)
					{
						kolejka.push(pom.nr);
						kroki[pom.nr] = kroki[v]+1;

					}
					pom = pom.next;
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

