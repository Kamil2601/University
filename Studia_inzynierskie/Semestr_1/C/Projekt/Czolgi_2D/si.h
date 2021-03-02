#ifndef _SI
#define _SI

#include "includes.h"
#include "funkcje.h"
#include "kolizje.h"

Czolg ruch_komputera(Czolg tank, Pole **plansza, Czolg *czolgi, int n, Czolg gracz);

Czolg obrot(Czolg tank, Czolg gracz, Pole **plansza);

Czolg obrot2(Czolg tank, Czolg gracz, Pole **plansza);

bool przeszkoda(Czolg tank, Czolg gracz, Pole **plansza);


#endif
