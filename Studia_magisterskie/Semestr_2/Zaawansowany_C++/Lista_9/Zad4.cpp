#include <iostream>
#include <regex>
#include <string>

bool is_complex(std::string text)
{
    static const std::regex reg("[(](\\d)+([.](\\d)+)?([+]|[-])(\\d)+([.](\\d)+)?(i|I)[)]");

    return std::regex_match(text, reg);
}


int main()
{
    // std::cout << is_complex("123.456-12.34") << "\n";

    std::string text;

    while (true)
    {
        std::getline(std::cin, text);

        std::cout << is_complex(text) << "\n";
    }
}