#include <iostream>
#include <utility>
#include <string>

template <
    typename From,
    typename To,
    typename std::enable_if_t<
        std::is_pointer<From>::value
    >* = nullptr,
    typename std::enable_if_t<
        std::is_convertible<
            typename std::remove_pointer<From>::type,
            To
        >::value
    >* = nullptr
>
void move_from_to(From from, To& to) {
    to = (To)std::move(*from);
    std::cout << "Used pointer version" << std::endl;
}

template <
    typename From, 
    typename To,
    typename std::enable_if_t<
        std::is_convertible<From, To>::value
    >* = nullptr
>
void move_from_to(From& from, To& to) {
    to = (To)(std::move(from));
    std::cout << "Used normal version" << std::endl;
}

int main()
{
    int x = 17;
    int y;

    move_from_to(x, y);

    std::cout << x << " " << y << "\n";

    std::string a = "abcd";
    std::string b;

    move_from_to(a, b);
    std::cout << a << " " << b << "\n";

    int *p = new int(5);

    std::cout << *p << "\n";


    move_from_to(p, y);

    std::cout << *p << " " << y << "\n";
}
