#include <cstdio>

int main()
{
    int n;
    scanf("%d\n", &n);
    int *coins = new int [n+1];
    coins[0] = 0;
    int max = 0;
    for (int i=1; i<=n; i++)
    {
        scanf("%d", &coins[i]);
        if (coins[i]>max)
        {
            max = coins[i];
        }
    }

    int m = 2*max;

    int *res = new int [m];

    for (int i=0; i<n+1; i++)
    {
        for (int j=i; j<n+1; j++)
        {
            res[coins[i]+coins[j]]++;
        }
    }

    //res[0]=1;

    for (int i=0; i<m; i++)
    {   
        if (res[i]>0)
            printf("%d %d\n",i, res[i]);
    }

    return 0;
}