#include <iostream>
#include <algorithm>
#include <cstdio>

using namespace std;

int n;

int first(char c, char *s)
{
    int l = n;

    for (int i=0; i<c; i++)
    {
        if (s[i]==c)
        {
            return i;
        }
    }

    return l;
}

int next(char c, int p, char *s)
{
    int l = n;

    for (int i=p+1; i<l; i+=2)
    {
        if (s[i]==c)
        {
            return i;
        }
    }

    return l;
}

int solve(char r, char *s)
{
    char b;
    if (r=='r')
    {
        b = 'b';
    }
    else
    {
        b = 'r';
    }

    char c[2] = {r,b};

    int l = n;
    
    int to_swap;

    int sum = 0;

    for (int i=0; i<l; i++)
    {
        if (s[i]!=c[i%2])
        {
            sum++;
            to_swap = next(c[i%2], i, s);
            if (to_swap<l)
            {
                swap(s[i], s[to_swap]);
            }
            else
            {
                s[i] = c[i%2];
            }
        }
    }


    return sum;
}

int main()
{
    cin >> n;

    char *s1 = new char[n];
    char *s2 = new char[n];
    cin >> s1;

    for (int i=0; i<n; i++)
    {
        s2[i] = s1[i];
    }


    int a = solve('r', s1);

    int b = solve('b', s2);
    
    if (a<b)
        cout << a << '\n';
    else
        cout << b << '\n';
}