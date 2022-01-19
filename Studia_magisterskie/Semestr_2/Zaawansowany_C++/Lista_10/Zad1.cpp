#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <iomanip>


int main()
{
    std::string line;
    std::getline(std::cin, line);
    std::istringstream stream(line);
    
    std::vector<float> numbers(std::istream_iterator<float>(stream), {});

    std::cout << std::setprecision(3) << std::fixed;
    std::ostream_iterator<float> out(std::cout, " ");

    std::copy ( numbers.begin(), numbers.end(), out );

    std::cout << std::endl;
}