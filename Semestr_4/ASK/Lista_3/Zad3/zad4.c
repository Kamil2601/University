#include <stdio.h>
#include <stdint.h>

int main()
{
    int32_t x=INT32_MAX;
    int32_t y=INT32_MAX;
    int32_t z=(1<<22)|1;
    double dx=x,dy=y,dz=z;

    printf ("%X\n%X\n", (dx*dy)*dz,dx*(dy*dz));
    printf ("%d\n", (dx*dy)*dz == dx*(dy*dz));
    return 0;
}