#include <iostream>

typedef long long ll;

using namespace std;

int main()
{
    ll a, b;
    cin >> a >> b;
    ll sum = 0;
    for (ll i = 0; i < 63; i++)
    {
        for (ll j = 0; j < i; j++)
        {
            ll d = (2LL << i) - (1LL << j) - 1;
            if (d >= a && d <= b)
            {
                sum++;
            }
        }
    }
    cout << sum << "\n";
    return 0;
}