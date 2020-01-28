#include <cstdio>
#include <vector>
#include <utility>
#include <iostream>
#include <algorithm>
#include <string.h>

#define ll long long int

#define Vec std::vector<std::pair<ll, ll>>

ll n,k;
ll *d;
ll dep[1001];
ll cost[1001];
Vec *tree;

void dfs(ll v, ll p, ll weight)
{
    if (tree[v].size()==1)
    {
        dep[v] = d[v];
        cost[v] = d[v]*weight;
        return;
    }

    ll sum = 0;
    for (auto e : tree[v])
    {
        auto u = e.first;
        auto w = e.second;
        

        if (u!=p)
        {
            dfs(u, v, w);
            sum+=dep[u];
        }
    }

    dep[v] = sum;
    cost[v] = sum*weight;
}

void count_deps(ll s)
{
    for (auto e : tree[s])
    {
        dfs(e.first,s, e.second);
    }
}

int main()
{
    scanf("%lld %lld", &n, &k);
    d = new ll[n];
    tree = new Vec[n];
    for (ll i=0; i<n; i++)
    {
        scanf("%lld", &d[i]);
    }

    ll a,b,w;

    for (ll i=0; i<n-1; i++)
    {
        scanf("%lld %lld %lld",&a,&b,&w);
        a--; b--;
        tree[a].push_back(std::make_pair(b,w));
        tree[b].push_back(std::make_pair(a,w));
    }

    ll best = -1;

    for (ll s=0; s<n; s++)
    {

        memset(cost,0,n*sizeof(int));
        memset(dep,0,n*sizeof(int));

        count_deps(s);

        std::sort(cost, cost+n, std::greater<int>());

        ll sum = 0;

        for (ll i=k; i<n; i++)
        {
            sum+=cost[i];
        }

        if (sum < best || best == -1)
            best = sum;
    }

    printf("%lld\n",best);
}