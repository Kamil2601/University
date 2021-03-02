#include "includes.h"
#include "tekstury.h"
#include "funkcje.h"
#include "poziom_1.h"
#include "poziom_2.h"
#include "poziom_3.h"
#include "menu.h"

int main()
{

    SDL inicjacja = {.window=NULL, .renderer=NULL};
    bool dalej;
    inicjacja=init(inicjacja);

    SDL_Rect zielony_czolg[8];
    SDL_Rect sprite_pocisku = {.x=452, .y=200, .w=20, .h=20};

    zapisz_czolg(zielony_czolg,8, 0, 588, -84, 84);

    SDL_Rect czarny_czolg[8];
    zapisz_czolg(czarny_czolg,8, 84 , 588, -84, 84);

    SDL_Rect sprite_wybuchu[3];
    zapisz_wybuch(sprite_wybuchu);

    bool koniec = true;

    while (koniec)
    {

        dalej = menu(inicjacja.renderer);
        koniec = dalej;

        if (dalej)
        dalej = poziom_1(inicjacja.renderer, zielony_czolg, sprite_pocisku, czarny_czolg, sprite_wybuchu);


        if(dalej)
        dalej = poziom_2(inicjacja.renderer, zielony_czolg, sprite_pocisku, czarny_czolg, sprite_wybuchu);

        if (dalej)
        dalej = poziom_3(inicjacja.renderer, zielony_czolg, sprite_pocisku, czarny_czolg, sprite_wybuchu);


    }

    zamknij(inicjacja.window, inicjacja.renderer);

    return 0;
}
