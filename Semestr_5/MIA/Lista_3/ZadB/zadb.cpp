#include <iostream>
#include <queue>

using namespace std;

char *wall[2];
int *visited[2];
int n,k;

queue <pair<int,int>> q;

void BFS(int w, int l)
{
    if (visited[w][l]<=l)
    {
        pair<int,int> next[3] = {make_pair(w,l+1),make_pair(w,l-1),make_pair((w+1)%2,l+k)};
        
        for (auto place : next)
        {
            int nw = place.first;
            int nl = place.second;
            if (nl > 0 && nl < n)
            {
                if (visited[nw][nl]==-1 && wall[nw][nl]=='-')
                {
                    visited[nw][nl] = visited[w][l]+1;
                    q.push(place);
                }
            }
        }
    }

    if (!q.empty())
    {
        auto p = q.front();
        q.pop();
        BFS(p.first,p.second);
    }
}

void print_result()
{
    for (int i=n-1; i>=n-k; i--)
    {
        for (int j=0; j<2; j++)
        {
            if (visited[j][i]<=i && visited[j][i]>=0)
            {
                cout << "YES\n";
                return;
            }
        }
    }

    cout << "NO\n";
    return;
}

int main()
{
    cin >> n >> k;

    wall[0] = new char[n];
    wall[1] = new char[n];
    visited[0] = new int[n];
    visited[1] = new int[n];

    cin >> wall[0] >> wall[1];

    //cout << wall[0] << '\n' << wall[1] << '\n';

    for (int i=0; i<n; i++)
    {
        visited[0][i] = -1;
        visited[1][i] = -1;
    }

    visited[0][0]=0;

    BFS(0,0);
    // for (int w=0; w<2; w++)
    // {
    //     for (int i=0; i<n; i++)
    //     {
    //         cout << visited[w][i] << ' ';
    //     }
    //     cout << '\n';
    // }

    print_result();
}