#include "timer.h"

Timer Inicjuj_timer(Timer t)
{
    //Initialize the variables
    t.mStartTicks = 0;
    t.mPausedTicks = 0;

    t.mPaused = false;
    t.mStarted = false;

    return t;
}

Timer start(Timer t)
{
    //Start the timer
    t.mStarted = true;

    //Unpause the timer
    t.mPaused = false;

    //Get the current clock time
    t.mStartTicks = SDL_GetTicks();
	t.mPausedTicks = 0;

	return t;
}

Timer stop(Timer t)
{
    //Stop the timer
    t.mStarted = false;

    //Unpause the timer
    t.mPaused = false;

	//Clear tick variables
	t.mStartTicks = 0;
	t.mPausedTicks = 0;

	return t;
}

Timer pause(Timer t)
{
    //If the timer is running and isn't already paused
    if( t.mStarted && !t.mPaused )
    {
        //Pause the timer
        t.mPaused = true;

        //Calculate the paused ticks
        t.mPausedTicks = SDL_GetTicks() - t.mStartTicks;
		t.mStartTicks = 0;
    }

    return t;
}

Timer unpause(Timer t)
{
    //If the timer is running and paused
    if( t.mStarted && t.mPaused )
    {
        //Unpause the timer
        t.mPaused = false;

        //Reset the starting ticks
        t.mStartTicks = SDL_GetTicks() - t.mPausedTicks;

        //Reset the paused ticks
        t.mPausedTicks = 0;
    }

    return t;
}

Uint32 getTicks(Timer t)
{
	//The actual timer time
	Uint32 time = 0;

    //If the timer is running
    if( t.mStarted )
    {
        //If the timer is paused
        if( t.mPaused )
        {
            //Return the number of ticks when the timer was paused
            time = t.mPausedTicks;
        }
        else
        {
            //Return the current time minus the start time
            time = SDL_GetTicks() - t.mStartTicks;
        }
    }

    return time;
}

bool isStarted(Timer t)
{
	//Timer is running and paused or unpaused
    return t.mStarted;
}

bool isPaused(Timer t)
{
	//Timer is running and paused
    return t.mPaused && t.mStarted;
}
