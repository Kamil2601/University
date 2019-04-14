// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L4, z3, Grafy
// Grafy
// Interfejs.cs
// 2018-03-23

using System;

namespace Zad3
{
	//Interfejs do obługi grafów
	public interface Graf
	{
		//Dodanie wierzchołka o podanej etykiecie
		void dodaj_w(string e);
		//Dodanie krawędzi między wierzchołkami o podanych numerach
		void dodaj_k(int i, int j);
		//Dodanie krawędzi między wierzchołkami o podanych etykietach
		void dodaj_k(string e1, string e2);
		//Usunięcie krawędzi między wierzchołkami o podanych numerach
		void usun_k(int i, int j);
		//Usunięcie krawędzi między wierzchołkami o podanych etykietach
		void usun_k(string e1, string e2);
		//wypisanie grafu
		void wypisz();
		//zmiana etykiety wierzcholka o podanym numerze
		void zmien_nazwe(int i, string e);
		//Obliczenie odległości (najkrótszej ścieżki) między wierzchołkami grafu o podanych etykietach
		int BFS(string e1, string e2);
	}
}

