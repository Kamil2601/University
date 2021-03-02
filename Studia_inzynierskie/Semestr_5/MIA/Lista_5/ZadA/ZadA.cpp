#include <iostream>
#include <map>
#include <algorithm>
#include <utility>

using namespace std;

map <pair<long long int, long long int>, long long int> prize;

void update(long long int a, long long int b, long long int w)
{
    pair <long long int, long long int> e = make_pair(min(a,b), max(a,b));

    if (prize.find(e) != prize.end())
    {
        prize[e] += w;
    }
    else
    {
        prize[e] = w;
    }
}

void fee()
{
    long long int a, b, w;
    cin >> a >> b >> w;

    long long int last_b = b, last_a = a;

    while (b!=a)
    {
        if (a>b)
        {
            a/=2;
            update(a,last_a, w);
            last_a = a;
        }
        else
        {
            b/=2;
            update(b,last_b, w);
            last_b = b;
        }
    }
}

long long int cost(long long int a, long long int b)
{
    pair <long long int, long long int> e = make_pair(min(a,b), max(a,b));

    if (prize.find(e) != prize.end())
    {
        return prize[e];
    }
    else
    {
        return 0;
    }
}

void road()
{
    long long int a,b;
    long long int sum = 0;
    cin >> a >> b;

    long long int last_b = b, last_a = a;

    while (b!=a)
    {
        if (a>b)
        {
            a/=2;
            sum += cost(a, last_a);
            last_a = a;
        }
        else
        {
            b/=2;
            sum += cost(b, last_b);
            last_b = b;
        }
    }

    cout << sum << '\n';
}

int main()
{
    int q;
    int a,b;
    int event;
    cin >> q;

    for (int i=0; i<q; i++)
    {
        cin >> event;
        if (event == 1)
        {
            fee();
        }
        else
        {
            road();
        }
    }
}