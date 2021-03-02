#include <cstdio>
#include <iostream>

using namespace std;

long long unsigned mod_mul(long long unsigned a, long long unsigned b, long long unsigned m){
  long long unsigned ans = 0, tmp = a % m;
  while( b ){
    if (b & 1)
      ans = (ans + tmp) % m;
    tmp = (tmp * 2) % m;
    b >>= 1;
  }
  return ans;
}

long long unsigned pow(long long unsigned n, long long unsigned k, long long unsigned m)
{
    long long unsigned res = 1;
    k%=m;
    while (n>0)
    {
        if (n&1)
        {
            res = mod_mul(res,k,m);
        }

        n >>= 1;
        k = mod_mul(k,k,m);
    }

    return res;

}

void solve()
{
    long long unsigned n,k,m;

    cin >> n >> k >> m;
    cout << pow(n,k,m) << "\n";
}

int main()
{
    int tests;
    cin >> tests;
    for (int i=0; i<tests; i++)
    {
        solve();
    }
}