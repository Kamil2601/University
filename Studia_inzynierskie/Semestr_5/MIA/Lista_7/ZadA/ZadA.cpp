#include <iostream>
#include <algorithm>

int main()
{
    int n;
    std::cin >> n;

    int *a = new int[n];

    for (int i=0; i<n; i++)
    {
        std::cin >> a[i];
    }

    long long int sum = a[n-1];

    for (int i=n-2; i>=0; i--)
    {
        if (a[i]>=a[i+1])
        {
            a[i] = a[i+1]-1;
        }

        if (a[i] < 0) break;
        sum += a[i];
    }

    std::cout << sum << '\n';

    return 0;
}