Różnica między RSP i ISP
SRP - każda klasa powinna zajmować się tylko jednym zadaniem
ISP - klient nie powinen być zmuszany do korzystania z metod, których nie potrzebuj

SRP skupia się na sposobie projektowania systemu tak, żeby np był łatwiejszy do modyfikacji lub rozszerzania
ISP skupia się na perspektywie kodu klienckiego, żeby mógł on zawierać tylko to co jest faktycznie potrzebne

Przykład
Załóżmy, że posiadamy klasę stosu implementującą dwie metody: pop oraz push. Klient polegający na interfejsie tego stosu i korzystający tylko z metody push, polega również na metodzie pop, której nie potrzebuje. SRP w tym przypadku nie rozdziela metod pop i push, podczas gdy ISP zachęca do tego podziału.