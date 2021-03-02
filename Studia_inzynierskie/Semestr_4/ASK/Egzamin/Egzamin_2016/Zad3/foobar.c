#include <stdio.h>

int foobar(long *arr, int *arr2)
{
    unsigned i=0;
    int b=0;
    while (arr[i]!=0)
    {
        if (arr[i]<=0)
        {
            b--;
        }
        else
        {
            b++;
        }
        i++;
    }
}