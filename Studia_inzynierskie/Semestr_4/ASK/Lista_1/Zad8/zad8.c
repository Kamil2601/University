#include <stdio.h>
#include <stdint.h>

void secret(uint8_t *to, uint8_t *from, size_t count)
{
    size_t n = (count + 7) / 8;
    printf ("%zu\n\n", count%8);
    switch (count % 8)
    {
    case 0: do { *to++ = *from++;
    case 7:     *to++ = *from++;
    case 6:     *to++ = *from++;
    case 5:     *to++ = *from++;
    case 4:     *to++ = *from++;
    case 3:     *to++ = *from++;
    case 2:     *to++ = *from++;
    case 1:     *to++ = *from++;
                } while (--n > 0);
}
}

int main()
{
    uint8_t a = 5;
    uint8_t b = 15;

    uint8_t *p = &a;
    uint8_t *q = &b;

    printf("%u %u \n", a, b);
    printf("%u %u \n", *p, *q);
    secret(q, p, 8);
    printf("%u %u \n", a, b);
    printf("%u %u \n", *p, *q);
}