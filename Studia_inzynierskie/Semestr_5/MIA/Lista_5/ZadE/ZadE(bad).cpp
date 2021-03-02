#include <cstdio>
#include <algorithm>
#include <iostream>
#include <utility>

#define ll long long unsigned int

const int empty = 0;
const int part = 1;
const int full = 2;

// struct Query
// {
//     int mode;
//     ll left, right;
// };


struct Node
{
    ll min, max;
    int fill;
    Node *left,*right;

    void alloc_left()
    {
        this->left = new Node;
        left->min = this->min;
        left->max = (this->min+this->max)/2;
        left->left = NULL;
        left->right = NULL;
    }

    void alloc_right()
    {
        right = new Node;
        right->max = this->max;
        right->min = (this->min+this->max)/2+1;\
        right->left = NULL;
        right->right = NULL;
    }
};

void add(Node *tree, ll l, ll r)
{
    // printf("add %llu %llu\n", tree->min, tree->max);
    // printf("%llu %llu\n",l,r);
    if (tree->fill == full)
    {
        return;
    }
    
    if (tree->min == tree->max)
    {
        tree->fill = full;
        return;
    }

    if (l == tree->min && r == tree->max)
    {
        tree->fill = full;
        return;
    }

    else
    {
        if (tree->fill == empty)
        {
            if (tree->left == NULL)
            {
                tree->alloc_left();
            }
            tree->left->fill = empty;

            if (tree->right == NULL)
            {
                tree->alloc_right();
            }
            tree->left->fill = empty;

            tree->fill = part;
        }
        
        if (r<=tree->left->max)
        {
            add(tree->left, l, r);
        }
        else if (l>=tree->right->min)
        {
            add(tree->right, l, r);
        }
        else
        {   
            add(tree->left, l, tree->left->max);
            add(tree->right, tree->right->min, r);
        }

        if (tree->left->fill == full && tree->right->fill == full)
        {
            tree->fill = full;
        }
    }
}

void remove(Node *tree, int l, int r)
{
    if (tree->min == l && tree->max == r || tree->fill == empty)
    {
        tree->fill = empty;
        return;
    }
    if (tree->min == tree->max)
    {
        tree->fill = empty;
        return;
    }
    else
    {
        if (tree->fill == full)
        {
            if (tree->left == nullptr)
            {
                tree->alloc_left();
            }
            tree->left->fill = full;

            if (tree->right == nullptr)
            {
                tree->alloc_right();
            }
            tree->left->fill = full;

            tree->fill = part;
        }

        if (r<=tree->left->max)
        {
            remove(tree->left, l, r);
        }
        else if (l>=tree->right->min)
        {
            remove(tree->right, l, r);
        }
        else
        {   
            remove(tree->left, l, tree->left->max);
            remove(tree->right, tree->right->min, r);
        }

        if (tree->left->fill == empty && tree->right->fill == empty)
        {
            tree->fill = empty;
        }
    }
}

void invert(Node *tree, ll l, ll r)
{
    // printf("invert %llu %llu\n", tree->min, tree->max);
    if (tree->min == l && tree->max == r)
    {
        if (tree->fill == empty)
        {
            tree->fill = full;
            return;
        }
        else if (tree->fill == full)
        {
            tree->fill = empty;
            return;
        }        
    }
    

    if (tree->fill == empty || tree->fill == full)
    {
        if (tree->left == nullptr)
            tree->alloc_left();
        tree->left->fill = tree->fill;
        if (tree->right == nullptr)
            tree->alloc_right();
        tree->right->fill = tree->fill;
    }

    if (r <= tree->left->max)
    {
        invert(tree->left, l, r);
    }
    else if (l >= tree->right->min)
    {
        invert(tree->right, l, r);
    }
    else
    {
        invert(tree->left, l, tree->left->max);
        invert(tree->right, tree->right->min, r);
    }

    if (tree->left->fill == empty && tree->right->fill == empty)
    {
        tree->fill = empty;
    }
    else if (tree->left->fill == full && tree->right->fill == full)
    {
        tree->fill = full;
    }
    else
    {
        tree->fill = part;
    }
}

ll find_min(Node *tree)
{
    if (tree->fill == empty)
    {
        return tree->min;
    }
    else if (tree->fill == full)
    {
        return 0;
    }
    else
    {
        if (tree->left->fill == full)
        {
            return find_min(tree->right);
        }
        else
        {
            return find_min(tree->left);
        }
    }
}

// int find_leaf(Node *tree, ll val)
// {
//     //printf("find %llu %llu\n", tree->min, tree->max);
//     if (tree->min == tree->max == val)
//     {
//         return tree->fill;
//     }
//     if (tree->fill == full || tree->fill == empty)
//     {
//         //printf("xd %d\n",tree->fill);
//         return tree->fill;
//     }
//     else
//     {
//         if (val <= tree->left->max)
//         {
//             return find_leaf(tree->left, val);
//         }
//         else
//         {
//             return find_leaf(tree->right, val);
//         }
//     }
// }

// Node* bigger_tree(Node *tree)
// {
//     Node *res = new Node;
//     res->min = tree->min;
//     res->max = 2*(tree->max);
//     res->left = tree;
//     if (tree->fill == empty)
//     {
//         res->fill = empty;
//     }
//     else
//     {
//         res->fill = part;
//         res->alloc_right();
//     }

//     return res;
// }

int main()
{
    
    Node *tree = new Node;
    tree->min = 1;
    tree->fill = empty;

    int n;
    int f;
    ll l, r;
    std::cin >> n;

    tree->max = 8;


    for (int i=0; i<n; i++)
    {
        //scanf("%d %llu %llu", &f, &l, &r);
        std::cin >> f >> l >> r;
        // while (tree->max<r)
        // {
        //     tree = bigger_tree(tree);
        // }
        
        if (f==1) 
        {
            add(tree,l,r);
        }
        else if (f==2)
        {
            remove(tree,l,r);
        }
        else
        {
            invert(tree, l, r);
        }
        //printf("%llu\n",find_min(tree));
        std::cout << find_min(tree);
        // int xd = find_leaf(tree, 1);
        // printf("fill = %d\n",xd);
    }

    
}