#include "funkcje.h"


int main()
{
    initscr();
    raw();
    keypad(stdscr, TRUE);

    stworz_plansze();

    int gnicie;

    int szybkosc = menu_startowe();
    noecho();

    if (szybkosc==500)
    {
        gnicie = 60;
    }
    else if (szybkosc==200)
    {
        gnicie = 50;
    }
    else if (szybkosc==100)
    {
        gnicie = 40;
    }
    else
    {
        gnicie = 30;
    }

    Segment *glowa;
    Segment *ogon;

    glowa = stworz_weza();
    ogon=glowa;

    for (int i=0; i<9; i++)
    {
        glowa = dodaj_segment(glowa,prawo);
        plansza[glowa->y][glowa->x]='O';
    }

    while (ogon->next!=NULL)
    {
        ogon=ogon->next;
    }

    enum Kierunek ruch = prawo;
    int wynik=0;
    Jedzenie jedz;

    rysuj_plansze(wynik);

    bool kol = false;
    bool jedzenie_na_planszy = false;
    int zjedzonych=0;
    bool jajko=false;


    while (kol==false)
    {
        if (zjedzonych==5)
        {
            jajko=true;
            zjedzonych=0;
        }
        ruch = skret(ruch, szybkosc);
        if (jedzenie_na_planszy==false)
        {
            jedz=wrzuc_jedzenie(glowa);
            jedzenie_na_planszy=true;
        }

        glowa=dodaj_segment(glowa, ruch);
        kol = kolizja(glowa);
        if (obiad(glowa)==false)
        {
            ogon=usun_segment(ogon,jajko);
            if (jajko==true)
            {
                wynik+=300;
            }
            jajko=false;
        }
        else
        {
            jedzenie_na_planszy=false;
            zjedzonych++;
            wynik+=100;
        }
        jedz.czas++;

        if (jedz.czas>=gnicie)
        {
            plansza[jedz.y_j][jedz.x_j]=' ';
            jedzenie_na_planszy=0;
        }

        wynik++;
        clear();
        plansza[glowa->y][glowa->x]='O';
        rysuj_plansze(wynik);
    }
    clear();
    printw("Koniec gry\nTwoj wynik: %d\nWcisnij dowolny klawisz aby zakonczyc\n", wynik);
    refresh();
    sleep(1);
    getchar();
    endwin();
    return 0;
}

