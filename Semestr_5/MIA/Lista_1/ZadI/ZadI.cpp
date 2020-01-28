#include <cstdio>
#include <iostream>
#include <algorithm>

#define ll long long int

int n, a, b;
ll *arr;
ll f(ll s)
{
    return (ll)a*s+b;
}

ll solve(int first, int last)
{
    if (first==last)
    {
        return f(arr[first]);
    }
    else if (first==last-1)
    {
        return f(arr[first]+arr[last]);
    }
    int p = (first+last)/2;
    
    ll left = solve(first, p-1);
    ll right = solve(p+1, last);

    ll mid_right = 0;
    ll s = 0;

    for (int i=p+1; i<=last; i++)
    {
        s += arr[i];
        if (f(s)>f(mid_right))
        {
            mid_right = s;
        }
    }

    s = 0;

    ll mid_left = 0;

    for (int i=p-1; i>=first; i--)
    {
        s+=arr[i];
        if (f(s)>f(mid_left))
        {
            mid_left = s;
        }
    }

    ll mid = f(mid_left+arr[p]+mid_right);


    ll res = std::max(std::max(left, right), mid);

    return res;
}

int main()
{
    scanf("%d %d %d", &n, &a, &b);
    arr = new ll[n];
    for (int i=0; i<n; i++)
    {
        scanf("%lld", &arr[i]);
    }

    ll res = solve(0,n-1);

    printf("%lld\n", res);
}