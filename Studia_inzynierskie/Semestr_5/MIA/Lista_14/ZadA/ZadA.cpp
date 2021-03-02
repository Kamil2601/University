#include <iostream>

typedef unsigned long long ull;

using namespace std;

bool check(ull n, int k)
{
    int sum = 0;
    while (n > 0)
    {
        sum+=n&1;
        if (sum > k)
            return false;

        n>>=1;
    }

    return true;
}

int main()
{
    ull *x;
    ull fedor;
    int n,m,k;

    cin >> n >> m >> k;

    x = new ull[m];

    for (int i=0; i<m; i++)
    {
        cin >> x[i];
    }

    cin >> fedor;

    int sum = 0;

    for (int i=0; i<m; i++)
    {
        sum+=check(x[i]^fedor,k);
    }

    cout << sum << "\n";
}