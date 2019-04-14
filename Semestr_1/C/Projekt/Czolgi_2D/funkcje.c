#include "funkcje.h"

void poziom_probny ( SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect sprite_wybuchu[])
{
    Tekstura tlo = {.x = 0, .y = 0, .szer = SZEROKOSC_EKRANU, .wys = WYSOKOSC_EKRANU};
    Czolg *czolgi;

    Wybuch wybuch = {.boom=false, .klatki=0, .teks.szer=BOK_POLA, .teks.wys=BOK_POLA};
    wybuch.teks = zaladuj_teksture(wybuch.teks, "tekstury/tanks.png", gRenderer);
    Wybuch *wyb = &wybuch;
    render(wybuch.teks, &sprite_wybuchu[0], gRenderer);

    tlo = zaladuj_teksture ( tlo, "tekstury/tlo.jpg", gRenderer );

    FILE *plik;
    plik=fopen( "pliki_tekstowe/poziom_probny_czolgi", "r");
    int n=2;

    if(fscanf(plik,"%d", &n)==EOF)
    {
      printf("Blad odczytu\n");
    }

    czolgi = malloc(n*sizeof(Czolg));


    wczytaj_czolgi(czolgi,n,plik, gRenderer, zielony_czolg,czarny_czolg,sprite_pocisku);

    Czolg *gracz = &czolgi[0];


    Pole **plansza = malloc ( 12 * sizeof ( Pole* ) );

    for ( int i = 0; i < 12; i++ )
    {
        plansza[i] = malloc ( 12 * sizeof ( Pole* ) );
    }

    SDL_Rect *poc = &sprite_pocisku;

    zapisz_plansze ( plansza, "pliki_tekstowe/poziom_probny");
    render ( tlo, NULL, gRenderer );
    render_plansza ( plansza, gRenderer );
    //The frames per second timer
    Timer fpsTimer = Inicjuj_timer ( fpsTimer );
    //The frames per second cap timer
    Timer capTimer = Inicjuj_timer ( capTimer );
    //Start counting frames per second
    int countedFrames = 0;
    fpsTimer = start ( fpsTimer );
    //bool quit = false


    while ( gracz->hp != 0 )
    {
        capTimer = start ( capTimer );
        *gracz = sterowanie ( *gracz, plansza, czolgi, n, gRenderer);
        SDL_SetRenderDrawColor ( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
        SDL_RenderClear ( gRenderer );
        render ( tlo, NULL, gRenderer );
        render_plansza ( plansza, gRenderer );

        for (int i=1; i<n; i++)
        {
            if (czolgi[i].hp>0)
            {
                czolgi[i]=zachowanie ( czolgi[i], poc, plansza, gRenderer, &czarny_czolg[( czolgi[i].obrot_gasienic ) / 10] , czolgi, n, wyb);
            }
        }


        *gracz = zachowanie ( *gracz, poc, plansza, gRenderer, &zielony_czolg[ ( gracz->obrot_gasienic ) / 10] , czolgi, n, wyb);

        float avgFPS = countedFrames / ( getTicks ( fpsTimer ) / 1000.f );

        if ( avgFPS > 2000000 )
        {
            avgFPS = 0;
        }

        if (wyb->boom==true)
        {
            render(wyb->teks, &sprite_wybuchu[wyb->klatki/20] ,gRenderer);
            wyb->klatki++;
        }
        if (wyb->klatki>=60)
        {
            wyb->klatki=0;
            wyb->boom=false;
        }

        //Update screen
        SDL_RenderPresent ( gRenderer );
        ++countedFrames;
        //If frame finished early
        int frameTicks = getTicks ( capTimer );

        if ( frameTicks < SCREEN_TICKS_PER_FRAME )
        {
            //Wait remaining time
            SDL_Delay ( SCREEN_TICKS_PER_FRAME - frameTicks );
        }
    }
}


Czolg sterowanie ( Czolg czolg, Pole **plan, Czolg *czolgi, int n, SDL_Renderer *gRenderer )
{
    SDL_Event e;

    while ( SDL_PollEvent ( &e ) != 0 )
    {
        if ( e.type == SDL_QUIT )
        {
            czolg.hp = 0;
            czolg.teks.x=13*BOK_POLA;
            czolg.teks.y=0;
        }

        else if ( e.type == SDL_KEYDOWN )
        {
            switch ( e.key.keysym.sym )
            {
            case SDLK_UP:
                czolg.kier = W_GORE;
                break;

            case SDLK_DOWN:
                czolg.kier = W_DOL;
                break;

            case SDLK_LEFT:
                czolg.kier = W_LEWO;
                break;

            case SDLK_RIGHT:
                czolg.kier = W_PRAWO;
                break;

            case SDLK_SPACE:
                czolg.strzal = true;
                break;

            case SDLK_ESCAPE:
                pauza(gRenderer);
                break;

            default:
                break;
            }
        }
    }

    Uint8 *keystates = SDL_GetKeyboardState ( NULL );

    if ( keystates[ SDL_SCANCODE_UP ] && !kolizja_gora ( czolg, plan, czolgi, n ) )
    {
        czolg.teks.y--;
        czolg.kier = W_GORE;
        czolg.ruch = true;
    }

    else if ( keystates[SDL_SCANCODE_DOWN] && !kolizja_dol ( czolg, plan, czolgi, n ) )
    {
        czolg.teks.y++;
        czolg.kier = W_DOL;
        czolg.ruch = true;
    }

    else if ( keystates[SDL_SCANCODE_LEFT] && !kolizja_lewo ( czolg, plan, czolgi, n ) )
    {
        czolg.teks.x--;
        czolg.kier = W_LEWO;
        czolg.ruch = true;
    }

    else if ( keystates[SDL_SCANCODE_RIGHT] && !kolizja_prawo ( czolg, plan, czolgi, n ) )
    {
        czolg.teks.x++;
        czolg.kier = W_PRAWO;
        czolg.ruch = true;
    }

    else
    {
        czolg.ruch = false;
    }

    return czolg;
}


Czolg ustaw_pocisk ( Czolg czolg )
{
    czolg.pocisk.szer = 20;
    czolg.pocisk.wys = 20;
    czolg.kier_pocisku = czolg.kier;

    if ( czolg.kier == W_GORE )
    {
        czolg.pocisk.x = czolg.teks.x + czolg.teks.szer / 2 - czolg.pocisk.szer / 2;
        czolg.pocisk.y = czolg.teks.y;
    }

    else if ( czolg.kier == W_DOL )
    {
        czolg.pocisk.x = czolg.teks.x + czolg.teks.szer / 2 - czolg.pocisk.szer / 2;
        czolg.pocisk.y = czolg.teks.y + czolg.teks.wys;
    }

    else if ( czolg.kier == W_LEWO )
    {
        czolg.pocisk.x = czolg.teks.x;
        czolg.pocisk.y = czolg.teks.y + czolg.teks.wys / 2 - czolg.pocisk.wys / 2;
    }

    else if ( czolg.kier == W_PRAWO )
    {
        czolg.pocisk.x = czolg.teks.x + czolg.teks.szer;
        czolg.pocisk.y = czolg.teks.y + czolg.teks.wys / 2 - czolg.pocisk.wys / 2;
    }

    return czolg;
}

Czolg lot ( Czolg czolg, Pole **plan, Czolg *czolgi, int n, SDL_Renderer *gRenderer, SDL_Rect *poc, Wybuch *wyb)
{
    if ( czolg.kier_pocisku == W_GORE )
    {
        czolg.pocisk.y -= 3;
    }

    else if ( czolg.kier_pocisku == W_DOL )
    {
        czolg.pocisk.y += 3;
    }

    else if ( czolg.kier_pocisku == W_LEWO )
    {
        czolg.pocisk.x -= 3;
    }

    else if ( czolg.kier_pocisku == W_PRAWO )
    {
        czolg.pocisk.x += 3;
    }

    if ( pocisk_w_sciane ( czolg.pocisk, plan, czolg.strzal ) )
    {

        czolg = ustaw_pocisk(czolg);
        czolg.strzal = false;
    }
    else if (pocisk_w_czolg(czolg, czolgi, n, wyb))
    {
        czolg.strzal = false;
        czolg=ustaw_pocisk(czolg);
    }
    else
    {
        render(czolg.pocisk, poc, gRenderer);
    }

    return czolg;
}

Czolg zachowanie ( Czolg cz, SDL_Rect *poc, Pole **tab, SDL_Renderer *gRenderer, SDL_Rect *klatka, Czolg *czolgi, int n, Wybuch *wyb )
{
    if (cz.hp>0)
    {
      render_czolg ( cz, gRenderer, klatka );
    }
    if ( cz.strzal == false && cz.hp>0 )
    {
      cz = ustaw_pocisk ( cz );
    }
    else if (cz.strzal == true)
    {
      cz = lot ( cz, tab, czolgi, n, gRenderer, poc, wyb);
    }

    if ( cz.ruch == true )
    {
        cz.obrot_gasienic++;
    }

    if ( cz.obrot_gasienic >= 79 )
    {
        cz.obrot_gasienic = 0;
    }

    return cz;
}

bool koniec(Czolg *czolgi, int n)
{
  if (czolgi[0].hp==0)
  {
    return true;
  }

  for (int i=1; i<n; i++)
  {
    if (czolgi[i].hp>0)
    {
      return false;
    }
  }
  return true;
}

void pauza(SDL_Renderer *gRenderer)
{
  Tekstura napis = {.x = 2.5*BOK_POLA, .y = 2.5*BOK_POLA, .szer = 640, .wys = 400};
  napis = zaladuj_teksture(napis,"tekstury/pauza.png", gRenderer);
  Tekstura tlo = {.x = 0, .y = 0, .wys = WYSOKOSC_EKRANU, .szer = SZEROKOSC_EKRANU};
  tlo = zaladuj_teksture(tlo, "tekstury/tlo.jpg", gRenderer);
  render(tlo, NULL, gRenderer);
  render(napis, NULL, gRenderer);
  SDL_RenderPresent(gRenderer);
  bool quit=false;
  SDL_Event pause;
  while (!quit)
  {
    while ( SDL_PollEvent ( &pause ) != 0 )
    {
        if ( pause.type == SDL_KEYDOWN && pause.key.keysym.sym == SDLK_RETURN)
        {
          quit=true;
        }
    }
  }
}

void startuj(Pole **plansza, Czolg *czolgi, int n, SDL_Renderer *gRenderer, Tekstura tlo, Tekstura info, Tekstura tytul, Tekstura serce, SDL_Rect zielony[], SDL_Rect czarny[])
{
  Tekstura jeden = {.x = 300, .y=200, .wys=300, .szer=200};
  Tekstura dwa = jeden;
  Tekstura trzy = jeden;

  SDL_Rect *clip;

  jeden = zaladuj_teksture(jeden, "tekstury/1.png", gRenderer);
  dwa = zaladuj_teksture(dwa, "tekstury/2.png", gRenderer);
  trzy = zaladuj_teksture(trzy, "tekstury/3.png", gRenderer);

  for (int i=1; i<=3; i++)
  {
    SDL_SetRenderDrawColor ( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
    SDL_RenderClear ( gRenderer );
    render ( tlo, NULL, gRenderer );
    render (info, NULL, gRenderer);
    render (tytul, NULL, gRenderer);
    render_serca(serce, 3, gRenderer);
    render_plansza ( plansza, gRenderer );
    for (int j=0; j<n; j++)
    {
      if (j==0)
      {
        clip = &zielony[0];
      }
      else
      {
        clip = &czarny[0];
      }
      render_czolg(czolgi[j],  gRenderer, clip);
    }

    switch (i) {
      case 1:
        render(jeden,NULL, gRenderer);
        break;
      case 2:
        render(dwa, NULL, gRenderer);
        break;
      case 3:
        render(trzy, NULL, gRenderer);
        break;
    }

    SDL_RenderPresent(gRenderer);

    SDL_Delay(1000);
  }
}
