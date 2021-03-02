#include <stdio.h>
#include <stdint.h>

struct A {
    int8_t a;
    int b;
    int8_t c;
    int16_t d;
    //Lepsza kolejność: b, a, c, d
};

struct B {
    uint16_t a;
    double b;
    int c;
    //Lepsza kolejność: b,c,a
};

int main()
{
    printf("%lu\n", sizeof(struct A));
}