#include <iostream>
#include <list>

using namespace std;

list <int> *tree;
list <int> neg;
bool *goal;
bool *init;
int n;
int count = 0;

void walk(int v, int parent, bool neg_me, bool neg_child)
{
    if (neg_me)
    {
        init[v] = !init[v];
    }
    if (init[v] != goal[v])
    {
        init[v] = !init[v];
        count++;
        neg.push_back(v);
        neg_me = !neg_me;
    }

    for (auto child : tree[v])
    {
        if (child != parent)
        {
            walk(child,v,neg_child,neg_me);
        }
    }
}

int main()
{
    cin >> n;
    int a,b;

    tree = new list<int>[n];
    goal = new bool[n];
    init = new bool[n];

    for (int i=1; i<n; i++)
    {
        cin >> a >> b;
        tree[a-1].push_back(b-1);
        tree[b-1].push_back(a-1);
    }

    for (int i=0; i<n; i++)
    {
        cin >> init[i];
    }

    for (int i=0; i<n; i++)
    {
        cin >> goal[i];
    }

    walk(0,-1,false, false);

    cout << count << "\n";

    for (auto v : neg)
    {
        cout << v+1 << '\n';
    }

}