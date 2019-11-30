#include <iostream>
#include <list>
#include <utility>
#include <vector>

using namespace std;

int n;
list <int> *tree;
list<pair<int,int>> result;

int walk(int v, int p)
{
    if (tree[v].size()>2)
    {
        return -1;
    }
    else if (tree[v].size()==1)
    {
        return v;
    }
    else
    {
        for (int u : tree[v])
        {
            if (u!=p)
            {
                return walk(u,v);
            }
        }
    }
}

bool start(int v)
{
    for (auto u : tree[v])
    {
        int res = walk(u,v);
        if (res==-1)
        {
            cout << "No\n";
            return false;
        }
        else
        {
            result.push_back(make_pair(v,res));
        }
        
    }

    return true;
}

bool solve()
{
    for (int i=0; i<n; i++)
    {
        if (tree[i].size()>2)
        {
            return start(i);
        }
    }

    vector<int> res;

    for (int i=0; i<n; i++)
    {
        if (tree[i].size()==1)
        {
            res.push_back(i);
        }
    }

    cout << "Yes\n1\n" << res[0]+1 << " " << res[1]+1 << "\n";

    return false; 
}

int main()
{
    cin >> n;
    int a,b;

    tree = new list<int>[n];

    for (int i=1; i<n; i++)
    {
        cin >> a >> b;
        tree[a-1].push_back(b-1);
        tree[b-1].push_back(a-1);
    }

    if (solve())
    {
        int s = result.size();
        cout << "Yes\n" << s << "\n";

        for (auto x : result)
        {
            cout << x.first+1 << " " << x.second+1 << '\n';
        }    
    }
}