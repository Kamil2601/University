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

int clz(uint64_t);

int clz2(uint64_t n)
{
    uint8_t jump = 16;
    int res = 32;
    uint64_t mask=((uint64_t)1<<31);
    do
    {
        if (mask>n)
        {
            mask>>=jump;
            res+=jump;
        }
        else
        {
            mask<<=jump;
            res-=jump;
        }
        
    } while(jump>>=1);
    if ((mask<<1)<=n) return res-1;
    if ((mask>>1)>=n) return res+1;
    else return res;
}


int main()
{

    /*for (int i=0; i<64; i++)
    {
        uint64_t x = (uint64_t)1<<i;
        printf("%d\n",clz(x));
        //print_bin(x);
    }*/

    print_bin((uint64_t)0x001F089ADF39FE00);
    printf("%d\n",clz((uint64_t)0x001F089ADF39FE00));

}