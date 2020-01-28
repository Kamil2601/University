#include <iostream>
#include <map>
#include <vector>
#include <list>

using namespace std; 

vector <list<int>> arr;
map <int, int> tree;
  
int main() 
{ 
    int n, a;

    cin >> n;

    for (int i=0; i<n; i++)
    {
        cin >> a;
        a = -a;
        auto it = tree.upper_bound(a);
        if (it != tree.end())
        {
            auto key = (*it).second;
            auto val = (*it).first;
            auto old = arr[key].back();
            arr[key].push_back(a);
            if (tree.find(old) != tree.end())
            {
                tree.erase(old);
            }
            tree[a] = key;
            
        }
        else
        {
            list <int> l;
            l.push_back(a);
            arr.push_back(l);
            tree.insert({a, arr.size()-1});
        }
    }

    for (auto l : arr)
    {
        for (auto a : l)
        {
            cout << -a << " ";
        }
        cout << "\n";
    }
}