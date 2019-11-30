#include <iostream>
#include <vector>

using namespace std;

struct Node
{
    int index;
    bool cat;
    vector <Node*> child;
};

int paths(Node *v, Node *parent, int cats, int max_cats)
{
    int sum = 0;
    if (v->cat) cats++;
    else cats = 0;
    int n = v->child.size();
    if (cats<=max_cats)
    {
        if (n == 1 && v->child[0] == parent)
        {
            return 1;
        }
        for (int i=0; i<n; i++)
        {
            if (v->child[i] != parent)
            {
                sum += paths(v->child[i], v, cats, max_cats);
            }
        }
    }

    return sum;
}


int main()
{
    int n, cats;
    cin >> n >> cats;

    //cout << n << " " << cats << '\n';
    int a,b;
    Node *tree = new Node[n];
    Node *root = &(tree[0]);
    for (int i=0; i<n; i++)
    {
        tree[i].index = i;
        cin >> tree[i].cat;
    }

    for (int i=0; i<n-1; i++)
    {
        cin >> a >> b;
        tree[a-1].child.push_back(&(tree[b-1]));
        tree[b-1].child.push_back(&(tree[a-1]));
    }

    cout << paths(root,nullptr,0,cats) << '\n';
}