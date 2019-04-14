// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L3, z1, Lista
// Lista
// Lista.cs
// 2018-03-15


using System;

namespace Zad_1
{
	//klasa listy typu T
	public class Lista<T>
	{
		//zagnie¿d¿ona klasa elementu listy
		public class Element<P>
		{
			//referencje na poprzedni i nastepny element
			public Element <P> next;
			public Element <P> prev;
			//wartoœæ elementu
			public P val;
			//konstruktor elementu
			public Element()
			{
				this.next = null;
				this.prev = null;
			}
		}

		//referencje na pocz¹tek i koniec listy
		public Element <T> tail;
		public Element <T> head;

		//konstruktor listy
		public Lista()
		{
			this.tail = null;
			this.head = null;
		}

		//dodanie elementu na pocz¹tek listy
		public void push_front(T obj)
		{
			if (this.head == null)
			{
				this.head = new Element<T>();
				this.head.val = obj;
				this.tail = this.head;
			}
			else
			{
				this.head.prev = new Element<T>();
				this.head.prev.val = obj;
				this.head.prev.next = this.head;
				this.head = this.head.prev;
				this.head.prev = null;
			}
		}

		//dodanie elementu na koniec listy
		public void push_back(T obj)
		{
			if (this.tail == null)
			{
				this.tail = new Element<T>();
				this.tail.val = obj;
				this.head = this.tail;
			}
			else
			{
				this.tail.next = new Element<T>();
				this.tail.next.val = obj;
				this.tail.next.prev = this.tail;
				this.tail = this.tail.next;
				this.tail.next = null;
			}
		}


		//usuniecie elementu z poczatku listy
		public T pop_front()
		{
			if (this.head == null)
			{
				return default(T);
			}
			else
			{
				T obj = this.head.val;
				this.head = this.head.next;
				if (this.head != null)
					this.head.prev = null;
				return obj;
			}
		}

		//usuniecie elementu z konca listy
		public T pop_back()
		{
			if (this.tail == null)
			{
				return default(T);
			}
			else
			{
				T obj = this.tail.val;
				this.tail = this.tail.prev;
				if (this.tail != null)
					this.tail.next = null;
				return obj;
			}
		}

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

