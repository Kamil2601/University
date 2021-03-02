#include "SDL/SDL.h"
#include <stdbool.h>
#include <time.h>

const int FRAMES_PER_SECOND=60;

SDL_Surface* screen = NULL;

typedef struct Timer
{
    //The clock time when the timer started
    int startTicks;

    //The ticks stored when the timer was paused
    int pausedTicks;

    //The timer status
    bool paused;
    bool started;
} Timer;

Timer start(Timer t)
{
    //Start the timer
    t.started = true;

    //Unpause the timer
    t.paused = false;

    //Get the current clock time
    t.startTicks = SDL_GetTicks();

    return t;
}

Timer stop(Timer t)
{
    //Stop the timer
    t.started = false;

    //Unpause the timer
    t.paused = false;

    return t;
}


int get_ticks(Timer t)
{
    //If the timer is running
    if( t.started == true )
    {
        //If the timer is paused
        if( t.paused == true )
        {
            //Return the number of ticks when the timer was paused
            return t.pausedTicks;
        }
        else
        {
            //Return the current time minus the start time
            return SDL_GetTicks() - t.startTicks;
        }
    }

    //If the timer isn't running
    return 0;
}

bool is_started(Timer t)
{
    return t.started;
}

bool is_paused(Timer t)
{
    return t.paused;
}

bool odbicie_g(SDL_Rect g, SDL_Rect p, int v)
{
    if (p.x>(g.x+g.w) || v>=0)
    {
        return false;
    }
    if (p.y<=(g.y+g.h) && (p.y+p.h)>=g.y)
    {
        return true;
    }
    else
    {
        return false;
    }
}
bool odbicie_k(SDL_Rect g, SDL_Rect p, int v)
{
    if ((p.x+p.w)<g.x || v<=0)
    {
        return false;
    }
    if (p.y<=(g.y+g.h) && (p.y+p.h)>=g.y)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int ktory_segment(SDL_Rect paletka,SDL_Rect pilka, int v, int x)
{
    if ((pilka.x+pilka.h/2)<(paletka.x+paletka.h*0.2))
    {
        v-=x*4;
    }
    else if ((pilka.x+pilka.h/2)>=(paletka.x+paletka.h*0.2) && (pilka.x+pilka.h/2)<(paletka.x+paletka.h*0.4))
    {
        v-=x*2;
    }
    else if ((pilka.x+pilka.h/2)>=(paletka.x+paletka.h*0.4) && (pilka.x+pilka.h/2)<(paletka.x+paletka.h*0.6))
    {
        v=v;
    }
    else if ((pilka.x+pilka.h/2)>=(paletka.x+paletka.h*0.6) && (pilka.x+pilka.h/2)<(paletka.x+paletka.h*0.8))
    {
        v+=x*2;
    }
    else
    {
        v+=x*4;
    }

    return v;
}

void wyswietl_wynik(int pkt_g, int pkt_k)
{
    int jednosci=pkt_g%10;
    int dziesiatki=pkt_g/10;

    int d_x=200;
    int d_y=10;
    for (int i=0; i<2; i++)
    {
        switch (dziesiatki)
        {
        case 0:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=40};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=40};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            break;
        }
        case 1:
        {
            SDL_Rect pion1 = {.x=d_x+20, .y=d_y, .w=5, .h=45};
            SDL_FillRect(screen, &pion1, -1);
            break;
        }
        case 2:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y+20, .w=5, .h=23};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=20};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        }

        d_x+=50;

        switch (jednosci)
        {
        case 0:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=40};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=40};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            break;
        }
        case 1:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=40};
            SDL_FillRect(screen, &pion1, -1);
            break;
        }
        case 2:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y+20, .w=5, .h=23};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=20};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        case 3:
        {
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=40};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        case 4:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=23};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=45};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom2, -1);
            break;
        }
        case 5:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=23};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y+20, .w=5, .h=20};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        case 6:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=40};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y+20, .w=5, .h=20};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        case 7:
        {
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=45};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
        }
        case 8:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=40};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=40};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }
        case 9:
        {
            SDL_Rect pion1 = {.x=d_x, .y=d_y, .w=5, .h=20};
            SDL_Rect pion2 = {.x=d_x+25, .y=d_y, .w=5, .h=40};
            SDL_Rect poziom1 = {.x=d_x, .y=d_y, .w=30, .h=5};
            SDL_Rect poziom2 = {.x=d_x, .y=d_y+40, .w=30, .h=5};
            SDL_Rect poziom3 = {.x=d_x, .y=d_y+20, .w=30, .h=5};
            SDL_FillRect(screen, &pion1, -1);
            SDL_FillRect(screen, &pion2, -1);
            SDL_FillRect(screen, &poziom1, -1);
            SDL_FillRect(screen, &poziom2, -1);
            SDL_FillRect(screen, &poziom3, -1);
            break;
        }

        }

        dziesiatki=pkt_k/10;
        jednosci=pkt_k%10;
        d_x=400;
    }
}


bool kierunek()
{
    int zarodek;
    time_t tt;
    zarodek = time(&tt);
    srand(zarodek);
    bool wynik = rand()%2;

    return wynik;

}

