#include <iostream>

int main()
{
    std::string address = R"(Instytut Informatyki Uniwersytetu Wrocławskiego
Fryderyka Joliot-Curie 15
50-383 Wrocław)";

    std::string windows = R"(C:\Program Files)";

    std::string quote = R"qwe("test("\n" ()")))qwe";


    std::cout << address << "\n" << windows << "\n" << quote << "\n";

    return 0;
}