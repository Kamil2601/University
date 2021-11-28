#include <iostream>

void permute(std::string a, int l, int r)
{
    if (l == r)
    {
        std::cout << a << "\n";
    }
    else
    {
        for (int i = l; i <= r; i++)
        {
 
            std::swap(a[l], a[i]);
 
            permute(a, l+1, r);
 
            std::swap(a[l], a[i]);
        }
    }
}

void permute(std::string a)
{
    permute(a, 0, a.size()-1);
}
 
int main()
{
    std::string str = "ABCDE";
    permute(str);
    return 0;
}
 