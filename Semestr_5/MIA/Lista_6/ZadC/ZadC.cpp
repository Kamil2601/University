#include <iostream>
#include <algorithm>

using namespace std;

const int a = 26;

string s,t;
int t_letters[5005][a];
int s_letters[5005][a];
int letters[a] = {0};

int main()
{
    cin >> s;
    cin >> t;

    int len = t.length();

    for (int i=0; i<len; i++)
    {
        letters[t[i]-'a']++;
        copy(letters, letters+a, t_letters[i]);
    }
}