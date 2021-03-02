#include <stdio.h>
#include <inttypes.h>



uint32_t puzzle3(uint32_t n, uint32_t d);

uint32_t puzzle(uint32_t n, uint32_t d)
{
    uint32_t mask = (1<<31);
    uint32_t res = 0;
    uint64_t n1 = n;
    uint64_t d1 = (uint64_t)d<<32;
    
    for (uint32_t i=32; i>0; i--)
    {
        n1+=n1;
        int64_t diff = n1-d1;
        if (diff>=0)
        {
            res = res|mask;
            n1 = diff;
        }
        mask>>=1;
    }
    return res;
}

int main()
{
    printf("%d\n", sizeof(long));
    /*printf("%d\n", puzzle3(12,3));
    printf("%d\n", puzzle3(2,1));
    printf("%d\n", puzzle3(100,10));
    printf("%d\n", puzzle3(2,2));
    printf("%d\n\n\n", puzzle3(2,4));


    printf("%d\n", puzzle(12,3));
    printf("%d\n", puzzle(2,1));
    printf("%d\n", puzzle(100,10));
    printf("%d\n", puzzle(2,2));
    printf("%d\n", puzzle(2,4));*/
}