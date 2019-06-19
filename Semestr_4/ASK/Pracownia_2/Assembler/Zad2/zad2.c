#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

uint32_t sqrf2(uint32_t n)
{
    uint32_t exp = n&0x7F800000;
    exp >>= 23;
    int32_t c = (int32_t)exp - 127;
    c*=2;
    uint32_t mant = n&0x007FFFFF;
    mant |= 0x00800000; //teraz w mant jest 1,xxxx*2^23
    uint64_t square = (uint64_t)mant * (uint64_t)mant; //m^2*2^36
    square >>= 23; //m^2*2^23
    if (square>=(1<<24))
    {
        c+=1;
        square >>= 1;
    }
    if (c<-126)
    {
        return 0;
    }
    exp = c+127;
    if (exp>255)
    {
        return 0x7F800000;
    }
    square ^= 0x00800000;
    mant = (uint32_t)square;
    exp <<= 23;
    return (exp | mant);
}

extern uint32_t sqrf(uint32_t n);


int main()
{
    float x = 0.1;
    uint32_t n = *(int*)&x;
    uint32_t res = sqrf(n);
    x = *(float*)&res;
    printf("%.30f\n",x);
}