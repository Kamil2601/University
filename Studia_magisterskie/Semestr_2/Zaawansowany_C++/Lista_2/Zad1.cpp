#include <memory>
#include <iostream>
#include <cstdlib>
#include <ctime>

class Counter
{
    uint64_t _value = 1;


    public:

    virtual ~Counter()
    {
        std::cerr << "Value = " << _value << "\n";
    }

    uint64_t value()
    {
        return _value;
    }

    void increase(uint64_t inc = 1)
    {
        _value += inc;
    }
};

const int m = 10;
const int n = 10;

std::unique_ptr<Counter[]> increaseRecursive(std::unique_ptr<Counter[]> counters, int nCall = 1)
{
    if (nCall > m)
        return counters;

    int index = rand() % n;

    counters[index].increase(nCall);

    return increaseRecursive(std::move(counters), nCall+1);
}

int main()
{
    srand (time(NULL));

    std::unique_ptr<Counter[]> counters(new Counter[n]);

    counters = increaseRecursive(std::move(counters));

    for (int i=0; i<n; i++)
    {
        std::cout << counters[i].value() << " ";
    }

    std::cout << "\n";
}