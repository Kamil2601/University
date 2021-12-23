#include <iostream>
#include <regex>
#include <string>


bool is_town(std::string text)
{
    static const std::string segment = "([A-Z][a-z]+)";
    static const std::string reg_str = segment + "(((-)|(\\s+))" + segment + ")*";
    static const std::regex reg(reg_str);

    return std::regex_match(text, reg);
}

int main()
{
    // std::cout << is_town("Bielsko-Biala") << "\n";
    // std::cout << is_town("Wroclaw") << "\n";
    // std::cout << is_town("Ostrowiec Swietokrzyski") << "\n";
    // std::cout << is_town("Niepoprawna nazwa 12") << "\n";

    std::string text;

    while (true)
    {
        std::getline(std::cin, text);

        std::cout << is_town(text) << "\n";
    }
}