#include "funkcje.h"

Segment* stworz_weza()
{
    Segment *gl =(Segment*) malloc(sizeof(Segment));
    gl->next=NULL;
    gl->prev=NULL;
    gl->x=1;
    gl->y=1;
    return gl;
}

Segment * dodaj_segment(Segment *gl, enum Kierunek kier)
{
    Segment *nowy =(Segment*) malloc(sizeof(Segment));
    switch (kier)
    {
    case gora:
    {
        nowy->x=gl->x;
        nowy->y=(gl->y)-1;
        break;
    }
    case dol:
    {
        nowy->x=gl->x;
        nowy->y=(gl->y)+1;
        break;
    }
    case lewo:
    {
        nowy->x=(gl->x)-1;
        nowy->y=gl->y;
        break;
    }
    case prawo:
    {
        nowy->x=(gl->x)+1;
        nowy->y=gl->y;
        break;
    }
    }
    nowy->next=gl;
    gl->prev=nowy;
    gl=nowy;
    return gl;
}

Segment *usun_segment(Segment *og, bool j)
{
    if (j==false)
    {
        plansza[og->y][og->x]=' ';
    }
    else
    {
        plansza[og->y][og->x]='o';
    }
    og=og->prev;
    free(og->next);
    og->next=NULL;
    return og;
}

bool kolizja(Segment *g)
{
    if (plansza[g->y][g->x]=='#' || plansza[g->y][g->x]=='O' || plansza[g->y][g->x]=='o')
    {
        plansza[0][0]='D';
        return true;
    }
    else
    {
        return false;
    }
}

bool obiad(Segment *g)
{
    if (plansza[g->y][g->x]=='+')
    {

        return true;

    }
    else
    {
        return false;
    }
}

Jedzenie wrzuc_jedzenie(Segment *g)
{

    time_t tt;
    int zarodek = time(&tt);
    srand(zarodek);
    Jedzenie j;
    bool ok=false;

    Segment *wsk;

    while (ok==false)
    {
        j.x_j = rand() % (szer- 3) + 1;
        j.y_j = rand() % (wys - 3) + 1;
        ok = true;
        wsk = g;
        while (wsk!=NULL)
        {
            if (wsk->x==j.x_j && wsk->y==j.y_j)
            {
                ok = false;
            }
            wsk=wsk->next;
        }

    }
    j.czas=0;
    plansza[j.y_j][j.x_j]='+';

    return j;
}

void stworz_plansze()
{
    for (int i=0; i<wys; i++)
    {
        plansza[i][0]='#';
        plansza[i][szer-1]='#';
    }
    for (int i=0; i<szer; i++)
    {
        plansza[0][i]='#';
        plansza[wys-1][i]='#';
    }
    for (int i=1; i<wys-1; i++)
    {
        for (int j=1; j<szer-1; j++)
        {
            plansza[i][j]=' ';
        }
    }
}

void rysuj_plansze(int w)
{
    clear();
    for (int i=0; i<wys; i++)
    {
        for (int j=0; j<szer; j++)
        {
            printw("%c",plansza[i][j]);
        }
        if (i==5)
        {
            printw("         Wynik: %d", w);
        }
        printw("\n");
    }
}

enum Kierunek skret(enum Kierunek r, int s)
{
    timeout(s);
    int ch=getch();
    switch(ch)
    {
    case KEY_LEFT:
    {
        if (r!=prawo)
        {
            r = lewo;
        }
        break;
    }
    case KEY_RIGHT:
    {
        if (r!=lewo)
        {
            r=prawo;
        }
        break;
    }
    case KEY_UP:
    {
        if (r!=dol)
        {
            r = gora;
        }
        break;
    }
    case KEY_DOWN:
    {
        if (r!=gora)
        {
            r = dol;
        }
        break;
    }
    }

    return r;
}

int menu_startowe()
{
    int poziom, predkosc;;
    printw("GRA SNAKE\n");
    printw("Wybierz poziom \n1.Latwy\n2.Sredni\n3.Trudny\n4.Bardzo trudny\nWybor:");
    scanw("%d",&poziom);
    clear();
    switch (poziom)
    {
    case 1:
    {
        predkosc=500;
        printw("Wybrales poziom latwy\n");
        break;
    }
    case 2:
    {
        predkosc=200;
        printw("Wybrales poziom sredni\n");
        break;
    }
    case 3:
    {
        predkosc=100;
        printw("Wybrales poziom trudny\n");
        break;
    }
    case 4:
    {
        predkosc=70;
        printw("Wybrales poziom bardzo trudny\n");
        break;
    }
    default:
    {
        predkosc=500;
        printw("Wybraleś poziom latwy\n");
        break;
    }
    }
    printw("Wcisinij dowolny klawszisz aby rozpoczac\n");
    getch();

    return predkosc;
}
