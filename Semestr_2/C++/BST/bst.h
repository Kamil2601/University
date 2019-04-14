#pragma once
#include <cstdlib>
#include <iostream>
#include <sstream>



using namespace std;

namespace struktury
{
    template <typename T>
    class Bst
    {
        class Node
        {
            public:
            T val;
            Node *left;
            Node *right;
        };

        Node *root;

        Node* merge_trees(Node *left, Node *right);

        Node* copy(Node* n);

        string make_out(Node* n);

        void del_node(Node *n);

        public:

        Bst(T obj);

        Bst();

        Bst(const Bst<T>& tree);

        Bst(Bst<T>&& tree);

        Bst(initializer_list<T>);

        ~Bst();

        Bst<T> &operator=(const Bst<T> &tree);

        Bst<T> &operator=(Bst<T> &&tree);

        bool empty();

        bool push(T obj);

        bool pop(T obj);

        bool search(T obj);

        friend ostream &operator<<(ostream &out, Bst<T> &t)
        {
            out << t.make_out(t.root);
            return out;
        }
    };

}