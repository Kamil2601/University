#include "funkcje.h"

Timer start(Timer t)
{
    //Start the timer
    t.started = true;

    //Get the current clock time
    t.startTicks = SDL_GetTicks();

    return t;
}

Timer stop(Timer t)
{
    //Stop the timer
    t.started = false;

    //Unpause the timer

    return t;
}

bool odbicie_g(SDL_Rect g, SDL_Rect p, int v)
{
    if (p.x>(g.x+g.w) || v>=0)
    {
        return false;
    }
    if (p.y<=(g.y+g.h) && (p.y+p.h)>=g.y)
    {
        return true;
    }
    else
    {
        return false;
    }
}
bool odbicie_k(SDL_Rect g, SDL_Rect p, int v)
{
    if ((p.x+p.w)<g.x || v<=0)
    {
        return false;
    }
    if (p.y<=(g.y+g.h) && (p.y+p.h)>=g.y)
    {
        return true;
    }
    else
    {
        return false;
    }
}
