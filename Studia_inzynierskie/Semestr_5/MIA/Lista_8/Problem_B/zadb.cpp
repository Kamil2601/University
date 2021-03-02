#include <iostream>
#include <cstring>
#include <algorithm>
#include <map>
#include <vector>

using namespace std;

bool cmp(char x, char y)
{
    return x>y;
}

int main()
{
    string s;

    cin >> s;

    int len = s.length();

    map <char,int> count;

    vector <char> chars;

    for (int i=0; i<len; i++)
    {
        if (count.find(s[i])!=count.end())
        {
            count[s[i]]++;
        }
        else
        {
            count[s[i]]=1;
        }
        
    }

    string sorted = s;
    sort(sorted.begin(),sorted.end(),cmp);

    chars.push_back(sorted[0]);

    for (int i=1; i<len; i++)
    {
        if (sorted[i]!=chars.back())
            chars.push_back(sorted[i]);
    }

    int k = 0;
    int cn = chars.size();

    string result = "";

    for (int i=0; i<len; i++)
    {
        if (s[i]==chars[k])
        {
            result += s[i];
        }

        count[s[i]]--;
        while (k<cn && count[chars[k]]==0) 
        {
            k++;
        }
        
    }

    cout << result << '\n';

    return 0;
}