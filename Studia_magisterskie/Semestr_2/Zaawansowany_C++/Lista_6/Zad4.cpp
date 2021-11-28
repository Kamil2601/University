#include <iostream>
#include <map>
#include <string>
#include <numeric>
#include <algorithm>
#include <fstream>


class Task
{
    private:
    std::ifstream text_file;
    std::map<char, int> letter_count;

    void count_letters(std::string text)
    {
        char normalized_char;

        for (char c: text)
        {
            if (c >= 'a' && c <= 'z')
                normalized_char = c;
            else if (c >= 'A' && c <= 'Z')
                normalized_char = c + 32;
            else
                continue;

            if (letter_count.find(normalized_char) != letter_count.end())
                letter_count[normalized_char]++;
            else
                letter_count[normalized_char]=1;
        }
    }


    public:
    Task(std::string filename)
    {
        text_file.open(std::string(filename));
    }


    void count_letters()
    {
        std::string temp;

        if (text_file.is_open())
        {
            while (!text_file.eof())
            {
                text_file >> temp;
                count_letters(temp);
            }
        }
    }

    std::map<char, double> letter_freq()
    {
        std::map<char, double> res;

        auto add = [](int a, std::pair<char, int> b){
            return a + b.second;
        };

        int sum = std::accumulate(letter_count.begin(), letter_count.end(), 0, add);

        for (const auto &[c, n]: letter_count)
        {
            res[c] = (double)n/sum;
        }

        return res;
    }
};






int main(int argc, char *argv[])
{
    Task task = Task(std::string(argv[1]));

    task.count_letters();


    for (const auto &[c, n]: task.letter_freq())
    {
        std::cout << c << " " << n << "\n";
    }
}