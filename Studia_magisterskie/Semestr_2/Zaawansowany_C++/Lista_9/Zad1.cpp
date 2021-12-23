#include <iostream>
#include <regex>
#include <string>

bool is_time(std::string text)
{
    static const std::regex reg("(([0-1]\\d)|(2[0-3])):[0-5]\\d:([0-5]\\d)?");
    return std::regex_match(text, reg);
}


int main()
{
    // std::cout << is_time("12:34:45") << "\n";
    // std::cout << is_time("1e:34:45") << "\n";
    // std::cout << is_time("24:34:45") << "\n";
    // std::cout << is_time("12:34:68") << "\n";

    std::string text;

    while (true)
    {
        std::getline(std::cin, text);

        std::cout << is_time(text) << "\n";
    }
}