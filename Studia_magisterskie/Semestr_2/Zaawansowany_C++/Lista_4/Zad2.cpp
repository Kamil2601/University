#include <iostream>
#include <functional>
#include <cmath>

template<typename In, typename G_out, typename H_out, typename F_out>
class Compose
{
    private:
    std::function<F_out(G_out, H_out)> f;
    std::function<G_out(In)> g;
    std::function<H_out(In)> h;
    
    public:

    Compose(std::function<F_out(G_out, H_out)> f, std::function<G_out(In)> g, std::function<H_out(In)> h)
    {
        this->f = f;
        this->g = g;
        this->h = h;
    }

    F_out operator()(In x)
    {
        return f(g(x), h(x));
    }
};

int main()
{
    auto f = [](double x, double y) {
        return x+y;
    };

    auto g = [](double x) {
        return x*x;
    };

    auto h = [](double x) {
        return x*x*x;
    };

    Compose<double, double, double, double> composed(f, g, h);

    for (int i=0; i<5; i++)
    {
        std::cout << composed(i) << "\n";
    }
}