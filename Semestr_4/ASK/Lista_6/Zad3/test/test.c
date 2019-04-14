#include <stdio.h>
#include <inttypes.h>

typedef struct{
    int idx;
    long x[4];
} a_struct;

typedef struct{
    int first;
    a_struct a[7];
    //int last;
} b_struct;

int main()
{
    printf("%lu  %lu\n",sizeof(a_struct), sizeof(b_struct));
}