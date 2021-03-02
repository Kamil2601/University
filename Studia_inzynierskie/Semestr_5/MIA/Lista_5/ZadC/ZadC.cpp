#include <iostream>
#include <string>
#include <cstdio>

using namespace std;

const int n = 27;

unsigned parent(unsigned i)
{
    return (i-1)/2;
}

unsigned left(unsigned i)
{
    return 2*i+1;
}

unsigned right(unsigned i)
{
    return 2*i+2;
}

struct Node
{
    unsigned first, last;
    unsigned chars[n] = {0};
};

Node *tree;
string s;
unsigned length;

void add_nodes(unsigned i, unsigned l, unsigned r)
{
    tree[i].first = tree[l].first;
    tree[i].last = tree[r].last;

    for (int j=0; j<n; j++)
    {
        tree[i].chars[j] = tree[l].chars[j] + tree[r].chars[j];
    }
}



unsigned result[n] = {0};

void print_result()
{
    for (int i=0; i<n; i++)
    {
        cout << (char)(i+'a') << ": " << result[i] << '\n';
    }
}

void reset()
{
    for (int i=0; i<n; i++)
    {
        result[i] = 0;
    }
}

int count()
{
    int res = 0;
    for (int i=0; i<n-1; i++)
    {
        if (result[i]>0)
        {
            res++;
        }
    }

    return res;
}

void add_node(unsigned i)
{
    for (int j=0; j<n; j++)
    {
        result[j] += tree[i].chars[j];
    }
}

void query(unsigned l, unsigned r, unsigned i = 0)
{
    if (l > r)
    {
        return;
    }
    else if (l == tree[i].first && r == tree[i].last)
    {
        add_node(i);
    }
    else if (l>=tree[right(i)].first)
    {
        query(l,r,right(i));
    }
    else if (r<=tree[left(i)].last)
    {
        query(l,r,left(i));
    }
    else
    {
        query(l, tree[left(i)].last, left(i)); 
        query(tree[right(i)].first, r, right(i));
    }
}

void inc(int i, char c)
{
    tree[i].chars[c-'a']++;
}

void dec(int i, char c)
{
    tree[i].chars[c-'a']--;
}

void update(unsigned pos, char c, char old)
{
    int i = 0;

    while(tree[i].first!=tree[i].last)
    {
        dec(i,old);
        inc(i, c);

        if (pos<=tree[left(i)].last)
        {
            i = left(i);
        }
        else
        {
            i = right(i);
        }
    }

    dec(i,old);
    inc(i, c);
    s[pos]=c;
}


int main()
{
    cin >> s;

    length = s.length();
    unsigned new_length = 1;

    while (new_length<length)
    {
        new_length*=2;
    }

    while (s.length()<new_length)
    {
        s.push_back('{');
    }

    length = new_length;

    unsigned size = 2*length-1;

    tree = new Node[size];

    for (int i=0; i<length; i++)
    {
        tree[length-1+i].chars[s[i]-'a']=1;
        tree[length-1+i].first = i;
        tree[length-1+i].last = i;
    }

    for (int i = length-2; i>=0; i--)
    {
        add_nodes(i, left(i), right(i));
    }

    int q;

    cin >> q;
    unsigned type, pos, left, right;
    char c;

    for (int i=0; i<q; i++)
    {
        cin >> type;
        if (type == 1)
        {
            cin >> pos >> c;
            update(pos-1, c, s[pos-1]);
        }
        else if (type == 2)
        {
            cin >> left >> right;
            reset();
            query(left-1, right-1);
            cout << count() << '\n';
        }
    }
}