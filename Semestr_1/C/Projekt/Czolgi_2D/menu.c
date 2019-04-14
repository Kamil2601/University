#include "menu.h"

bool menu(SDL_Renderer *gRenderer)
{
    Tekstura tlo = {.x=0, .y=0, .wys=WYSOKOSC_EKRANU, .szer=SZEROKOSC_EKRANU};
    tlo = zaladuj_teksture(tlo,"tekstury/menu.png", gRenderer);
    Tekstura strzalka = {.wys=60, .szer=60};
    strzalka = zaladuj_teksture(strzalka, "tekstury/strzalka.png", gRenderer);


    int wybor = 0;

    while (wybor!=13)
    {
      SDL_SetRenderDrawColor ( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
      SDL_RenderClear ( gRenderer );
      render (tlo, NULL, gRenderer);
      wybor = wybor_opcji(wybor);
      render_strzalka(strzalka, wybor, gRenderer);
      SDL_RenderPresent ( gRenderer );

      if (wybor==10)
      {
        zwolnij_teksture(&tlo);
        zwolnij_teksture(&strzalka);
        return 1;
      }
      else if (wybor==11)
      {
        wybor = wyswietl_instrukcje(gRenderer);
      }
      else if (wybor==13)
      {
        zwolnij_teksture(&tlo);
        zwolnij_teksture(&strzalka);
        return 0;
      }
      else
      {
        wybor%=10;
      }
    }

    return 0;
}

void render_strzalka(Tekstura strzalka,int  wybor,SDL_Renderer *gRenderer)
{
    SDL_Rect renderQuad1 = {.w = strzalka.szer, .h=strzalka.wys};
    SDL_Rect renderQuad2 = {.w = strzalka.szer, .h=strzalka.wys};

    wybor%=10;

    switch (wybor)
    {
      case 0:
      {
          renderQuad1.y = 260;
          renderQuad1.x = 300;
          renderQuad2.y = 260;
          renderQuad2.x = 550;
          break;
      }
      case 1:
      {
          renderQuad1.y = 345;
          renderQuad1.x = 260;
          renderQuad2.y = 345;
          renderQuad2.x = 610;
          break;
      }
      case 2:
      {
          renderQuad1.y = 430;
          renderQuad1.x = 160;
          renderQuad2.y = 430;
          renderQuad2.x = 680;
          break;
      }
      case 3:
      {
          renderQuad1.y = 510;
          renderQuad1.x = 300;
          renderQuad2.y = 510;
          renderQuad2.x = 550;
          break;
      }

    }

    SDL_RenderCopyEx ( gRenderer, strzalka.tex, NULL, &renderQuad1, 0.0, NULL, SDL_FLIP_NONE );
    SDL_RenderCopyEx ( gRenderer, strzalka.tex, NULL, &renderQuad2, 0.0 , NULL, SDL_FLIP_HORIZONTAL );
}

int wybor_opcji(int x)
{
  SDL_Event e;

  while ( SDL_PollEvent ( &e ) != 0 )
  {
      if ( e.type == SDL_QUIT )
      {
          x=13;
      }
      else if ( e.type == SDL_KEYDOWN )
      {
          switch ( e.key.keysym.sym )
          {
          case SDLK_UP:
          {
              if (x>0) x--;
              break;
          }

          case SDLK_DOWN:
          {
              if (x<3) x++;
              break;
          }

          case SDLK_RETURN:
          {
              x+=10;
              break;
          }
          }
      }
  }

  return x;
}

int wyswietl_instrukcje(SDL_Renderer *gRenderer)
{
  Tekstura instrukcja = {.szer = 640, .wys = 400, .x = (SZEROKOSC_EKRANU/2-320), .y = (WYSOKOSC_EKRANU/2-200)};
  instrukcja = zaladuj_teksture(instrukcja, "tekstury/instrukcja.png", gRenderer);
  render(instrukcja, NULL, gRenderer);
  SDL_RenderPresent ( gRenderer );

  bool quit = false;
  SDL_Event egzit;

  while (quit==false)
  {
    while ( SDL_PollEvent ( &egzit ) != 0 )
    {
        if ( egzit.type == SDL_KEYDOWN && egzit.key.keysym.sym == SDLK_RETURN)
        {
          quit=true;
        }
    }
  }

  zwolnij_teksture(&instrukcja);

  return 1;
}
