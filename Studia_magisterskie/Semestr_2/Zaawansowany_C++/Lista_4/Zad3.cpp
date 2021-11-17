#include <iostream>
#include <functional>

template<typename Tf, typename Tg, typename T>
class InSequence
{
    private:
    Tf f;
    Tg g;


    public:
    InSequence(Tf f, Tg g)
    {
        this->f = f;
        this->g = g;
    }


    void operator()(T x)
    {
        f(x);
        g(x);
    }
};

template<typename Tf_out, typename Tg_out, typename T>
class InSequence2
{
    private:
    std::function<Tf_out(T)> f;
    std::function<Tg_out(T)> g;


    public:
    InSequence2(std::function<Tf_out(T)> f, std::function<Tg_out(T)> g)
    {
        this->f = f;
        this->g = g;
    }


    void operator()(T x)
    {
        f(x);
        g(x);
    }
};


int main()
{
    std::function<void(int)> f1 = [](int x) {
        std::cout << "f1: " << x << "\n";
    };

    std::function<void(int)> f2 = [](int x) {
        std::cout << "f2: " << x+1 << "\n";
    };

    std::function<bool(int)> f3 = [](int x) {
        std::cout << "f3: " << x+2 << "\n";
        return true;
    };

    auto g = InSequence<std::function<void(int)>, std::function<void(int)>, int>(f1,f2);

    g(0);

    std::cout << "\n";
    

    auto h = InSequence<std::function<void(int)>, std::function<bool(int)>, int>(g, f3);

    h(0);

    std::cout << "\n";

    auto g2 = InSequence2<void, void, int>(f1,f2);

    g2(0);

    std::cout << "\n";
    

    auto h2 = InSequence2<void, bool, int>(g, f3);

    h2(0);

}