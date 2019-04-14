#pragma once
#include <cstdlib>
#include <iostream>

using namespace std;
//namespace struktury
//{
    template <typename T>
    class Bst
    {
        
        class Node
        {
            T val;
            Node *left;
            Node *right;
        };

        Node *root;

        Node* merge_trees(Node *left, Node *right);

        Node* copy(Node* n);

        public:

        Bst(T obj);

        Bst();

        Bst(const Bst<T>& tree);

        bool empty();

        bool push(T obj);

        bool pop(T obj);

        bool search(T obj);
    };
//}