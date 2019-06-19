#include <stdio.h>

int func4(int x, int a, int b);

int main()
{
    for (int i=0; i<16; i++)
    {
        if (func4(i,0,15)==18)
        {
            printf("%d\n",i);
        }
    }
}