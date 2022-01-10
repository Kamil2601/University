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

    if (href.size() > 6)
        return href.substr(6, href.size()-7);
    else return "";
}

void print_refs(std::string text)
{
    const static std::regex reg("<a[^>]+href=\"[^>]+>");

    std::smatch a_match;

    while (std::regex_search(text, a_match, reg))
    {
        auto link = get_href(a_match.str());

        std::cout << link << "\n";

        text = a_match.suffix();
    }
}

int main(int argc, char* argv[])
{
    // std::string html = "<p> <a href=\"www.facebook.com\"><a href=\"www.google.com\"></a>";


    // std::string x = "<a href=\"abc\">xdddd</a> <a name=\"xd\"></a>    <a href=\"test\"></a>";
    // print_refs(html);


    // std::cout << argv[1] << "\n";

    std::ifstream text_file;

    text_file.open(argv[1]);

    std::string line;

    std::string text;

    while (std::getline(text_file, line))
    {
        text += line;
    }

    print_refs(text);
}
