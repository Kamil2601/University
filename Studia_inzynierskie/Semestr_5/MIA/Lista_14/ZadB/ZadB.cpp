#include <iostream>
#include <set>

using namespace std;
typedef long long ll;

set<int> s;

int n;

void dfs(int x,int y,ll ans)
{
	s.insert(ans);
	ll tx=10*ans+x;
	ll ty=10*ans+y;
	if(tx&&tx<=n)
	    dfs(x,y,tx);
	if(ty&&ty<=n)
	    dfs(x,y,ty);
}

int main()
{
    
    cin >> n;
    if (n<=101)
    {
        cout << n << "\n";
        return 0;
    }

    int count = 0;

    for (int i=0; i<10; i++)
    {
        for (int j=0; j<10; j++)
        {
            dfs(i,j,0);
        }
    }

    cout << s.size()-1 << '\n';

    return 0;
}