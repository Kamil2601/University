Kod z zadania nie spełnia zasady LSP. Nie możemy zastąpić klasy obiektu klasy Rectangle obiektem klasy Square.

int w = 4, h = 5;
Rectangle rect = new Square() { Width = w, Height = h };

Jest równoważne
Rectangle rect = new Square();
rect.Width = 4; rect.Height = 4
rect.Height = 5; rect.Width = 5  (ewenetualnie kolejność w wierszu na odwrót)

Na wyjściu dostajemy komunikat "prostokąt o wymiarach 4 na 5 ma pole 25"