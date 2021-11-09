#include <iostream>
#include <set>

using stringSet = std::set<std::string>;

int main()
{
    stringSet strs{"abc", "123", R"(\n)", "c++"};

    for (auto str : strs)
        std::cout << str << "\n";
    
    return 0;
}