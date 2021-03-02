#include <cstdio>
#include <vector>
#include <queue>
#include <list>

using namespace std;

#define ll long long int

vector <int> *graph;
list <int> *p;
ll *paths1;
ll *pathsn;
int *dist;
int n,m;

void fill_arr(ll *arr, int k)
{
    for (int i=0; i<n; i++)
        arr[i] = k;
}

void fill_arr(int *arr, int k)
{
    for (int i=0; i<n; i++)
        arr[i] = k;
}

void clear_list()
{
    for (int i=0; i<n; i++)
    {
        p[i].clear();
    }
}

void print_p()
{
    for (int i=0; i<n; i++)
    {
        printf("p[%d] = [", i+1);
        for (int u : p[i])
        {
            printf("%d, ", u+1);
        }
        printf("]\n");
    }
}

void print_arr(int *a)
{
    for (int i=0; i<n; i++)
    {
        printf("%d : %d\n", i+1, a[i]);
    }
}

void print_arr(ll *a)
{
    for (int i=0; i<n; i++)
    {
        printf("%d : %lld\n", i+1, a[i]);
    }
}


void bfs(int from)
{
    queue<int> q;
    q.push(from);
    fill_arr(dist, -1);
    dist[from] = 0;
    int v;
    int v_dist;

    while (!q.empty())
    {
        v = q.front();
        q.pop();
        v_dist = dist[v];

        for (int u : graph[v])
        {
            if (dist[u]==-1)
            {
                dist[u] = dist[v]+1;
                p[u].push_back(v);
                q.push(u);
            }
            else if (dist[u] == dist[v]+1)
            {
                p[u].push_back(v);
            }
        }
    }
}

void count_paths(int v, ll *paths, int last)
{
    if (paths[v]!=0)
    {
        return;
    }
    else if(v==last)
    {
        paths[v] = 1;
        return;
    }
    else
    {
        for (int u : p[v])
        {
            count_paths(u, paths, last);
        }
        ll sum = 0;
        for (int u : p[v])
        {   
            sum+=paths[u];
        }
        paths[v] = sum;
        return;
    }
}

int main()
{
    scanf("%d %d",&n,&m);
    graph = new vector<int>[n];
    int x,y;
    dist = new int[n];
    p = new list<int>[n];
    paths1 = new ll[n];
    pathsn = new ll[n];

    for (int i=0; i<m; i++)
    {
        scanf("%d %d",&x, &y);
        graph[x-1].push_back(y-1);
        graph[y-1].push_back(x-1);
    }

    bfs(0);
    fill_arr(paths1, 0);

    count_paths(n-1, paths1, 0);

    fill_arr(dist, -1);
    clear_list();

    bfs(n-1);

    //print_p();

    fill_arr(pathsn, 0);

    count_paths(0, pathsn, n-1);

    //print_arr(pathsn);

    int best = paths1[n-1];
    int all_paths = best;
    int temp;

    for (int i=1; i<n-1; i++)
    {
        temp = 2*paths1[i]*pathsn[i];
        if (temp>best)
            best = temp;
    }

    double res = (double)best/(double)all_paths;

    printf("%.10f\n", res);

    return 0;
}