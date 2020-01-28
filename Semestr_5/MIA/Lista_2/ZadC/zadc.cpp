#include <iostream>
#include <unordered_set>
#include <inttypes.h>

using namespace std;

uint64_t gcd(uint64_t a, uint64_t b)
{
    uint64_t c;
    while (b!=0)
    {
        c = a % b;
        a = b;
        b = c;
    }

    return a;
}


int main()
{

    unordered_set <uint64_t> tree;

    uint64_t n;

    cin >> n;

    uint64_t *a = new uint64_t[n];
    uint64_t *gcds = new uint64_t[n];

    for (uint64_t i=0; i<n; i++)
    {
        cin >> a[i];
        gcds[i] = a[i];
    }

    for (uint64_t j=0; j<n; j++)
    {
        tree.insert(a[j]);
    }

    uint64_t k;
    bool same = true;
    bool continue_ = true;

    for (uint64_t i=0; i<n; i++)
    {
        if (gcds[i]>1)
        {
            for (int j=i+1; j<n && gcds[i]>1; j++)
            {
                gcds[i] = gcd(gcds[i],a[j]);
                //tree.insert(gcds[i]);
            }
        }
    }    

    bool one = false;
    for (uint64_t i = 0; i<n; i++)
    {
        if (gcds[i]==1)
        {
            one = true;
            break;
        }
    }
    if (one)
        tree.insert(1);
    uint64_t res = tree.size();
    cout << res << "\n";
    
    return 0;
}