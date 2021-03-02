#include <iostream>

using namespace std;

int main()
{
    int n[26] = {0};
    int count = 0;
    string s;

    cin >> s;

    for (char c : s)
    {
        n[c-'a']++;
    }

    for (int i=0; i<26; i++)
    {
        if (n[i]%2==1)
        {
            count++;
        }
    }

    if (count==0 || count%2==1)
    {
        cout << "First\n";
    }
    else
    {
        cout << "Second\n";
    }
}