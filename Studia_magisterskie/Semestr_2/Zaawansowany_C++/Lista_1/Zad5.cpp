#include <iostream>

auto lucasNumber(uint32_t n)
{
    if (n == 0)
        return 2;
    if (n == 1)
        return 1;
    return lucasNumber(n-1) + lucasNumber(n-2);
}

auto lucasNumber2(uint32_t n)
{
    auto a = 2;
    auto b = 1;


    for (int i=0; i<n; i++)
    {
        auto c = a+b;
        a = b;
        b = c;
    }

    return a;
}

int main()
{
    std::cout << lucasNumber(10) << "\n" << lucasNumber2(10) << "\n";

    return 0;
}