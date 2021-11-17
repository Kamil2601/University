#include <iostream>
#include <memory>

class Foo
{

};

int main()
{
    {
        std::cout << "Test 1\n";
        std::shared_ptr<Foo> sharedPtr = std::make_shared<Foo>();
        std::weak_ptr<Foo> weakPtr = sharedPtr;

        std::cout << weakPtr.expired() << "\n";

        sharedPtr = nullptr;

        std::cout << weakPtr.expired() << "\n\n";

    }

    {
        std::cout << "Test 2\n";
        std::weak_ptr<Foo> weakPtr = std::make_shared<Foo>();

        std::cout << weakPtr.expired() << "\n\n";

    }


    {
        std::cout << "Test 3\n";
        std::shared_ptr<Foo> sharedPtr1 = std::make_shared<Foo>();
        std::shared_ptr<Foo> sharedPtr2 = sharedPtr1;
        std::weak_ptr<Foo> weakPtr = sharedPtr1;

        std::cout << weakPtr.expired() << "\n";

        sharedPtr1 = nullptr;

        std::cout << weakPtr.expired() << "\n";

        sharedPtr2 = nullptr;

        std::cout << weakPtr.expired() << "\n\n";

    }
}