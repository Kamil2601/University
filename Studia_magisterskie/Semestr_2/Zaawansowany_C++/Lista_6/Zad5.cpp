#include <iostream>
#include <list>

std::list<std::string> permute(std::string a, int l, int r)
{
    if (l == r)
    {
        // std::cout << a << "\n";
        return std::list<std::string> {a};
    }
    else
    {
        std::list<std::string> res;

        for (int i = l; i <= r; i++)
        {
            std::swap(a[l], a[i]);
 
            auto perms = permute(a, l+1, r);

            res.merge(perms);
 
            std::swap(a[l], a[i]);
        }

        return res;
    }
}

std::list<std::string> permute(std::string a)
{
    return permute(a, 0, a.size()-1);
}
 
int main()
{
    std::string str = "ABC";

    std::list<std::string> l = permute(str);

    std::cout << l.size() << "\n";

    for (auto s: l)
    {
        std::cout << s << "\n";
    }
}
 