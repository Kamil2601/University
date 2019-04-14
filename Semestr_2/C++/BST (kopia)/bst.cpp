#include "bst.h"

//using namespace struktury;

template <typename T>
Bst<T>::Bst(T obj)
{
    this->root = new Node;
    this->root->val = obj;
}

template <typename T>
Bst<T>::Bst()
{
    this->root = new Node;
}

template <typename T>
Bst<T>::Bst(const Bst &tree)
{
    this->root = copy(tree->root);
}

template <typename T>
typename Bst<T>::Node* Bst<T>::copy(Bst<T>::Node* n)
{
    Bst<T>::Node* new_node = nullptr;
    if (n!=nullptr)
    {
        new_node = new Node;
        new_node->val = n->val;
        new_node->left = copy(n->left);
        new_node->right = copy(n->right);
    }
}

template <typename T>
bool Bst<T>::empty()
{
    return this->root == nullptr;
}

template <typename T>
bool Bst<T>::push(T obj)
{
    Node *new_node = new Node;
    new_node->val = obj;

    if (empty())
    {
        this->root = &new_node;
    }
    else
    {
        Node *temp = this->root;
        while (true)
        {
            if (temp->val == obj)
            {
                return false;
            }
            else if (temp->val < obj)
            {
                if (temp->right == nullptr)
                {
                    temp->right = &new_node;
                    return true;
                }
                else
                {
                    temp = temp->right;
                }
            }
            else
            {
                if (temp->left == nullptr)
                {
                    temp->left = &new_node;
                    return true;
                }
                else
                {
                    temp = temp->left;
                }
            }
        }
    }
}

template <typename T>
typename Bst<T>::Node* Bst<T>::merge_trees(Node *left, Node *right)
{
    if (left==nullptr)
    {
        return right;
    }
    else if (right == nullptr)
    {
        return left;
    }
    else
    {
        right->left = merge_trees(left,right->left);
    }
}

template <typename T>
bool Bst<T>::pop(T obj)
{
    if (this->root==nullptr)
    {
        return false;
    }
    else if (this->root->val == obj)
    {
        delete this->root;
        return true;
    }

    Node *temp = this->root;
    
    while (temp!=nullptr)
    {
        if (obj < temp->val)
        {
            if (temp->left == obj)
            { 
                Node *temp2 = temp->left;
                temp->left = merge_trees(temp->left->left, temp->left->right);
                delete temp2;
                return true;
            }
            else
            {
                temp = temp->left;
            }
        }
        else
        {
            if (temp->right == obj)
            {               
                Node *temp2 = temp->right;
                temp->right = merge_trees(temp->right->left, temp->right->right);
                delete temp2;   
                return true;
            }
            else
            {
                temp = temp->right;
            }
        }
    }

    return false;
}

template <typename T>
bool Bst<T>::search(T obj)
{
    Node *temp = this->root;
    
    while (temp!=nullptr)
    {
        if (temp->val == obj)
        {
            return true;
        }
        else if (obj > temp->val)
        {
            temp = temp->right;
        }
        else
        {
            temp = temp->left;
        }
    }

    return false;
}