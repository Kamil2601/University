#include <iostream>
#include <array>
#include <ctime>
#include <fstream>

const int n = 26;

double random_double()
{
    return static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
}

std::array<double, n> frequency_sum()
{
    static const double frequency[] = {0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04024, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.0236, 0.0015, 0.01974, 0.00074};

    std::array<double, n> res;
    double s = 0;

    for (int i=0; i<n; i++)
    {
        s += frequency[i];

        res[i] = s;
    }

    return res;
}

char random_letter()
{
    auto static const freq_sum = frequency_sum();

    float r = random_double();

    for (int i=0; i<n; i++)
    {
        if (r < freq_sum[i])
            return 'a' + i;
    }

    return 'z';
}

int word_length(double p, int attempts = 12)
{
    int res = 0;

    for (int i=0; i<attempts; i++)
    {
        if (random_double() < p)
            res++;
    }

    return res;
}

std::string random_word(int length)
{
    std::string res = "";

    for (int i=0; i<length; i++)
    {
        res += random_letter();
    }

    return res;
}

std::string random_text(int length)
{
    std::string res = "";

    while (res.length() < length)
    {
        int word_len = word_length(0.5);
        res += random_word(word_len) + " ";
    }

    res.resize(length);

    return res;
}


int main(int argc, char *argv[])
{
    srand (time(NULL));


    std::ofstream output_file(argv[2]);

    int len = std::stoi(argv[1]);

    output_file << random_text(len) << "\n";
}