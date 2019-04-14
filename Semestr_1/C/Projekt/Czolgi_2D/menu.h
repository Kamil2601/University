#ifndef _MENU
#define _MENU

#include "includes.h"
#include "tekstury.h"


bool menu(SDL_Renderer *gRenderer);

void render_strzalka(Tekstura strzalka, int wybor, SDL_Renderer *gRenderer);

int wybor_opcji(int x);

int wyswietl_instrukcje(SDL_Renderer *gRenderer);

#endif
