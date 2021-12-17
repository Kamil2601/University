#include <iostream>
#include <complex>
#include <cmath>
#include <vector>
#include <numeric>


using complex = std::complex<double>;


complex polynomial_value(std::vector<complex> polynomial, complex x)
{
    auto plus = [x](std::pair<complex, complex> sum, complex p) {
        return std::make_pair(sum.first + p * sum.second, sum.second * x);
    };

    return std::accumulate(polynomial.begin(), polynomial.end(), std::make_pair(complex(0,0), complex(1,0)), plus).first;
}


int main()
{
    auto vec = {complex(1.0, 0.0), complex(2.0, 0.0), complex(3.0,0)};

    auto res = polynomial_value(vec, complex(2,5));

    std::cout << res.real() << "+" << res.imag() << "i\n";

    return 0;
}