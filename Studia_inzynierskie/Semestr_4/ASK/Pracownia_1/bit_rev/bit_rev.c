#include <stdio.h>
#include <inttypes.h>

void print_bin(uint64_t n)
{
    char res[65];
    res[64] = '\0';
    for (int i=63; i>=0; i--)
    {
        if (n%2==0)
        {
            res[i]='0';
        }
        else
        {
            res[i]='1';
        }
        n/=2;
    }

    printf("%s\n",res);
}

uint64_t revbit(uint64_t);

uint64_t revbit2(uint64_t n)
{
    uint64_t left  = n&0xFFFFFFFF00000000;
    uint64_t right = n&0x00000000FFFFFFFF;
    n = (left>>32)|(right<<32);
    left  = n&0xFFFF0000FFFF0000;
    right = n&0x0000FFFF0000FFFF;
    n = (left>>16)|(right<<16);
    left  = n&0xFF00FF00FF00FF00;
    right = n&0x00FF00FF00FF00FF;
    n = (left>>8)|(right<<8);
    left  = n&0xF0F0F0F0F0F0F0F0;
    right = n&0x0F0F0F0F0F0F0F0F;
    n = (left>>4)|(right<<4);
    left  = n&0xCCCCCCCCCCCCCCCC;
    right = n&0x3333333333333333;
    n = (left>>2)|(right<<2);
    left  = n&0xAAAAAAAAAAAAAAAA;
    right = n&0x5555555555555555; 
    n = (left>>1)|(right<<1);
    return n;    
}

int main()
{
    uint64_t x = 1;
    uint64_t res = revbit(x);
    print_bin(x);
    print_bin(res);
}