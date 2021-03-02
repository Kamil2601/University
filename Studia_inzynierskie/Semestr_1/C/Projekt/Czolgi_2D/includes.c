#include "includes.h"

SDL init ( SDL s_sdl )
{
    //Initialization flag
    //bool success = true;
    SDL_Window *okno = s_sdl.window;
    SDL_Renderer *gRenderer = s_sdl.renderer;

    //Initialize SDL
    if ( SDL_Init ( SDL_INIT_VIDEO ) < 0 )
    {
        printf ( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
        // success = false;
    }

    else
    {
        //Set texture filtering to linear
        if ( !SDL_SetHint ( SDL_HINT_RENDER_SCALE_QUALITY, "1" ) )
        {
            printf ( "Warning: Linear texture filtering not enabled!" );
        }

        //Create window
        okno = SDL_CreateWindow ( "Projekt", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, SZEROKOSC_EKRANU, WYSOKOSC_EKRANU, SDL_WINDOW_SHOWN );

        if ( okno == NULL )
        {
            printf ( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
            //success = false;
        }

        else
        {
            //Create renderer for window
            gRenderer = SDL_CreateRenderer ( okno, -1, SDL_RENDERER_ACCELERATED );

            if ( gRenderer == NULL )
            {
                printf ( "Renderer could not be created! SDL Error: %s\n", SDL_GetError() );
                //success = false;
            }

            else
            {
                //Initialize renderer color
                SDL_SetRenderDrawColor ( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
                //Initialize PNG loading
                int imgFlags = IMG_INIT_PNG;

                if ( ! ( IMG_Init ( imgFlags ) & imgFlags ) )
                {
                    printf ( "SDL_image could not initialize! SDL_image Error: %s\n", IMG_GetError() );
                    //success = false;
                }
            }
        }
    }

    s_sdl.window =  okno;
    s_sdl.renderer = gRenderer;
    return s_sdl;
}


void zamknij ( SDL_Window *okno, SDL_Renderer *gRenderer )
{
    SDL_DestroyRenderer ( gRenderer );
    SDL_DestroyWindow ( okno );
    okno = NULL;
    gRenderer = NULL;
    IMG_Quit();
    SDL_Quit();
}
