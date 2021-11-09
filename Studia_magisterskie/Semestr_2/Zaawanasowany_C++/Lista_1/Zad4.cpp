#include <iostream>

enum class name: uint16_t
{
    Kamil,
    Andrzej,
    Karolina,
    Agata
};

std::string nameToString(name name)
{
    switch (name)
    {
        case name::Kamil: return "Kamil";
        case name::Andrzej: return "Andrzej";
        case name::Karolina: return "Karolina";
        case name::Agata: return "Agata";
    }

    return "";
}

void printMessage(const std::string& msg, name name)
{
    std::cout << msg + " " + nameToString(name) + "\n";
}

int main()
{
    printMessage("Cześć", name::Andrzej);

    return 0;
}