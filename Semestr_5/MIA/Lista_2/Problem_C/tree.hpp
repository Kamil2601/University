struct node
{
    long long key;
    node *left;
    node *right;
};

void insert(long long key, node *tree)
{
    if (tree == nullptr)
    {
        tree = new node;
        tree -> left = nullptr;
        tree -> right = nullptr;
        tree -> key = key;
    }
    else if (key > tree->key)
    {
        if (tree -> right == nullptr)
        {
            tree -> right = new node;
            tree -> right -> right = nullptr;
            tree -> right -> left = nullptr;
            tree -> right -> key = key;
        }
        else
        {
            insert(key, tree->right);
        }
        
    }
    else if (key < tree->key)
    {
        if (tree -> left == nullptr)
        {
            tree -> left = new node;
            tree -> left -> right = nullptr;
            tree -> left -> left = nullptr;
            tree -> left -> key = key;
        }
        else
        {
            insert(key, tree->left);
        }
        
    }
}

long long count_nodes(node *tree)
{
    if (tree == nullptr) return 0;
    return 1+count_nodes(tree->left)+count_nodes(tree->right);
}