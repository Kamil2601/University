#include <iostream>
#include <algorithm>

#define ll long long int

using namespace std;

struct Point
{
    int x,y;
};

struct Rectangle
{
    Point top_left, bot_right;
};

Point top_left(int width, int height, int x1, int y1, int x2, int y2)
{
    Point top_left;

    if (x1 <= x2)
    {
        top_left.x = 1;
    }
    else
    {
        top_left.x = x1 - (x2 - 1);
    }

    if (y1 <= y2)
    {
        top_left.y = 1;
    }
    else
    {
        top_left.y = y1 - (y2 - 1);
    }

    return top_left;
}

Point bot_right(int width, int height, int x1, int y1, int x2, int y2)
{
    Point bot_right;

    if (x1 >= x2)
    {
        bot_right.x = width;
    }
    else
    {
        bot_right.x = x1 + (width - x2);
    }

    if (y1 >= y2)
    {
        bot_right.y = height;
    }
    else
    {
        bot_right.y = y1 + (height - y2);
    }

    return bot_right;
}

Rectangle rec(int width, int height, int x1, int y1, int x2, int y2)
{
    Point left = top_left(width, height, x1, y1, x2, y2);
    Point right = bot_right(width, height, x1, y1, x2, y2);

    Rectangle res{.top_left = left, .bot_right = right};

    return res;
}

void print_rec(Rectangle rec)
{
    cout << "[(" << rec.top_left.x << ", " << rec.top_left.y << "), ";
    cout << "(" << rec.bot_right.x << ", " << rec.bot_right.y << ")]\n";
}

ll common(Rectangle a, Rectangle b)
{
    Point left;
    Point right;

    if (a.top_left.x > b.top_left.x)
    {
        swap(a,b);
    }

    if (a.bot_right.x < b.top_left.x)
    {
        return 0;
    }
    else
    {
        left.x = b.top_left.x;
        right.x = a.bot_right.x;
    }

    if (a.top_left.y > b.top_left.y)
    {
        swap(a,b);
    }

    if (a.bot_right.y < b.top_left.y)
    {
        return 0;
    }
    else
    {
        left.y = b.top_left.y;
        right.y = a.bot_right.y;
    }

    return (ll)(right.x-left.x+1)*(ll)(right.y-left.y+1);
}

ll field(Rectangle rec)
{
    return (ll)(rec.bot_right.x-rec.top_left.x+1)*(ll)(rec.bot_right.y-rec.top_left.y+1);
}

void solve()
{
    int width, height;
    int x1, y1, x2, y2;

    cin >> width >> height >> x1 >> y1 >> x2 >> y2;

    Rectangle a = rec(width, height, x1, y1, x2, y2);
    Rectangle b = rec(width, height, x2, y2, x1, y1);

    ll result = (ll)width*(ll)height - (field(a)+field(b)-common(a,b));

    cout << result << '\n';
}

int main()
{
    int tests;

    cin >> tests;

    for (int i=0; i<tests; i++)
    {
        solve();
    }

}