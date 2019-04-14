#include <stdio.h>

union elem{
    struct{
        long *p;
        long y;
    } e1;
    struct{
        long x;
        union elem *next;
    } e2;
}elem;

union elem proc(union elem el)
{
    union elem x = *(el.e2.next);
    long y = *(x.e1.p);
    long z = y;
}

union elem* proc2(union elem* rdi) {
    union elem* rax = rdi->e2.next;
    long rdx = *(rax->e1.p);
    //union elem el = *(rax->e2.next); 
    rdx -= rax->e1.y;
    rdi->e2.x = rdx;
    return rax;
}


int main()
{
    printf("%lu\n", sizeof(union elem));
}