#include <iostream>
#include <string>
using namespace std;

int f(string s)
{
    cout << s << endl;
    int w;
    cin >> w;
    if (w == 0)
        exit(0);
    return w;
}

int main()
{
    const int N = 300;
    int st = f(string(N, 'a'));
    int n = 2 * N - (st + f(string(N, 'b')));
    string t(n, 'a');
    int A = N - st, B = n - A;
    st = B;
    for (int i = 0; i < n - 1; i++)
    {
        t[i] = 'b';
        if (f(t) > st)
            t[i] = 'a';
        else
            st--;
    }
    if (st)
        t.back() = 'b';
    f(t);
}