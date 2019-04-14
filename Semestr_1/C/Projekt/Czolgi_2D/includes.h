#ifndef _INCLUDES
#define _INCLUDES
#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <SDL2/SDL_image.h>

#define SZEROKOSC_EKRANU 920
#define WYSOKOSC_EKRANU 720
#define BOK_POLA 60

typedef struct SDL
{
    SDL_Window *window;
    SDL_Renderer *renderer;
}SDL;

typedef struct Tekstura
{
    SDL_Texture *tex;
    int wys, szer;
    int x,y;
}Tekstura;

typedef struct Wybuch
{
    Tekstura teks;
    bool boom;
    unsigned klatki;
}Wybuch;


enum Kierunek
{
    W_GORE, W_DOL, W_LEWO, W_PRAWO
};


typedef struct Czolg
{
    int id;
    int hp;
    bool ruch;
    enum Kierunek kier;
    unsigned obrot_gasienic;
    Tekstura teks;
    bool strzal;
    enum Kierunek kier_pocisku;
    Tekstura pocisk;
}Czolg;

enum Blok
{
    NIC, SCIANA, CEGLY
};

typedef struct Pole
{
    enum Blok rodzaj;
    int wytrzymalosc;
}Pole;

SDL init(SDL s_sdl);

void zamknij(SDL_Window *okno, SDL_Renderer *gRenderer);

#endif // includes
