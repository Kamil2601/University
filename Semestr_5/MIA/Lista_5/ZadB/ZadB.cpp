#include <iostream>
#include <cstdio>

#define ll unsigned long long int

ll parent(ll i)
{
    return i/2;
}

ll left(ll i)
{
    return 2*i;
}

ll right(ll i)
{
    return 2*i+1;
}

ll next_to(ll i)
{
    if (i%2==0) return i+1;
    else return i-1;
}

ll pow2(ll h)
{
    ll n = 1;

    for (ll i = 0; i<h; i++)
    {
        n*=2;
    }

    return n;
}

ll **tree;

using namespace std;

void print_tree(ll n, ll h)
{
    ll k = n;

    for (ll i=0; i<=h; i++)
    {
        for (ll j=0; j<k; j++)
        {
            cout << tree[i][j] << ' ';
        }
        cout << '\n';
        k/=2;
    }

    cout << "---------------------\n";
}


int main()
{
    ll h, m;

    cin >> h >> m;

    tree = new ll*[h+1];

    ll n = pow2(h);

    //cout << "n = " << n << "\n";
    ll k = n;

    for (ll i=0; i<=h; i++)
    {
        tree[i] = new ll[k];
        k/=2;
    }

    for (ll i=0; i<n; i++)
    {
        cin >> tree[0][i];
    }

    k = n/2;

    for (ll i=1; i<=h; i++)
    {
        for (ll j=0; j<k; j++)
        {
            if (i%2==1)
            {
                tree[i][j] = tree[i-1][left(j)] | tree[i-1][right(j)];
            }
            else
            {
                tree[i][j] = tree[i-1][left(j)] ^ tree[i-1][right(j)];
            }
        }
        k/=2;
    }

    //print_tree(n,h);

    ll p, b;

    for (ll i=0; i<m; i++)
    {
        cin >> p >> b;
        p--;
        tree[0][p] = b;
        for (ll j=1; j<=h; j++)
        {
            //printf("p = %llu, b = %llu\n",p,b);
            p = parent(p);
            if (j%2==1)
                tree[j][p] = tree[j-1][left(p)] | tree[j-1][right(p)];
            else
                tree[j][p] = tree[j-1][left(p)] ^ tree[j-1][right(p)];
            
        }

        //print_tree(n,h);
        cout << tree[h][0] << '\n';
    }
}

