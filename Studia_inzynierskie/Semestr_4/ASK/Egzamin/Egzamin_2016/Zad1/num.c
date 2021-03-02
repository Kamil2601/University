#include <stdio.h>

/*
             {  i  if n=2*i
    num(n) = {
             { -i if n=2*i+1
*/

int num(unsigned n)
{
    int i = n>>1;
    int p = n&1;
    int mask = ~(p-1); //1...1 jeśli n nieparzyste, 0...0 jeśli n parzyste
    int minus_i = ~(i-1);
    int to_add = minus_i&mask; // -i jeśli n nieparzyste, 0 jeśli n parzyste
    return i+to_add+to_add;
}

int main()
{
    printf("%d\n", num(121u));
}