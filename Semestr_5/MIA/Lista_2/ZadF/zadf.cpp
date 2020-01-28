#include <iostream>
#include <algorithm>

using namespace std;

bool cmp(int x, int y)
{
    return x>y;
}

int main()
{
    int n;

    cin >> n;

    int *a = new int[n];

    for (int i=0; i<n; i++)
    {
        cin >> a[i];
    }

    sort(a,a+n,cmp);

    int sum_a = 0, sum_b = 0;

    for (int i=0; i<n; i++)
    {
        if (i % 2 == 0)
        {
            sum_a+=a[i];
        }
        else
        {
            sum_b+=a[i];
        }
        
    }

    cout << sum_a << " " << sum_b << '\n';

    return 0;
}
