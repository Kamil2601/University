
#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <iomanip>
#include <fstream>

uint64_t gcd(uint64_t a, uint64_t b)
{
    if (!b)
    {
        return a;
    }
    else
    {
        return gcd(b, a % b);
    }
}

uint64_t totient(uint64_t k)
{
    uint64_t result = 0;

    for (uint64_t i = 1; i <= k; i++)
    {
        if (gcd(k, i) == 1)
        {
            result++;
        }
    }

    return result;
}

int main()
{
    int k;
    std::cin >> k;

    std::vector<uint64_t> values(k);
    
    for (int i=0; i<k; i++)
    {
        values[i] = totient(i);
    }

    std::ofstream file("phi.txt");
    std::ostream_iterator<uint64_t> out(file, "; ");

    std::copy ( values.begin(), values.end(), out );
}