#include <iostream>

using namespace std;

int main()
{
    int n, k, mask[16] = {0};
    int cur_mask;
    cin >> n >> k;
    for (int i = 0; i < n; ++i)
    {
        cur_mask = 0;
        for (int j = 0; j < k; ++j)
        {
            int t;
            cin >> t;
            cur_mask = (cur_mask << 1) | t;
        }
        mask[cur_mask] = 1;
    }

    for (int a = 0; a < (1 << k); ++a)
    {
        for (int b = a; b < (1 << k); ++b)
        {
            if ((a & b == 0) && mask[a] && mask[b])
            {
                cout << "YES\n";
                return 0;
            }
        }
    }

    cout << "NO\n";
    return 0;
}