#include "tekstury.h"

void render(Tekstura teks, SDL_Rect *clip, SDL_Renderer *gRenderer)
{
    //Set rendering space and render to screen
    SDL_Rect renderQuad = { teks.x, teks.y, teks.szer, teks.wys };

    //Set clip rendering dimensions
    if( clip != NULL )
    {
        renderQuad.w = clip->w;
        renderQuad.h = clip->h;
    }

    //Render to screen

    if (SDL_RenderCopy( gRenderer, teks.tex, clip, &renderQuad )!=0)
    {
      printf("%s\n",SDL_GetError() );
    }
}

void render_czolg (Czolg czolg,  SDL_Renderer *gRenderer, SDL_Rect *clip)
{
    //Set rendering space and render to screen
    SDL_Rect renderQuad = { .x=czolg.teks.x, .y=czolg.teks.y, .w=czolg.teks.szer, .h=czolg.teks.wys };

    if (czolg.teks.tex==NULL)
    {
        printf("NULL\n");
    }

    double kat;

    if ( czolg.kier == W_GORE )
    {
        kat = 0.0;
    }

    else if ( czolg.kier == W_PRAWO )
    {
        kat = 90.0;
    }

    else if ( czolg.kier == W_DOL )
    {
        kat = 180.0;
    }

    else
    {
        kat = 270.0;
    }



    if (SDL_RenderCopyEx ( gRenderer, czolg.teks.tex, clip, &renderQuad, kat, NULL, SDL_FLIP_NONE )!=0)
    {
        printf("%s\n", SDL_GetError());
    }
}


Tekstura zaladuj_teksture ( Tekstura tex, char *path, SDL_Renderer *gRenderer )
{
    //Get rid of preexisting texture
    Tekstura nowa_teks;
    zwolnij_teksture ( &nowa_teks );
    //The final texture
    SDL_Texture* newTexture = NULL;
    //Load image at specified path
    SDL_Surface* loadedSurface = IMG_Load ( path );

    if ( loadedSurface == NULL )
    {
        printf ( "Unable to load image %s! SDL_image Error: %s\n", path, IMG_GetError() );
    }

    else
    {
        //Color key image
        SDL_SetColorKey ( loadedSurface, SDL_TRUE, SDL_MapRGB ( loadedSurface->format, 255, 255, 255 ) );
        //Create texture from surface pixels
        newTexture = SDL_CreateTextureFromSurface ( gRenderer, loadedSurface );

        if ( newTexture == NULL )
        {
            printf ( "Unable to create texture from %s! SDL Error: %s\n", path, SDL_GetError() );
        }

        else
        {
            //Get image dimensions
            nowa_teks.szer = tex.szer;
            nowa_teks.wys = tex.wys;
            nowa_teks.x = tex.x;
            nowa_teks.y = tex.y;
        }

        //Get rid of old loaded surface
        SDL_FreeSurface ( loadedSurface );

    }

    nowa_teks.tex = newTexture;
    return nowa_teks;
}

void zwolnij_teksture ( Tekstura *teks )
{
    //Free texture if it exists
    if ( teks->tex != NULL )
    {
        SDL_DestroyTexture ( teks->tex );
        teks->tex = NULL;
        teks->szer = 0;
        teks->wys = 0;
    }
}

void zapisz_czolg ( SDL_Rect sprite[], int klatek, int y, int x, int zmiana, int bok )
{

    for ( int i = 1; i < klatek; i++ )
    {
        sprite[i].x = x;
        sprite[i].y = y;
        sprite[i].w = bok;
        sprite[i].h = bok;
        x += zmiana;
    }

    sprite[0].x = 0;
    sprite[0].y = 84 + y;
    sprite[0].w = bok;
    sprite[0].h = bok;
}

void zapisz_wybuch(SDL_Rect sprite[])
{
    int k = 84;
    for (int i=0; i<3; i++)
    {
        sprite[i].x=k+k*i;
        sprite[i].y=2*k;
        sprite[i].w=k;
        sprite[i].h=k;
    }
}


void zapisz_plansze (Pole **tab, char *path)
{
    FILE *plik;
    char z;
    plik=fopen(path, "r");

    for (int i=0; i<12; i++)
    {
        for (int j=0; j<12; j++)
        {
            z=fgetc(plik);
            if (z=='X')
            {
                tab[i][j].rodzaj=SCIANA;
                tab[i][j].wytrzymalosc=1;
            }
            else if (z=='C')
            {
                tab[i][j].rodzaj=CEGLY;
                tab[i][j].wytrzymalosc=3;
            }
            else
            {
                tab[i][j].rodzaj=NIC;
                tab[i][j].wytrzymalosc=0;
            }
        }
        fgetc(plik);
    }
}

