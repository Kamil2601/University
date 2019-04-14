#include "bst.h"

using namespace struktury;
using namespace std;

template <typename T>
Bst<T>::Bst(T obj)
{
    this->root = new Node;
    this->root->val = obj;
}

template <typename T>
Bst<T>::Bst()
{
}

template <typename T>
Bst<T>::Bst(const Bst &tree)
{
    this->root = copy(tree.root);
}

template <typename T>
Bst<T>::Bst(Bst &&tree)
{
    this->root = tree.root;
    tree.root = nullptr;
    delete tree;
}

template <typename T>
Bst<T> & Bst<T>::operator=(const Bst<T> &tree)
{
    del_node(this->root);
    this->root = copy(tree.root);
}

template <typename T>
Bst<T> & Bst<T>::operator=(Bst<T> &&tree)
{
    del_node(this->root);
    this->root = tree->root;
    tree->root = nullptr;
    delete tree;
}

template <typename T>
Bst<T>::Bst(initializer_list<T> l)
{
    for (auto &x : l)
    {
        this->push(x);
    }
}

template <typename T>
Bst<T>::~Bst()
{
    del_node(this->root);
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
    return new_node;
}

template <typename T>
bool Bst<T>::empty()
{
    return this->root == nullptr;
}

template <typename T>
void Bst<T>::del_node(Node *n)
{
    if (n!=nullptr)
    {
        del_node(n->left);
        del_node(n->right);
        delete n;
        n = nullptr;
    }
}

template <typename T>
bool Bst<T>::push(T obj)
{
    Node *new_node = new Node;
    new_node->val = obj;

    if (empty())
    {
        this->root = new_node;
        return true;
    }
    else
    {
        Node *temp = this->root;
        while (true)
        {
            if (temp->val == obj)
            {
                delete new_node;
                return false;    
            }
            else if (temp->val < obj)
            {
                if (temp->right == nullptr)
                {
                    temp->right = new_node;
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
                    temp->left = new_node;
                    return true;
                }
                else
                {
                    temp = temp->left;
                }
            }
        }

        return false;
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
        return right;
    }

}

template <typename T>
bool Bst<T>::pop(T obj)
{
    if (this->root==nullptr)
    {
        return false;
    }
    Node *temp = this->root;
    if (this->root->val == obj)
    {
        this->root = merge_trees(this->root->left, this->root->right);
        delete temp;
        return true;
    }

    
    while (temp!=nullptr)
    {
        if (obj < temp->val)
        {
            //cout << "obj<val" << endl;
            if (temp->left!=nullptr && temp->left->val == obj)
            { 
                Node *temp2 = temp->left;
                temp->left = merge_trees(temp->left->left, temp->left->right);
                delete temp2;
                return true;
            }
            else if (temp->left!=nullptr)
            {
                temp = temp->left;
            }
            else
            {
                return false;
            }
        }
        else
        {
            //cout << "obj>val" << endl;
            if (temp->right!=nullptr && temp->right->val == obj)
            {                               
                Node *temp2 = temp->right;
                temp->right = merge_trees(temp->right->left, temp->right->right);
                delete temp2;   
                return true;
                
            }
            else if (temp->right!=nullptr)
            {
                temp = temp->right;
            }
            else
            {
                return false;
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

template <typename T>
string Bst<T>::make_out(Node* n)
{   
    string res = "";
    if (n!=nullptr)
    {
        res = make_out(n->left);
        res += to_string(n->val) + " ";
        res += make_out(n->right);
    }

    return res;
}

/*template <typename T>
ostream &operator<< (ostream &out, const Bst<T> &t)
{
    out << make_out(t.root);
    return out;
}*/