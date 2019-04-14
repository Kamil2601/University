using System;

namespace Zad2
{
	public class Dict<K, V>
	{
		K[] key;
		V[] val;
		int size;
		int capacity;

		public Dict()
		{
			size = 0;
			capacity = 10;
			key = new K[capacity];
			val = new V[capacity];

		}

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

		public V search(K k)
		{
			for (int i=0; i<size; i++)
			{
				if(key[i].Equals(k))
				{
					return val[i];
				}
			}

			return val[0];
			//throw new System.Exception ("XD");
		}

		public void addto(K obj_key, V obj_val)
		{
			if (size == capacity)
			{
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

		public void delfrom(K k)
		{
			for (int i=0; i<size; i++)
			{
				if(key[i].Equals(k))
				{
					for (int j = i; j<size-1; j++)
					{
						key[j] = key[j+1];
						val[j] = val[j+1];
					}
					size--;
					break;
				}
			}

		}
	}
}

