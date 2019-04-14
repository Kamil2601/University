// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L3, z2>, Słownik
// Slownik
// Slownik.cs
// 2018-03-15


using System;

namespace Zad2a
{
	//Klasa slownika
	public class Dict<K, V>
	{
		K[] key; //tablica kluczy
		V[] val; //tablica wartosci
		int size;//liczba elementow w tablicy
		int capacity; //pojemnosc tablicy

		public Dict() // konstruktor
		{
			size = 0;
			capacity = 10;
			key = new K[capacity];
			val = new V[capacity];

		}

		// funkcja zwraca prawde jesli obiekt o podanym kluczu jest w slowniku
		public bool search_b(K k)
		{
			for (int i=0; i<size; i++)
			{
				if(key[i].Equals(k))
				{
					return true;
				}
			}

			return false;
		}

		//funkcja wyszukuje obiekt o podanym kluczu
		public V search(K k)
		{
			for (int i=0; i<size; i++)
			{
				if(key[i].Equals(k))
				{
					return val[i];
				}
			}
				
			throw new System.Exception ("Object not found");
		}

		//funkcja dodaje obiekt do tablicy
		public void addto(K obj_key, V obj_val)
		{
			if (search_b(obj_key))
			{
				for (int i=0; i<size; i++)
				{
					if(key[i].Equals(obj_key))
					{
						val[i] = obj_val;
					}
				}
			}
			else
			{
				if (size == capacity)
				{
					//powiekszanie tablicy jesli jest pelna
					capacity += 10;
					V[] arr = new V[capacity];
					K[] arr_k = new K[capacity];
					for (int i=0; i<size; i++)
					{
						arr[i] = val[i];
						arr_k[i] = key[i];
					}

					key = new K[capacity];
					val = new V[capacity];

					for (int i=0; i<size; i++)
					{
						val[i] = arr[i];
						key[i] = arr_k[i];
					}
				}
				key[size] = obj_key;
				val[size] = obj_val;
				size++;
			}
		}

		//funkcja usuwa obiekt o podanym kluczu
		public void delfrom(K k)
		{
			for (int i=0; i<size; i++)
			{
				if(key[i].Equals(k))
				{
					for (int j = i; j<size-1; j++)
					{
						//przesuniecie elementow od indeksu usunietego elementu
						key[j] = key[j+1];
						val[j] = val[j+1];
					}
					size--;
					break;
				}
			}
		}
		public void write()
		{
			for (int i=0; i<size; i++)
			{
				Console.WriteLine("[{0};{1}]", key[i], val[i]);
			}
		}
	}
}

