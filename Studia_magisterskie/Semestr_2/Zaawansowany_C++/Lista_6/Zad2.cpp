#include <iostream>
#include <list>
#include <ctime>
#include <algorithm>

class Point
{
public:
    std::string name;
    double x, y;
    u_int8_t r, g, b;

    Point(std::string name, double x, double y, u_int8_t r, uint8_t g, uint8_t b)
    {
        this->name = name;
        this->x = x;
        this->y = y;
        this->r = r;
        this->g = g;
        this->b = b;
    }

    std::string to_string()
    {
        return name + " (" + std::to_string(x) + ", " + std::to_string(y) + ") [" + std::to_string(r) + ", " + std::to_string(g) + ", " + std::to_string(b) + "]";
    }

    int brightness()
    {
        return 0.3 * r + 0.59 * g + 0.11 * b;
    };
};

void test(std::list<int> &l)
{
    l.remove_if([](int x)
                { return x > 5; });
}

uint8_t random_color()
{
    return rand() % 256;
}

double random_double()
{
    int integral = rand() % 20 - 10;
    double fract = (double)(rand() % 10) / 10.0;

    return (double)integral + fract;
}

std::string random_name()
{
    int length = rand() % 10 + 2;
    std::string res;

    for (int i = 0; i < length; i++)
    {
        char c = rand() % 26 + 'a';
        res += c;
    }

    return res;
}

Point random_point()
{
    return Point(random_name(), random_double(), random_double(), random_color(), random_color(), random_color());
}

int quarter(Point p)
{
    if (p.x < 0)
    {
        return p.y < 0 ? 3 : 4;
    }
    else
    {
        return p.y < 0 ? 2 : 1;
    }
}

std::list<Point> init(int n = 17)
{
    std::list<Point> res;

    for (int i = 0; i < n; i++)
    {
        res.push_back(random_point());
    }

    return res;
}

std::vector<int> quarters_count(std::list<Point> points)
{
    std::vector<int> res = {0, 0, 0, 0};

    for (auto p: points)
    {
        res[quarter(p)-1]++;
    }

    return res;
}

int main()
{
    srand(time(NULL));

    auto points = init();

    auto copy(points);

    for (auto p : points)
    {
        std::cout << p.to_string() << "\n";
    }

    std::cout << "\n";

    std::cout << copy.size() << "\n";

    // auto small_end = std::remove_if(copy.begin(), copy.end(), [](Point p){ return p.name.length() > 5; });
    copy.remove_if([](Point p)
                   { return p.name.length() > 5; });
    std::cout << copy.size() << "\n";

    for (auto p : copy)
    {
        std::cout << p.to_string() << "\n";
    }

    auto quarters = quarters_count(points);

    for (int i=0; i<4; i++)
    {
        std::cout << quarters[i] << " ";
    }
    std::cout << "\n";

    

    auto bright_cmp = [](Point a, Point b) {
        return a.brightness() < b.brightness();
    };

    copy = std::list<Point>(points);

    copy.sort(bright_cmp); 

    for (auto p : copy)
    {
        std::cout << p.to_string() << " " << p.brightness() << "\n";
    }

    std::cout << "\n";

    auto dark = std::list<Point>(points); //.remove_if([](Point p){p.brightness() >= 64;});
    dark.remove_if([](Point p){ return p.brightness() >= 64; });

    for (auto p : dark)
    {
        std::cout << p.to_string() << " " << p.brightness() << "\n";
    }
    std::cout << dark.size() << "\n";
}