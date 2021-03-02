Projekt łamie zasadę SRP, ponieważ klasa ReportPrinter robi 2 różne rzeczy - formatuje dokument i drukuje raport

Ile klas docelowo powstanie z takiej jednej klasy? Dlaczego akurat tyle?
W moim rozwiązaniu 3, chociaż klasa Data służy tylko do wywołania formatowania i drukowania, więc 2 klasy - Formatter i Printer - zastępują klasę ReportPrinter. Każda z tych klas wykonuje jedno zadanie (formatowanie lub drukowanie), więc rozwiązanie jest zgodne z SRP.

Czy refaktoryzacja klasy naruszającej SRP oznacza automatycznie, że każda metoda powinna trafić do
osobnej klasy?
Nie.
Przykład:
Mamy kilka metod do formatowania dokumentu na różne sposoby. Umieszczenie ich w jednej klasie jest lepszym rozwiązaniem niż rozbicie ich na kilka klas. Taka klasa wciąż będzie robić tylko jedną rzecz - formatować dokument.
