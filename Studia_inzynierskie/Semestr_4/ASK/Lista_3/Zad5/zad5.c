#include <stdio.h>
#include <stdint.h>

int main()
{
    float f = 12.345;
    float g = -0.0;
    int32_t x = (int32_t)f;
    int32_t y = g;
    printf("%d\n",x);
}