#include <iostream>
#include <ratio>

template <int N>
struct harmonic : public std::ratio_add<std::ratio<1, N>, harmonic<N-1>> {};

template <>
struct harmonic<1> : public std::ratio<1, 1> {};



int main()
{
    constexpr auto n = 47;
    using h_n = harmonic<n>;
    std::cout << "H_" << n << " = " << h_n::num << "/" << h_n::den << std::endl;
}