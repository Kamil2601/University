#include <iostream>
#include <cmath>
#include <cstdio>

#define ll long long int

using namespace std;

long long int a00, a01, a10, a11;
long long n0, n1;

int main()
{
    cin >> a00 >> a01 >> a10 >> a11;

    double s1 = sqrt((double)(1+8*a11));

    if ((double)(ll)s1 != s1)
    {
        cout << "Impossible\n";
        return 0;
    }

    double s0 = sqrt((double)(1+8*a00));

    if ((double)(ll)s0 != s0)
    {
        cout << "Impossible\n";
        return 0;
    }

    n0 = ((ll)s0+1)/2;
    n1 = ((ll)s1+1)/2;

    bool *seq = new bool[n0+n1];

    for (int i=0; i<2; i++)
    {
        printf("%d\n", xd[i]);
    }
}