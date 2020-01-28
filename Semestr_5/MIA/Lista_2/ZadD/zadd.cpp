#include <iostream>
#include <list>
#include <queue>
#include <set>

#define INF 0x3f3f3f3f

unsigned int parent(unsigned int i)
{
    return (i-1)/2;
}
unsigned int left(unsigned int i)
{
    return 2*i+1;
}
unsigned int right(unsigned int i)
{
    return 2*i+2;
}

int *d;
int *p;

class PQueue
{
    public:
    unsigned int max_size = 0;
    int *heap;
    int *place;
    
    unsigned int size = 0;

    void print()
    {
        std::cout << "heap: [";
        for (unsigned i=0; i<size; i++)
        {
            std::cout << heap[i] << ", ";
        }
        std::cout << "]\n";

        std::cout << "place: [";
        for (unsigned i=0; i<max_size; i++)
        {
            std::cout << place[i] << ", ";
        }
        std::cout << "]\n";
    }

    PQueue(int k)
    {
        max_size = k;
        heap = new int [max_size];
        place = new int [max_size];
        for (unsigned i=0; i<max_size; i++)
        {
            heap[i] = -1;
            place[i] = -1;
        }
        size = 0;
    }

    bool empty()
    {
        return size == 0;
    }

    void move_up(int i)
    {
        if (i>0 && d[heap[i]]<d[heap[parent(i)]])
        {
            std::swap(heap[i],heap[parent(i)]);
            std::swap(place[heap[i]],place[heap[parent(i)]]);
            move_up(parent(i));
        }
    }

    unsigned int min_index(unsigned i, unsigned j)
    {
        if (d[heap[j]]>d[heap[i]] || j>=size)
        {
            return i;
        }
        else
        {
            return j;
        }
    }

    void repair(int i)
    {
        if (left(i)<size)
        {
            int k = min_index(left(i),right(i));
            if (heap[k]>heap[i])
            {
                std::swap(heap[k],heap[i]);
                std::swap(place[heap[k]], place[heap[i]]);
                repair(k);
            }
        }
    }

    void push(int v)
    {
        place[v] = size;
        heap[size] = v;
        size++;

        move_up(size-1);
    }

    int pop()
    {
        int val = heap[0];
        place[val] = -1;
        size--;
        heap[0]=heap[size];
        place[heap[0]] = 0;
        heap[size]=-1;
        
        repair(0);
        return val;
    }

    void decrease_key(int v)
    {
        move_up(place[v]);
    }
};

struct Vertex
{
    int index;
    int distance;

    Vertex(int i, int dist)
    {
        index = i;
        distance = dist;
    }
};

void print_graph(std::list <Vertex> *graph, int n)
{
    for (int i=0; i<n; i++)
    {
        std::cout << i << ": ";
        for (auto v : graph[i])
        {
            std::cout << "(" << v.index << ", " << v.distance << "), ";
        } 
        std::cout << "\n";
    }
}


void Dijsktra(std::list <Vertex> *graph, int n, int s)
{
    for (int i=0; i<n; i++)
    {
        d[i] = INF;
        p[i] = -1;
    }
    d[s] = 0;

    PQueue Q(n);

    for (int i=0; i<n; i++)
    {
        Q.push(i);
    }

    //std::cout << "Q.size = " << Q.size << '\n';

    while (!Q.empty())
    {
        //Q.print();
        int v = Q.pop();

        for (auto u : graph[v])
        {
            if (d[u.index] > d[v]+u.distance)
            {
                d[u.index] = d[v]+u.distance;
                p[u.index] = v;
                if (Q.place[u.index]==-1)
                    Q.push(u.index);
                Q.decrease_key(u.index);
            }
        }
    }
}




void delete_edges(std::list <Vertex> *graph, int n, int s)
{
    for (int i=0; i<n; i++)
    {
        if (i!=s)
        {
            graph[i].remove_if([i](Vertex v){return v.index == p[i];});
        }
    }
}

void BFS(int v,std::list<Vertex> *graph, int *prev)
{
    std::queue<int> Q;

    Q.push(v);

    while (!Q.empty())
    {
        v = Q.front();
        Q.pop();
        for (auto u : graph[v])
        {
            if (prev[u.index]==-1)
            {
                prev[u.index]=v;
                Q.push(u.index);
            }
        }
    }
}

std::list <int> path;

bool repeat()
{
    std::set<int> temp;

    for (auto v : path)
    {
        if (temp.find(v)!=temp.end())
        {
            return true;
        }
    }

    return false;
}

int length(int *prev)
{
    path.push_front(1);
    int res = 1;
    int k = 1;
    while (k!=0)
    {
        k = prev[k];
        path.push_front(k);
        res++;
    }

    return res;
}

int main()
{
    int n,m;
    std::cin >> n >> m;

    int a,b,w;

    std::list <Vertex> *graph = new std::list<Vertex>[n];
    d = new int[n];
    p = new int[n];

    for (int i=0; i<m; i++)
    {
        std::cin >> a >> b >> w;
        graph[a].push_back(Vertex(b,w));
        graph[b].push_back(Vertex(a,w));
    }

    Dijsktra(graph,n,1);
    delete_edges(graph,n,1);

    int *prev = new int[n];

    for (int i=0; i<n; i++)
    {
        prev[i]=-1;
    }

    prev[0]==-2;

    BFS(0,graph,prev);

    if (prev[1]==-1)
    {
        std::cout << "impossible\n";
    }
    else if (repeat())
    {
        std::cout << "impossible\n";
    }
    else
    {
        std::cout << length(prev) << ' ';
        for (auto i : path)
        {
            std::cout << i << ' ';
        }

        std::cout << '\n';
    }

    return 0;
}