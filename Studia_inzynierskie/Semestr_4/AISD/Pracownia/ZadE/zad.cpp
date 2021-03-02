#include <cstdio>

struct Node
{
    int sum = 0;
    bool on_path = false;
    int index;
    int i=0;
    int n;
    Node *up = NULL;
    Node **child;
};

struct Edge
{
    int begin, end;
};


Node *tree;
Edge *edge;

bool simplify_tree(Node *root)
{
    if (root->n==0)
    {
        return true;
    }
    if (root->n==1)
    {
        if (simplify_tree(root->child[0]))
        {
            root->n = 0;
            delete [] root->child;
            root->child = NULL;
            return true;
        }
    }
    else
    {
        for (int i=0; i<root->n; i++)
        {
            simplify_tree(root->child[i]);
        }
        return false;
    }
    return false;
}


void count(Node *root)
{
    if (root->n==0)
    {
        root->sum = 1;
        root->on_path = false;
    }
    else
    {
        int count_false = 0;
        int s = 0;
        for (int i=0; i<root->n; i++)
        {
            count(root->child[i]);
            s += root->child[i]->sum;
            if (root->child[i]->on_path==false)
            {
                count_false++;
            }
        }
        if (count_false==0)
        {
            root->sum = s+1;
            root->on_path = false;
        }
        else if (count_false==1)
        {
            root->sum = s;
            root->on_path = false;
        }
        else
        {
            root->sum = s-1;
            root->on_path = true;
        }

    }
}

int main()
{
    int v_number;
    scanf("%d", &v_number);
    tree = new Node[v_number];
    edge = new Edge[v_number];
    int *count_child = new int[v_number];
    Node *root = &tree[0];
    int v1, v2;
    for (int i=0; i<v_number; i++)
    {
        tree[i].index=i;
    }
    for (int i=0; i<v_number-1; i++)
    {
        scanf("%d %d", &v1, &v2);
        edge[i].begin = v1-1;
        edge[i].end = v2 - 1;
        if (tree[edge[i].end].up != NULL)
        {
            tree[edge[i].begin].up = &tree[edge[i].end];
        }
        else
        {
            tree[edge[i].end].up = &tree[edge[i].begin];
        } 
    }
    

    for (int i=0; i<v_number; i++)
    {
        if (tree[i].up != NULL)
            count_child[tree[i].up->index]++;
        else
            root = &tree[i];
    }

    for (int i=0; i<v_number; i++)
    {
        tree[i].n = count_child[i];
        if (count_child[i]>0)
            tree[i].child = new Node*[count_child[i]];
    }

    for (int k=0; k<v_number; k++)
    {
        if (tree[k].up!=NULL)
        {
            tree[k].up->child[tree[k].up->i]=&tree[k];
            tree[k].up->i++;
        }
    }

    //simplify_tree(root);

    count(root);
    printf("%d\n", root->sum);
    return 0;
}