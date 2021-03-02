#include <stdio.h>

/*
    avg(x,y) = floor((x+y)/2)
*/

int avg(int x, int y)
{
    int half_x = x>>1;
    int half_y = y>>1;

    return half_x+half_y+(x&y&1);
}

int main()
{
    printf("%d\n", avg(3,4));
    printf("%d\n", avg(3,3));
    printf("%d\n", avg(4,4));

}