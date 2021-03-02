#include <iostream>

using namespace std;

int main()
{
    int n,m;

    cin >> n >> m;

    int d = n/m;
    int mod = n%m;

    for (int i=0; i<mod; i++)
    {
        cout << d+1 << " ";
    }
    for (int i=0; i<m-mod; i++)
    {
        cout << d << " ";
    }
}