void render_plansza(Pole **tab, SDL_Renderer *gRenderer)
{
    Tekstura teks;
    for (int i=0; i<12; i++)
    {
        for (int j=0; j<12; j++)
        {
            zwolnij_teksture(&teks);
            if (tab[i][j].rodzaj==SCIANA)
            {
                teks = zaladuj_teksture(teks, "tekstury/sciana.png", gRenderer);
                SDL_Rect renderQuad = {j*BOK_POLA ,i*BOK_POLA, BOK_POLA, BOK_POLA};
                SDL_RenderCopy( gRenderer, teks.tex, NULL, &renderQuad );
            }
            else if (tab[i][j].rodzaj==CEGLY)
            {
                if (tab[i][j].wytrzymalosc==3)
                {
                    teks = zaladuj_teksture(teks, "tekstury/brick1.png", gRenderer);
                    SDL_Rect renderQuad = {j*BOK_POLA ,i*BOK_POLA, BOK_POLA, BOK_POLA};
                    SDL_RenderCopy( gRenderer, teks.tex, NULL, &renderQuad );
                }
                if (tab[i][j].wytrzymalosc==2)
                {
                    teks = zaladuj_teksture(teks, "tekstury/brick2.png", gRenderer);
                    SDL_Rect renderQuad = {j*BOK_POLA ,i*BOK_POLA, BOK_POLA, BOK_POLA};
                    SDL_RenderCopy( gRenderer, teks.tex, NULL, &renderQuad );
                }
                if (tab[i][j].wytrzymalosc==1)
                {
                    teks = zaladuj_teksture(teks, "tekstury/brick3.png", gRenderer);
                    SDL_Rect renderQuad = {j*BOK_POLA ,i*BOK_POLA, BOK_POLA, BOK_POLA};
                    SDL_RenderCopy( gRenderer, teks.tex, NULL, &renderQuad );
                }
            }
        }
    }
}

void render_serca(Tekstura serce, int hp, SDL_Renderer *gRenderer)
{
  if (hp>=1)
  {
      serce.x = 730;
      render(serce, NULL, gRenderer);
  }
  if (hp>=2)
  {
      serce.x = 790;
      render(serce, NULL, gRenderer);
  }
  if (hp>=3)
  {
      serce.x = 850;
      render(serce, NULL, gRenderer);
  }
}

void wczytaj_czolgi(Czolg *tab, int n,FILE *plik, SDL_Renderer *gRenderer, SDL_Rect zielony[], SDL_Rect niebieski[], SDL_Rect pocisk)
{
    int w_x=0, w_y=0;

    for (int i=0; i<n; i++)
    {
        if (fscanf(plik,"%d %d", &w_y, &w_x)==EOF)
        {
          printf("Blad odczytu\n");
        }
        tab[i].teks.x = w_x*BOK_POLA;
        tab[i].teks.y = w_y*BOK_POLA;
        tab[i].teks.szer=BOK_POLA;
        tab[i].teks.wys=BOK_POLA;
        tab[i].obrot_gasienic=0;
        tab[i].ruch=false;
        tab[i].strzal=false;
        tab[i].kier=W_PRAWO;
        tab[i].kier_pocisku=W_PRAWO;
        tab[i].id=i;
        if (i==0)
        {
            tab[i].hp=3;
            tab[i].teks = zaladuj_teksture ( tab[i].teks, "tekstury/tanks.png", gRenderer );
            render_czolg(tab[i], gRenderer, &zielony[0]);
            tab[i].pocisk = zaladuj_teksture ( tab[i].pocisk, "tekstury/tanks.png", gRenderer );
            render(tab[i].pocisk, &pocisk, gRenderer);
        }
        else
        {
            tab[i].hp=1;
            tab[i].teks = zaladuj_teksture ( tab[i].teks, "tekstury/tanks.png", gRenderer );
            render_czolg(tab[i], gRenderer, &niebieski[0]);
            tab[i].pocisk = zaladuj_teksture ( tab[i].pocisk, "tekstury/tanks.png", gRenderer );
            render(tab[i].pocisk, &pocisk, gRenderer);
        }
    }

}
