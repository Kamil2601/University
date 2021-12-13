#include <iostream>
#include <complex>
#include <cmath>
#include <vector>
#include <numeric>

using complex = std::complex<double>;

complex euler(int n, complex z)
{
    complex mult = complex(1,0);

    for (int i=1; i<=n; i++)
    {
        complex ci = complex(i,0);
        mult *= std::pow(complex(1,0) + complex(1,0)/ci, z) / (complex(1,0) + z/ci);
    }

    return mult/z;
}

complex euler_inv(int n, complex z)
{
    static const complex gamma = complex(0.5772156649, 0);

    complex res = z * std::exp(gamma * z);

    for (int i=0; i<=n; i++)
    {
        complex ci(i,1);

        res *= (complex(1,0) + z/ci) * std::exp(-z/ci);
    }

    return res;
}

int main()
{


    return 0;
}