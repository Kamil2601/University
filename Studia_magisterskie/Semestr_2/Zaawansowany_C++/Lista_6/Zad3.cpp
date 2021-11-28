#include <iostream>
#include <vector>
#include <utility>
#include <map>
#include <algorithm>

std::vector<std::pair<int, int>> most_common(const std::vector<int>& vec)
{
    std::map<int, int> count;

    for (int k: vec)
    {
        if (count.find(k) == count.end())
            count[k] = 1;
        else
            count[k]++;
    }

    auto cmp = [](std::pair<int, int> a, std::pair<int, int> b) {
        return a.second < b.second;
    };

    int max_count = std::max_element(count.begin(), count.end(), cmp)->second;

    std::vector<std::pair<int, int>> res;

    for (const auto &[n, c]: count)
    {
        if (c == max_count)
            res.push_back(std::make_pair(n, c));
    }

    return res;
}

int main()
{
    std::vector<int> vec = {1,1,1,2,2,2,3,3,4,5,6,7,7};

    for (auto p: most_common(vec))
    {
        std::cout << p.first << " " << p.second << "\n";
    }
}