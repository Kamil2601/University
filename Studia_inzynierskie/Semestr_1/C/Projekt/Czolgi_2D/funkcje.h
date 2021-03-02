#ifndef _FUNKCJE
#define _FUNKCJE

#include "kolizje.h"
#include "timer.h"
#include "includes.h"
#include "tekstury.h"
//#include "poziom_1.h"


#define SCREEN_FPS 60
#define SCREEN_TICKS_PER_FRAME 1000/SCREEN_FPS


void poziom_probny ( SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect wybuch[]);

Czolg sterowanie (Czolg czolg, Pole **plan, Czolg *tab, int n, SDL_Renderer *gRenderer);

Czolg ustaw_pocisk(Czolg czolg);

Czolg lot(Czolg czolg, Pole **plan, Czolg *czolgi, int n,SDL_Renderer *gRenderer, SDL_Rect *poc, Wybuch *wyb);

Czolg zachowanie ( Czolg czolg, SDL_Rect *poc, Pole **tab, SDL_Renderer *gRenderer, SDL_Rect *klatka, Czolg *czolgi, int n, Wybuch *wyb);

Czolg ruch_komputera(Czolg tank, Pole **plansza, Czolg *czolgi, int n, Czolg gracz);

bool koniec(Czolg *czolgi, int n);

void pauza();

void startuj(Pole **plansza, Czolg *czolgi, int n, SDL_Renderer *gRenderer, Tekstura tlo, Tekstura info, Tekstura tytul, Tekstura serce, SDL_Rect zielony[], SDL_Rect czarny[]);


#endif
