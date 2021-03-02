#include "funkcje.h"

int main()
{
    int wys_planszy=480, szer_planszy=640;
    int v_x=3, v_y=3;
    int v_gracza=3;
    int v_komputera=5;
    int pkt_gracza=0, pkt_komputera=0;
    bool serw=0;

    //The images
    SDL_Surface* hello = NULL;
    SDL_Surface* screen = NULL;
    SDL_Surface *wynik_gracza = NULL;
    SDL_Surface *wynik_komputera = NULL;
    //Start SDL
    SDL_Init( SDL_INIT_EVERYTHING );

     //Load image
    hello = SDL_LoadBMP( "plik.bmp" );

    SDL_Rect gracz = {.x = 0, .y = 180, .w = 25, .h = 150};
    SDL_Rect komputer = {.x = 615, .y = 180, .w = 25, .h = 150};
    SDL_Rect pilka = {.x = 35, .y=230, .w = 20, .h=20};

    SDL_Event event;

    SDL_BlitSurface( hello, NULL, screen, NULL );
    SDL_FillRect(screen, &gracz, -1);

    Uint8 *keystates = SDL_GetKeyState( NULL );

     //Keep track of the current frame
    int frame = 0;
    //The frame rate regulator
    Timer fps = {.startTicks = 0,.started = false};

    bool quit=false;

    while (quit==false)
    {



    }



 return 0;
}
