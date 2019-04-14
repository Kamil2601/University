#include "SDL/SDL.h"
#include <stdbool.h>

const int FRAMES_PER_SECOND=60;

typedef struct Timer
{
    //The clock time when the timer started
    int startTicks;

    //The ticks stored when the timer was paused

    //The timer status
    bool started;
}Timer;

Timer start(Timer t);

Timer stop(Timer t);

int get_ticks(Timer t);

bool odbicie_g(SDL_Rect g, SDL_Rect p, int v);

bool odbicie_k(SDL_Rect g, SDL_Rect p, int v);

int ktory_segment(SDL_Rect paletka,SDL_Rect pilka, int v);


