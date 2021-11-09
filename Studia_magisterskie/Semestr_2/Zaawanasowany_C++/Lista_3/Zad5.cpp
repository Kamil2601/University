#include <iostream>
#include <array>
#include <random>
#include <iomanip>
#include <chrono>
#include <vector>

double rand_double()
{
    static std::mt19937 gen{std::random_device()()};
    return std::uniform_real_distribution<double>(0.5, 2.0)(gen);
}

template <int N>
class Matrix
{
    double *arr;

public:
    Matrix() : arr(new double[N * N])
    {
        for (size_t row = 0; row < N; row++)
        {
            for (size_t col = 0; col < N; col++)
            {
                this->arr[row * N + col] = rand_double();
            }
        }
    }

    void square()
    {
        auto res = new double[N * N];

        for (size_t i = 0; i < N; i++)
        {
            for (size_t j = 0; j < N; j++)
            {
                res[i * N + j] = 0.0;
                for (size_t k = 0; k < N; k++)
                {
                    res[i * N + j] += arr[i * N + k] * arr[k * N + j];
                }
            }
        }

        delete[] this->arr;
        this->arr = res;
    }
};

template <int N>
void measure(Matrix<N> &m, size_t iterations)
{
    using namespace std::chrono;

    auto t0 = high_resolution_clock::now();

    for (size_t i = 0; i < iterations; i++)
    {
        m.square();
    }

    auto t1 = high_resolution_clock::now();

    duration<double> time_span = duration_cast<duration<double>>(
        (t1 - t0) / iterations);

    std::cout << "size: " << N
              << "\ntime: " << time_span.count()
              << " seconds.\n\n";
}

int main()
{
    Matrix<10> m10;
    measure(m10, 10000);
    
    Matrix<100> m100;
    measure(m100, 100);
    
    Matrix<1000> m1000;
    measure(m1000, 1);

    // Matrix<10000> m10000;
    // measure(m10000, 1);
}