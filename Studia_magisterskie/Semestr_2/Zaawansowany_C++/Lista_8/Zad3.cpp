#include <iostream>
#include <complex>
#include <cmath>
#include <vector>
#include <numeric>

using complex = std::complex<double>;

complex Rieman(int n, complex z)
{
    complex res(0,0);

    for (int i=0; i<=n; i++)
    {
        res += std::pow(complex(1,0)/complex(i,0), z);
    }

    return res;
}

int main()
{

    return 0;
}