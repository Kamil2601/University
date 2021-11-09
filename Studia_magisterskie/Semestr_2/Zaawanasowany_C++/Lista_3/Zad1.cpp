#include <iostream>
#include <limits>

int main()
{
    std::cout << std::numeric_limits<long long int>::max() << "\n";
    std::cout << std::numeric_limits<long long int>::min() << "\n";

    std::cout << std::numeric_limits<long long int>::digits10 << "\n";
    std::cout << std::numeric_limits<long long int>::digits << "\n";
}