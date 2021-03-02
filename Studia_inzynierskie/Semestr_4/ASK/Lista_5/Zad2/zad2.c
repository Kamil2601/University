#include <stdio.h>

long puzzle(char *s, char *d)
{
    char *s1 = s;
    char x,y;
    char *d1;
    //printf("test\n");
    while (1)
    { 
        x = s1[0];
        d1 = d;
        do
        {
            y = d1[0];
            d1++;
            if (y=='\0')
            {
                return s1-s;
            }
        } while(x!=y);
        s1++;
    }
}

int main()
{
    char *xd = "ab";
    char *dx = "bbcba";
    //printf("%d\n", xd[0]=='\0');
    printf("%ld\n", puzzle(xd,dx));
}