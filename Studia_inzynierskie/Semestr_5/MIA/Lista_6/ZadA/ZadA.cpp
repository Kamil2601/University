#include <iostream>

using namespace std;

long int fib(int n)
{
    const long int m = 1000000007;
    long int a=1,b=2,c;

    for (int i=0; i<n; i++)
    {
        c = (a+b)%m;
        a = b;
        b = c;
    }

    return a;
}

int main()
{
    int n;

    cin >> n;

    cout << fib(n+1)-2 << '\n';
}