#include <stdio.h>

int main()
{
    int a,b;
    scanf("%d %d", &a, &b);
    if (a>b)
    {
        int p=a;
        a=b;
        b=p;
    }
    for (int i=a; i<=b; i++)
    {
        printf("%d\n",i);
    }

    return 0;
}