#ifndef _TEKSTURY
#define _TEKSTURY
#include "includes.h"


void render(Tekstura teks ,SDL_Rect *clip,  SDL_Renderer *gRenderer);

void render_czolg(Czolg czolg,  SDL_Renderer *gRenderer, SDL_Rect *clip);

Tekstura zaladuj_teksture(Tekstura nowa_teks, char* path, SDL_Renderer *gRenderer);

void zwolnij_teksture(Tekstura *teks);

void zapisz_czolg(SDL_Rect sprite[], int klatek, int y, int x, int zmiana, int bok);

void zapisz_wybuch(SDL_Rect sprite[]);

void zapisz_plansze(Pole **tab, char *path);

void render_plansza(Pole **tab, SDL_Renderer *gRenderer);

void render_serca(Tekstura serce, int hp, SDL_Renderer *gRenderer);

void wczytaj_czolgi(Czolg *tab, int n,FILE *plik, SDL_Renderer *gRenderer, SDL_Rect zielony[], SDL_Rect niebieski[], SDL_Rect pocisk);

#endif
