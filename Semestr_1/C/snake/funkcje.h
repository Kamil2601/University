#include <ncurses.h>
#include <stdbool.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>

#define wys 20
#define szer 40

typedef struct Segment
{
    int x,y;
    struct Segment *next, *prev;
} Segment;

typedef struct Jedzenie
{
    int x_j, y_j;
    int czas;
} Jedzenie;

enum Kierunek {gora, dol, lewo, prawo};

char plansza[wys][szer];

Segment* stworz_weza();
Segment * dodaj_segment(Segment *gl, enum Kierunek kier);
Segment *usun_segment(Segment *og, bool j);
bool kolizja(Segment *g);
bool obiad(Segment *g);
Jedzenie wrzuc_jedzenie(Segment *g);
void stworz_plansze();
void rysuj_plansze(int w);
enum Kierunek skret(enum Kierunek r, int s);
int menu_startowe();
