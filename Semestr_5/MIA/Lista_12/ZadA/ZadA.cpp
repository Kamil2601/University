#include <iostream>
#include <vector>

using namespace std;

struct Edge
{
    int u;
    int color;
};

int n,m;
int max_color = 0;

vector<Edge> *graph;

bool *visited;

void DFS(int v, int end, int color)
{
    visited[v] = true;

    if (v==end)
    {
        return;
    }

    for (Edge e : graph[v])
    {
        if (e.color == color && !visited[e.u])
        {
            DFS(e.u, end, color);
        }
    }
}


void solve(int a, int b)
{
    int sum = 0;
    
    for (int i=1; i<=max_color; i++)
    {
        for (int j=0; j<n; j++)
        {
            visited[j] = false;
        }

        
        DFS(a,b,i);

        if (visited[b])
        {
            sum+=1;
        }
    }

    cout << sum << '\n';
}

int main()
{
    cin >> n >> m;

    graph = new vector<Edge>[n];
    visited = new bool[n];

    int a,b,c;

    for (int i=0; i<m; i++)
    {
        cin >> a >> b >> c;

        if (c>max_color)
        {
            max_color = c;
        }

        graph[a-1].push_back(Edge{.u = b-1, .color = c});
        graph[b-1].push_back(Edge{.u = a-1, .color = c});
    }

    int queries;

    cin >> queries;

    for (int i=0; i<queries; i++)
    {
        cin >> a >> b;
        solve(a-1,b-1);
    }
    
    return 0;
}