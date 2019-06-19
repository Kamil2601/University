#include <stdio.h>
#include <inttypes.h>

typedef struct {
  uint32_t n;
  uint8_t digits[10];
} bignum_t;

void add_bignum(bignum_t *a, bignum_t *b, bignum_t *r);

int main()
{
    bignum_t a = {.n = 2, .digits[0]=0x10, .digits[1]=0x10};
    bignum_t b = {.n = 2, .digits[0]=0xf0, .digits[1]=0xf0};
    bignum_t r = {.n = 4,};
    bignum_t *a_ptr = &a;
    bignum_t *b_ptr = &b;
    bignum_t *r_ptr = &r;

    add_bignum(&a, &b, &r);
    printf("%x\n",r.digits[3]);
    printf("%x\n",r.digits[2]);
    printf("%x\n",r.digits[1]);
    printf("%x\n",r.digits[0]);
    return 0;
}