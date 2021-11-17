#include <iostream>
#include <limits>

int main()
{
    std::cout << std::numeric_limits<float>::min() << "\n";
    std::cout << std::numeric_limits<double>::min() << "\n\n";

    std::cout << std::numeric_limits<float>::max() << "\n";
    std::cout << std::numeric_limits<double>::max() << "\n\n";

    std::cout << std::numeric_limits<float>::epsilon() << "\n";
    std::cout << std::numeric_limits<double>::epsilon() << "\n\n";
}