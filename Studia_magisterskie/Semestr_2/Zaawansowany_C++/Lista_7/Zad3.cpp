#include <iostream>
#include <random>
#include <fstream>

int main(int argc, char *argv[])
{

    if (argc != 4)
    {
        std::cerr << "Invalid number of files specified (expecting 3)!"
                  << "\n";
        return 1;
    }

    std::mt19937 gen{std::random_device{}()};

    constexpr int count = 1000;

    std::ofstream uniform(argv[1]);
    std::ofstream binomial(argv[2]);
    std::ofstream normal(argv[3]);

    auto uniform_distr = std::uniform_real_distribution<double>{0, 100};
    auto binomial_distr = std::binomial_distribution<int>{100, 0.5};
    auto normal_distr = std::normal_distribution<double>{50, 5};

    for (int i = 0; i < count; i++)
    {
        uniform << uniform_distr(gen) << "\n";
        binomial << binomial_distr(gen) << "\n";
        normal << normal_distr(gen) << "\n";
    }

    return 0;
}