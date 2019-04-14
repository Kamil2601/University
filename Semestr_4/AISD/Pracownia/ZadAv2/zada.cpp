#include <cstdio>

unsigned long long int sum = 0;
unsigned long long int *dist;
int n;

unsigned long long distance(int i, int j)
{
    unsigned long long int a = (dist[j]<dist[i] ? dist[i]-dist[j] : dist[j]-dist[i]);
    unsigned long long int b = sum - a;
    return (a<b ? a : b);
}


int bin_search(int i)
{
    
    unsigned long long d = 0, d_left = 0, d_right = 0;
    int jump = n/2;
    int j = (i+jump)%n;
    while (true)
    {
        d = distance(i,j);
        d_left = distance(i,(j-1+n)%n);
        d_right = distance(i,(j+1)%n);
        if (d >= d_left && d >= d_right)
        {
            break;
        }
        jump/=2;
        if (jump==0) jump++;
        if (d_left>d)
            j = (j-jump+n)%n;
        else
            j = (j+jump)%n;
    }
    return j;
}

int main()
{
    
    
    unsigned int e;
    scanf("%d", &n);
    dist = new unsigned long long int[n];
    for (int i=0; i<n; i++)
    {
        dist[i] = sum;
        scanf("%d", &e);
        sum+=e;
    }
    unsigned long long int best = 0;
    //unsigned long long int res = 0;
    int j = bin_search(0);
    best = distance(0,j);
    //printf("%lld\n",best);
    for (int i=1; i<n; i++)
    {
        for (int k=j; true; k++)
        {
            if (k>=n) goto END;
            unsigned long long int d = distance(i,k);
            unsigned long long int d_next = distance(i,(k+1)%n);
            if (d >= d_next)
            {
                j = k;
                if (d > best)
                {
                    best = d;
                }
                break;
            }
            
        }
    }

 END:   
    printf("%llu", best);
    delete [] dist;
    return 0;
}