int main()
{
    int wys_planszy=480, szer_planszy=640;
    int wys_paletki=150, szer_paletki=25;
    int v_x=3, v_y=3;
    int v_gracza=3;
    int v_komputera=5;
    int skret_pilki=1;
    int pkt_gracza=0, pkt_komputera=0;
    bool serw=0;

    //The images
    SDL_Surface* hello = NULL;
    //Start SDL
    SDL_Init( SDL_INIT_EVERYTHING );

    //Set up screen
    screen = SDL_SetVideoMode( szer_planszy, wys_planszy, 32, SDL_SWSURFACE );
    //Load image
    hello = SDL_LoadBMP( "plik.bmp" );

    SDL_Rect gracz = {.x = 0, .y = 180, .w = szer_paletki, .h = wys_paletki};
    SDL_Rect komputer = {.x = 615, .y = 180, .w = szer_paletki, .h = wys_paletki};
    SDL_Rect pilka = {.x = 35, .y=230, .w = 20, .h=20};

    SDL_Event event;

    SDL_BlitSurface( hello, NULL, screen, NULL );
    SDL_FillRect(screen, &gracz, -1);

    Uint8 *keystates = SDL_GetKeyState( NULL );

    //Keep track of the current frame
    int frame = 0;
    //The frame rate regulator
    Timer fps = {.startTicks = 0, .pausedTicks = 0, .paused = false, .started = false};

    bool quit=false;

    //Apply image to screen
    while (quit==false)
    {

        if (serw==1)
        {
            SDL_Delay(1000);
            while (!SDL_PollEvent(&event));
            serw=0;
        }
        start(fps);
        if (SDL_PollEvent(&event))
        {
            if( event.type == SDL_KEYDOWN )
            {
                switch( event.key.keysym.sym )
                {
                /*case SDLK_UP:
                {
                    gracz.y--;
                    break;
                }
                case SDLK_DOWN:
                {
                    gracz.y++;
                    break;
                }*/
                case SDLK_ESCAPE:
                {
                    quit = true;
                    break;
                }
                default:
                {
                    break;
                }
                }
            }
        }
        if( event.type == SDL_QUIT )
        {
            //Quit the program
            quit = true;
        }

        if( keystates[ SDLK_UP ] && gracz.y>1)
        {
            gracz.y-=v_gracza;
        }
        else if (keystates[SDLK_DOWN] && (gracz.y+gracz.h)<wys_planszy)
        {
            gracz.y+=v_gracza;
        }

        if ((pilka.y+pilka.h/2)<(komputer.y+komputer.h/2-10) && komputer.y>0)
        {
            komputer.y-=v_komputera;
        }
        else if ((pilka.y+pilka.h/2)>(komputer.y+komputer.h/2+10) && (komputer.y+komputer.h)<wys_planszy)
        {
            komputer.y+=v_komputera;
        }



        pilka.x+=v_x;
        pilka.y+=v_y;

        if (pilka.y<=0 || pilka.y+pilka.h>=wys_planszy)
        {
            v_y*=-1;
        }


        if (odbicie_g(gracz,pilka, v_x))
        {
            v_x*=-1;
            v_y=ktory_segment(gracz, pilka, v_y, skret_pilki);
            v_x++;
            skret_pilki=v_x/3;
            v_gracza++;
            v_komputera++;
        }
        else if (odbicie_k(komputer, pilka, v_x))
        {
            v_x*=-1;
            v_y=ktory_segment(komputer, pilka, v_y, skret_pilki);
            v_x--;
            skret_pilki=v_x/3;
            v_gracza++;
            v_komputera++;
        }


        pilka.w=20;//zapobiega "ucinaniu" pilki
        pilka.h=20;

        gracz.h=150;
        komputer.h=150;

        if (pilka.x<=0)
        {
            pkt_komputera++;
            serw=1;
            gracz.y=180;
            komputer.y=180;
            pilka.y=230;
            pilka.x=25;
            v_x=2;
            if (kierunek())
            {
                v_y=-2;
            }
            else
            {
                v_y=2;
            }
            v_gracza=3;
            v_komputera=4;
        }
        else if ((pilka.x+pilka.w)>=szer_planszy)
        {
            pkt_gracza++;
            serw=1;
            gracz.y=180;
            komputer.y=180;
            pilka.y=230;
            pilka.x=szer_planszy-(komputer.w+pilka.w-5);

            v_x=-2;
            if (kierunek())
            {
                v_y=-2;
            }
            else
            {
                v_y=2;
            }
            v_gracza=3;
            v_komputera=5;

        }

       // SDL_FreeSurface(screen);
        SDL_BlitSurface( hello, NULL, screen, NULL );
        SDL_FillRect(screen, &gracz, -1);
        SDL_FillRect(screen, &komputer, -1);
        wyswietl_wynik(pkt_gracza, pkt_komputera);
        SDL_FillRect(screen, &pilka, -1);
        //SDL_FreeSurface(hello);
        SDL_Flip( screen );

        if (pkt_gracza==21 || pkt_komputera==21)
        {
            quit=true;
        }

        frame++;

        //If we want to cap the frame rate
        if(get_ticks(fps) < 1000 / FRAMES_PER_SECOND)
        {
            //Sleep the remaining frame time
            SDL_Delay( ( 1000 / FRAMES_PER_SECOND ) - get_ticks(fps) );
        }
    }
    //Update Screen
    //Pause
    SDL_Delay( 1000 );
    //Free the loaded image
    SDL_FreeSurface( hello );
    //Quit SDL
    SDL_Quit();
    return 0;
}
