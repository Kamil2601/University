#include <stdio.h>

struct B{
        int y;
        char a1,a2,a3,a4;
}B;

struct A{
    int x;
    struct B b;
} A;

struct C{
    long y;
    int z;
    int x;
} C;

int main(){

    printf("int: %lu\n",sizeof(int));
    printf("long: %lu\n",sizeof(long));
    printf("long long: %lu\n",sizeof(long long));
    printf("double: %lu\n",sizeof(double));
    printf("float: %lu\n",sizeof(float));
    printf("int*: %lu\n",sizeof(int*));
    printf("short: %lu\n",sizeof(short));
    printf("size_t: %lu\n",sizeof(size_t));
    printf("void*: %lu\n",sizeof(void*));

    printf("A: %lu\n", sizeof(struct A));
    printf("B: %lu\n", sizeof(struct B));
    printf("C: %lu\n", sizeof(struct C));
    return 0;
}