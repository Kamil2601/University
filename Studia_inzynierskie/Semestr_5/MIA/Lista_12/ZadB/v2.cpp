#include <iostream>
#include <queue>
#include <vector>
#include <cstring>
#include <iomanip>

using namespace std;

typedef long long ll;
const int N = 105;

int used[N];
vector<int> a[N];
ll c[2][N];
ll d[2][N]; 
int m, n;

void bfs(int id, int s)
{
    queue<int> q;
    d[id][s] = 0;
    c[id][s] = 1;
    memset(used, 0, sizeof(used));
    q.push(s);
    used[s] = 1;
    int u, v;
    while (!q.empty())
    {
        u = q.front();
        q.pop();
        for (int i = 0; i < a[u].size(); i++)
        {
            v = a[u][i];
            if (!used[v])
            {
                used[v] = 1;
                d[id][v] = d[id][u] + 1;
                c[id][v] = c[id][u];
                q.push(v);
            }
            else if (d[id][v] == d[id][u] + 1)
            {
                c[id][v] += c[id][u];
            }
        }
    }
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(0);
    cin >> n >> m;
    int u, v;
    for (int i = 0; i < m; i++)
    {
        cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
    }
    bfs(0, 1);
    bfs(1, n);
    double ans = 1.0;
    for (int i = 2; i < n; i++)
    {
        if (d[0][i] + d[1][i] == d[0][n])
        {
            ans = max(ans, 2.0 * (c[0][i] * c[1][i]) / c[0][n]);
        }
    }
    cout << setprecision(12) << fixed << ans << endl;
    return 0;
}