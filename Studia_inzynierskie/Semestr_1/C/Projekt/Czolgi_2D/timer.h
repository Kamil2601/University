#ifndef _TIMER
#define _TIMER

#include "includes.h"
//The application time based timer
typedef struct Timer
{
    //The clock time when the timer started
    Uint32 mStartTicks;

    //The ticks stored when the timer was paused
    Uint32 mPausedTicks;

    //The timer status
    bool mPaused;
    bool mStarted;
}Timer;


//Initializes variables
Timer Inicjuj_timer(Timer t);

//The various clock actions
Timer start(Timer t);
Timer stop(Timer t);
Timer pause(Timer t);
Timer unpause(Timer t);

//Gets the timer's time
Uint32 getTicks(Timer t);

//Checks the status of the timer
bool isStarted(Timer t);
bool isPaused(Timer t);

#endif
