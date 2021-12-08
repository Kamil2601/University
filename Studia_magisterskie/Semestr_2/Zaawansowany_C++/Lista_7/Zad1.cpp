#include <iostream>
#include <ctime>
#include <algorithm>
#include <vector>

size_t uniform(size_t m)
{
    return rand() % m;
}

template <typename T>
void permute(std::vector<T> array)
{
    size_t n = array.size();

    for (size_t i = 0; i <= n - 2; i++)
    {
        size_t j = i + uniform(n - i);
        std::swap(array[i], array[j]);
    }
}

int main()
{
    srand(time(NULL));

    std::vector<int> vec = {0,1,2,3,4,5};

}