//Kamil Michalak
//299089
//MWa

#include <stdio.h>

int main()
{
    int a, b, start;
    scanf("%d %d", &a, &b);
    if (a%2018==0)
        start = a;
    else
        start = (a/2018+1)*2018;

    for (int i=start; i<=b; i+=2018)
    {
        printf("%d ", i);
    }

    return 0;
}