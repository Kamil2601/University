// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z3, Grafy
// Grafy
// Kolejka.cs
// 2018-03-23

using System;

namespace Zad3
{
	//Implementacja kolejki wykorzystywana w algorytmie BFS
	public class Kolejka <T>
	{
		//Zagnieżdżona klasa elementu kolejki
		public class Element<P>
		{
			//referencja na poprzedni element
			public Element <P> next;
			//wartość elementu
			public P val;
			//konstruktor elementu
			public Element()
			{
				this.next = null;
			}
		}

		//referencja na początek kolejki
		public Element <T> head;

		//konstruktor kolejki
		public Kolejka()
		{
			this.head = null;
		}
			

		//dodanie elementu na koniec kolejki
		public void push(T obj)
		{
			if (this.head == null)
			{
				this.head = new Element<T>();
				this.head.val = obj;
			}
			else
			{
				Element <T> pom = head;
				while (pom.next!=null)
				{
					pom = pom.next;
				}
				pom.next = new Element<T>();
				pom.next.val = obj;
			}
		}


		//usunięcie elementu z kolejki
		public T pop()
		{
			if (this.head == null)
			{
				return default(T);
			}
			else
			{
				T obj = this.head.val;
				this.head = this.head.next;
				return obj;
			}
		}


		//sprawdzenie czy kolejka jest pusta
		public bool pusta()
		{
			if (head==null)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}