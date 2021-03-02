#include <iostream>
#include <list>
#include <algorithm>

using namespace std;

int main()
{
    string s;
    int n;
    cin >> n;
    cin >> s;
    int l = s.length();
    int zeros = 0;
    int ones = 0;

    for (int i=0; i<l; i++)
    {
        if (s[i]=='0')
            zeros++;
        else
            ones++;        
    }

    int m;

    if (zeros<ones) m =zeros;
    else m = ones;

    cout << l-2*m << '\n';
}