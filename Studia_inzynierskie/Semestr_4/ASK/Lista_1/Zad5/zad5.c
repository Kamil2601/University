#include <stdio.h>

int main()
{
    int a[5] = {0,1,2,3,4};

    int i=0;
    a[i++] += 2;

    printf("%d, %d, %d %d\n", a[0], a[1], a[2], i);
}