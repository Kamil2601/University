#ifndef _POZIOM_1
#define _POZIOM_1

#include "includes.h"
#include "funkcje.h"
#include "timer.h"
#include "tekstury.h"
#include "si.h"

bool poziom_1(SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect wybuch[]);

Czolg p1_ruch_1(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p1_ruch_2(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p1_ruch_3(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p1_ruch_4(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

#endif
