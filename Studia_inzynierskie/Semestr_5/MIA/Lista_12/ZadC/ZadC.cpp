#include <cstdio>
#include <set>

struct Node
{
    Node *worse, *better;
    std::set<int> s;
};

Node **ptr;
Node *tree;

int n,m;
int **cmp;

int main()
{
    scanf("%d %d",&n,&m);
    tree = new Node;
    ptr = new Node*[n];
    cmp = new int*[n];
    for (int i=0; i<n; i++)
    {
        ptr[i] = tree;
        tree->s.insert(i);
        cmp[i] = new int[n];
    }

    int a,b;

    for (int k=1; k<=m; k++)
    {
        scanf("%d %d", &a, &b);
        a--; b--;
        cmp[a][b] = 1;
        cmp[b][a] = 2;
    }
}