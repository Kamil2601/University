#include "poziom_1.h"

bool poziom_1 (SDL_Renderer *gRenderer, SDL_Rect zielony_czolg[], SDL_Rect sprite_pocisku, SDL_Rect czarny_czolg[], SDL_Rect sprite_wybuchu[])
{
  Tekstura tlo = {.x = 0, .y = 0, .szer = SZEROKOSC_EKRANU, .wys = WYSOKOSC_EKRANU};
  Tekstura info = {.x = 12*BOK_POLA, .y=0, .szer=200, .wys=WYSOKOSC_EKRANU};
  Tekstura serce = {.y=3*BOK_POLA, .szer = 50, .wys = 50};
  Tekstura tytul = {.x=12*BOK_POLA, .y=BOK_POLA, .szer=200, .wys=100};
  Czolg *czolgi;

  Wybuch wybuch = {.boom=false, .klatki=0, .teks.szer=BOK_POLA, .teks.wys=BOK_POLA};
  wybuch.teks = zaladuj_teksture(wybuch.teks, "tekstury/tanks.png", gRenderer);
  Wybuch *wyb = &wybuch;
  render(wybuch.teks, &sprite_wybuchu[0], gRenderer);

  tlo = zaladuj_teksture ( tlo, "tekstury/tlo.jpg", gRenderer );
  info = zaladuj_teksture(info, "tekstury/info.png", gRenderer);
  serce = zaladuj_teksture(serce, "tekstury/serce.png", gRenderer);
  tytul = zaladuj_teksture(tytul, "tekstury/poziom_1.png", gRenderer);

  FILE *plik;
  plik=fopen( "pliki_tekstowe/poziom_1_czolgi", "r");
  int n;

  if(fscanf(plik,"%d", &n)==EOF)
  {
    printf("Blad odczytu\n");
    return 0;
  }

  czolgi = malloc(n*sizeof(Czolg));

  wczytaj_czolgi(czolgi,n,plik, gRenderer, zielony_czolg,czarny_czolg,sprite_pocisku);

  fclose(plik);

  Czolg *gracz = &czolgi[0];


  Pole **plansza = malloc ( 12 * sizeof ( Pole* ) );

  for ( int i = 0; i < 12; i++ )
  {
      plansza[i] = malloc ( 12 * sizeof ( Pole* ) );
  }
  Czolg x;
  SDL_Rect *poc = &sprite_pocisku;

  int odliczanie=80;

  zapisz_plansze ( plansza, "pliki_tekstowe/poziom_1" );
  render ( tlo, NULL, gRenderer );
  render_plansza ( plansza, gRenderer );
  //The frames per second timer
  Timer fpsTimer = Inicjuj_timer ( fpsTimer );
  //The frames per second cap timer
  Timer capTimer = Inicjuj_timer ( capTimer );
  //Start counting frames per second
  int countedFrames = 0;
  startuj(plansza, czolgi, n, gRenderer, tlo, info, tytul, serce, zielony_czolg, czarny_czolg);

  fpsTimer = start ( fpsTimer );

  while ( odliczanie>0)
  {
      capTimer = start ( capTimer );
      *gracz = sterowanie ( *gracz, plansza, czolgi, n, gRenderer);
      SDL_SetRenderDrawColor ( gRenderer, 0xFF, 0xFF, 0xFF, 0xFF );
      SDL_RenderClear ( gRenderer );
      render ( tlo, NULL, gRenderer );
      render (info, NULL, gRenderer);
      render (tytul, NULL, gRenderer);
      render_serca(serce, gracz->hp, gRenderer);
      render_plansza ( plansza, gRenderer );

      if (czolgi[1].hp>0)
      {
        czolgi[1]=p1_ruch_1(czolgi[1], *gracz, czolgi, plansza, n);
      }
      if (czolgi[2].hp>0)
      {
        czolgi[2]=p1_ruch_2(czolgi[2], *gracz, czolgi, plansza, n);
      }
      if (czolgi[3].hp>0)
      {
        czolgi[3]=p1_ruch_3(czolgi[3], *gracz, czolgi, plansza, n);
      }
      if (czolgi[4].hp>0)
      {
        czolgi[4]=p1_ruch_4(czolgi[4], *gracz, czolgi, plansza, n);
      }

     for (int i=1; i<n; i++)
      {
              x=czolgi[i];
              czolgi[i]=zachowanie (x, poc, plansza, gRenderer, &czarny_czolg[( czolgi[i].obrot_gasienic ) / 10] , czolgi, n, wyb);
      }



      if (koniec(czolgi, n))
      {
        odliczanie--;
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

  for (int i=0; i<n; i++)
  {
    zwolnij_teksture(&czolgi[i].teks);
    zwolnij_teksture(&czolgi[i].pocisk);
  }
  zwolnij_teksture(&tlo);
  zwolnij_teksture(&tytul);
  zwolnij_teksture(&serce);

  free(plansza);

  if (gracz->hp==0)
  {
    free (czolgi);
    return 0;
  }

  free (czolgi);
  return 1;


}

Czolg p1_ruch_1(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n)
{
   if (tank.ruch==false)
   {
     tank.ruch=true;
     tank.kier=W_DOL;
   }
   else if (tank.teks.x == BOK_POLA && tank.teks.y == BOK_POLA)
   {
     if (tank.kier == W_LEWO)
     {
       tank.kier=W_DOL;
     }
     else
     {
       tank.kier=W_PRAWO;
     }
   }

   tank = ruch_komputera(tank, plansza, czolgi, n, gracz);

   tank = obrot(tank, gracz, plansza);

   return tank;
}

Czolg p1_ruch_2(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n)
{
  if (tank.ruch==false)
  {
    tank.ruch=true;
    tank.kier=W_DOL;
  }

  else if (tank.teks.y==10*BOK_POLA && tank.kier == W_DOL)
  {
    tank.kier=W_PRAWO;
  }
  else if (tank.teks.x==6*BOK_POLA && tank.kier == W_LEWO)
  {
    tank.kier=W_GORE;
  }
  else if (tank.teks.y==7*BOK_POLA && tank.kier == W_GORE)
  {
    tank.kier=W_LEWO;
  }
  else if (tank.teks.x==3*BOK_POLA && tank.kier == W_LEWO)
  {
    tank.kier=W_GORE;
  }

  tank = ruch_komputera(tank, plansza, czolgi, n, gracz);

  return tank;
}

Czolg p1_ruch_3(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n)
{
    if (tank.ruch==false)
    {
      tank.ruch=true;
      tank.kier=W_GORE;
    }
    else if (tank.teks.y == 4*BOK_POLA)
    {
      if (tank.teks.x == 10*BOK_POLA)
      {
        tank.kier=W_LEWO;
      }
      else if (tank.teks.x == 8*BOK_POLA)
      {
        tank.kier=W_DOL;
      }
    }
    else if (tank.teks.y == 8*BOK_POLA)
    {
      if (tank.teks.x == 10*BOK_POLA)
      {
        tank.kier=W_GORE;
      }
      else if (tank.teks.x == 8*BOK_POLA)
      {
        tank.kier=W_PRAWO;
      }
    }

    tank = ruch_komputera(tank, plansza, czolgi, n, gracz);

    return tank;
}

Czolg p1_ruch_4(Czolg tank, Czolg gracz, Czolg *czolgi, Pole **plansza, int n)
{
  if (tank.ruch==false)
  {
    tank.ruch=true;
    tank.kier=W_DOL;
  }

  if (tank.teks.y == 10*BOK_POLA)
  {
    if (tank.kier==W_DOL)
    {
      tank.kier=W_PRAWO;
    }
    else if (tank.kier==W_LEWO)
    {
      tank.kier=W_GORE;
    }
  }

  tank = ruch_komputera(tank, plansza, czolgi, n, gracz);

  return tank;
}
