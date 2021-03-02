#include <iostream>
#include <vector>

using namespace std;

int n;

vector<int> *tree;

bool leaf(int i)
{
    return tree[i].empty();
}

bool three_childs(int i)
{
    int count = 0;

    for (auto child : tree[i])
    {
        if (leaf(child))
            count++;
    }

    return count >= 3;
}

void solve()
{
    for(int i=0; i<n; i++)
    {
        if (!(leaf(i) || three_childs(i)))
        {
            cout << "NO\n";
            return;
        }
    }

    cout << "YES\n";
    return;
}


int main()
{
    cin >> n;

    int p;

    tree = new vector<int>[n];

    for (int i=1; i<n; i++)
    {
        cin >> p;
        tree[p-1].push_back(i);
    }

    solve();

    return 0;
}