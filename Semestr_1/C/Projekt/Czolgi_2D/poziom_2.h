#ifndef _POZIOM_2
#define _POZIOM_2

#include "includes.h"
#include "funkcje.h"
#include "timer.h"
#include "tekstury.h"
#include "si.h"

bool poziom_2(SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect wybuch[]);

Czolg p2_ruch_1(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_2(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_3(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_4(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_5(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_6(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p2_ruch_7(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

#endif
