#include <iostream>
#include <algorithm>
#include <vector>
#include <list>
#include <set>
#include <numeric>
#include <iterator>

template <typename T>
class PrintIfBetween
{
private:
    T _a, _b;

public:
    PrintIfBetween(T a, T b) : _a{a}, _b{b} {}

    void operator()(T val) const
    {
        if (val > _a && val < _b)
        {
            std::cout << val << " ";
        }
    }
};

template <typename T>
class PrintEveryK
{
private:
    size_t k, p;
    size_t i = 0;

public:
    PrintEveryK(size_t k, size_t p)
    {
        this->k = k;
        this->p = p;
    }

    void operator()(T val)
    {
        if (i >= p && (i - p) % k == 0)
        {
            std::cout << val << " ";
        }

        i++;
    }
};

template <typename Iter>
class MinMax
{
    Iter _begin;
    Iter _end;

    public:
    MinMax(Iter begin, Iter end)
    {
        _begin = begin;
        _end = end;
    }

    std::pair<Iter, Iter> operator()()
    {
        Iter min_it = _begin;
        Iter max_it = _begin;
        
        for (Iter it = _begin; it != _end; ++it)
        {
            if (*it > *max_it)
                max_it = it;
    
            if (*it < *min_it)
                min_it = it;
        }

        return std::make_pair(min_it, max_it);
    }
};

int main()
{
    std::vector<double> vec = {1.2, 2.3, 3.7, 0.2, 3.4, 2.0, 2.5, 2.7, 3.0};
    std::list<std::string> l = {"A", "B", "C", "D", "E", "F", "G", "H", "I"};
    std::set<int> s = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};

    // A

    std::for_each(vec.begin(), vec.end(), PrintIfBetween<double>(2.1, 3.6));
    std::cout << "\n";

    std::for_each(l.begin(), l.end(), PrintIfBetween<std::string>("B", "E"));
    std::cout << "\n";

    std::for_each(s.begin(), s.end(), PrintIfBetween<int>(3, 10));
    std::cout << "\n\n";

    // B

    std::for_each(vec.begin(), vec.end(), PrintEveryK<double>(3, 1));
    std::cout << "\n";

    std::for_each(l.begin(), l.end(), PrintEveryK<std::string>(2, 0));
    std::cout << "\n";

    std::for_each(s.begin(), s.end(), PrintEveryK<int>(1, 5));
    std::cout << "\n\n";

    // C

    std::cout << std::accumulate(vec.begin(), vec.end(), 0.0) / vec.size() << "\n";
    std::cout << (double)(std::accumulate(s.begin(), s.end(), 0.0)) / s.size() << "\n\n";

    // D

    auto res = MinMax<std::vector<double>::iterator>(vec.begin(), vec.end())();
    std::cout << *res.first << " " << *res.second << "\n\n";

    auto res2 = MinMax<std::set<int>::iterator>(s.begin(), s.end())();
    std::cout << *res2.first << " " << *res2.second << "\n\n";

    // E

    auto plus = [](auto a, auto b) { return a + b; };

    std::cout << std::accumulate(l.begin(), l.end(), (std::string) "", plus) << "\n";
    std::cout << std::accumulate(l.begin(), l.end(), (std::string) "") << "\n";

    std::cout << std::accumulate(vec.begin(), vec.end(), 0) << "\n";
    std::cout << std::accumulate(s.begin(), s.end(), 0) << "\n";
}