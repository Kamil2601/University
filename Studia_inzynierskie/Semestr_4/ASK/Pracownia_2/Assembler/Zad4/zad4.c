#include <stdio.h>


void insert_sort2(long *first, long *last)
{
    int n = (last-first)+1;
    //printf("%ld %ld %d\n",first, last, n);
    long *i;
    long *j;
    long temp;
    for (i=first+1; i<=last; i++)
    {
        temp = *i;
        j = i-1;
        while (j>=first && *j>temp)
        {
            *(j+1) = *j;
            j--;
        }
        *(j+1) = temp;
    }
}

void insert_sort(long *first, long *last);

int main()
{
    int n = 5;
    long tab[5] = {-10, 21, 2,5,-234};
    for (int i=0; i<n; i++)
    {
        printf("%ld ", tab[i]);
    }
    printf("\n");
    insert_sort(tab, tab+(n-1));
    for (int i=0; i<n; i++)
    {
        printf("%ld ", tab[i]);
    }
    printf("\n");

    return 0;
}