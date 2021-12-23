#include <iostream>
#include <regex>
#include <string>
#include <fstream>

std::string get_href(std::string a)
{
    const static std::regex reg("href=\"[^\"]+\"");

    std::smatch href_match;

    std::regex_search(a, href_match, reg);

    auto href = href_match.str();

    return href.substr(6, href.size()-7);
}

void print_refs(std::string text)
{
    const static std::regex reg("<a[^>]+>");

    std::smatch a_match;

    while (std::regex_search(text, a_match, reg))
    {
        std::cout << get_href(a_match.str()) << "\n";

        text = a_match.suffix();
    }
}

int main(int argc, char* argv[])
{
    // std::string html = "<p> <a href=\"www.facebook.com\"><a href=\"www.google.com\"></a>";


    std::string x = "<a name=\"abc\">";
    print_refs(x);


    // std::cout << argv[1] << "\n";

    // std::ifstream text_file;

    // text_file.open(argv[1]);

    // std::string line;

    // // std::string text = text_file.read

    // while (std::getline(text_file, line))
    // {
    //     // std::cout << line << "\n";
    //     if (line.size() > 0)
    //         print_refs(line);
    // }
}
