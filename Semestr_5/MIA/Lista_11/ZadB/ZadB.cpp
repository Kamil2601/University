#include <cstdio>
#include <algorithm>
#include <iostream>

using namespace std;
#define ll long long int
#define INF 0x3f3f3f3f
#define maxn 111111
int m, n, a[maxn], b[maxn];
int main()
{
    scanf("%d%d", &m, &n);

    ll sum1 = 0, sum2 = 0;
    for (int i = 0; i < m; i++)
    {
        scanf("%d", &a[i]);
        sum1 += a[i];
    }
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &b[i]);
        sum2 += b[i];
    }

    sort(a, a + m), sort(b, b + n);
    ll ans1 = sum2, ans2 = sum1;

    for (int i = 0; i < m - 1; i++)
        ans1 += min(sum2, 1ll * a[i]);

    for (int i = 0; i < n - 1; i++)
        ans2 += min(sum1, 1ll * b[i]);

    cout <<  min(ans1, ans2) << '\n';

    return 0;
}