#ifndef _POZIOM_3
#define _POZIOM_3

#include "includes.h"
#include "funkcje.h"
#include "timer.h"
#include "tekstury.h"
#include "si.h"

bool poziom_3(SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect wybuch[]);

Czolg p3_ruch_1(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p3_ruch_2(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

Czolg p3_ruch_3(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n);

#endif
