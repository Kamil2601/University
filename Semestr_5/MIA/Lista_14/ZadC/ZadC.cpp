#include <cstdio>
#include <algorithm>
#include <string>
#include <iostream>
#include <vector>

using namespace std;

int n;
int res = 9999;
int cnt[1200];
vector<int> cardlist;
int bmap[5][5];

void Check(int bm)
{
    for (int i = 0; i < 5; ++i)
    {
        for (int j = 0; j < 5; ++j)
        {
            bmap[i][j] = 0;
        }
    }
    bool duplicate = false;
    int hints = 0;

    for (int k = 0; k < 10; ++k)
    {
        if (!(bm & (1 << k)))
            continue;
        hints++;
        for (int i = 0; i < 5; ++i)
        {
            if (k < 5)
            {
                bmap[k][i] |= (1 << k);
            }
            else
            {
                bmap[i][k - 5] |= (1 << k);
            }
        }
    }

    for (int i = 0; i < cardlist.size(); ++i)
    {
        int name = cardlist[i] / 10;
        int val = cardlist[i] % 10;
        cnt[bmap[name][val]]++;
        if (cnt[bmap[name][val]] > 1)
        {
            duplicate = true;
            break;
        }
    }

    for (int i = 0; i < cardlist.size(); ++i)
    {
        int name = cardlist[i] / 10;
        int val = cardlist[i] % 10;
        cnt[bmap[name][val]] = 0;
    }

    if (!duplicate)
    {
        res = min(hints, res);
    }
}

int main()
{
    cin >> n;
    string card;
    vector<string> temp;
    for (int i = 0; i < n; ++i)
    {
        cin >> card;
        temp.push_back(card);
    }
    sort(temp.begin(), temp.end());
    for (int i = 0; i < n; ++i)
    {
        if (i && temp[i - 1] == temp[i])
            continue;
        int name = -1;
        switch (temp[i][0])
        {
        case 'R':
            name = 0;
            break;
        case 'G':
            name = 1;
            break;
        case 'B':
            name = 2;
            break;
        case 'Y':
            name = 3;
            break;
        case 'W':
            name = 4;
            break;
        }
        cardlist.push_back(name * 10 + (temp[i][1] - '1'));
    }
    for (int i = 0; i < (1 << 10); ++i)
    {
        Check(i);
    }
    printf("%d\n", res);
    return 0;
}