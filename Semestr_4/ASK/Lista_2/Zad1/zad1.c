#include <stdio.h>
#include <limits.h>
#include <stdint.h>

/* Oblicz x * 3 / 4 zaokrąglając w dół. */
int32_t threefourths(int32_t x)
{
    int32_t r = x&3;
    int32_t y = x>>2;
    y += y + y;
    int32_t z = (r+r+r)>>2;
    return y + z;
}


int main()
{
    uint32_t x = INT32_MAX>>1;
    printf ("%d\n", x*x);
    
}

