#include <iostream>
#include <regex>
#include <string>


bool is_date(std::string text)
{
    static const std::string february = "(([0-1]\\d)|(2[0-8]))-02";
    static const std::string longer_months = "(([0-2]\\d)|(3[0-1]))-(01|03|05|07|08|10|12)";
    static const std::string shorter_months = "(([0-2]\\d)|30)-(04|06|10|11)";

    static const std::string reg_str = "((" + february + ")|(" + longer_months + ")|(" + shorter_months + "))-\\d{4}";
    static const std::regex reg(reg_str);

    return std::regex_match(text, reg);
}

int main()
{
    // std::cout << is_date("01-12-2020") << "\n";

    std::string text;

    while (true)
    {
        std::getline(std::cin, text);

        std::cout << is_date(text) << "\n";
    }
}