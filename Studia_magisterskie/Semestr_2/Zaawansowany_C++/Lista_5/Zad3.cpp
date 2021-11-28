#include <iostream>
#include <list>
#include <vector>
#include <map>
#include <list>
#include <queue>


class Graph
{
    struct Edge
    {
        int to;
        float weight;

        Edge(int to, float weight)
        {
            this->to = to;
            this->weight = weight;
        }
    };

    std::map<int, std::list<Edge>> vertices;

    public:
    void print()
    {
        for (auto & [v, edges] : vertices)
        {
            std::cout << v << ": ";
            for (auto edge: edges)
            {
                std::cout << "(" << edge.to << "," << edge.weight << "), ";
            }

            std::cout << "\n";
        }
    }

    int add_vertex()
    {
        int new_id = 0;

        if (!vertices.empty())
        {
            new_id = (--vertices.end())->first + 1;
        }

        vertices[new_id] = {};

        return new_id;
    }

    void remove_vertex(int id)
    {
        vertices.erase(id);

        for (auto & [v, edges] : vertices)
        {
            for (auto it = edges.begin(); it != edges.end();)
            {
                if (it->to == id)
                    it = edges.erase(it);
                else
                    it++;
            }
        }
    }

    bool add_edge(int from, int to, int weight)
    {
        for (auto edge: vertices[from])
        {
            if (edge.to == to)
                return false;
        }

        vertices[from].push_back(Edge(to, weight));

        return false;
    }

    bool remove_edge(int from, int to)
    {
        for (auto it = vertices[from].begin(); it != vertices[from].end();)
        {
            if (it->to == to)
            {
                it = vertices[from].erase(it);
                return true;
            }
        }

        return false;
    }

    bool update_edge(int from, int to, int weight)
    {
        for (auto& edge: vertices[from])
        {
            if (edge.to == to)
            {
                edge.weight = weight;
                return true;
            }
        }

        return false;
    }

    bool has_path(int from, int to)
    {
        std::map<int, bool> visited;
        std::queue<int> queue;

        for (const auto &[v, _]: vertices)
        {
            visited[v] = false;
        }

        visited[from] = true;
        queue.push(from);

        int v;

        while (!queue.empty())
        {
            v = queue.front();

            if (v == to)
                return true;

            queue.pop();

            for (auto& edge: vertices[v])
            {
                if (!visited[edge.to])
                {
                    visited[edge.to] = true;
                    queue.push(edge.to);
                }
            }
        }

        return false;
    }
    
};

int main()
{
    Graph g;
    g.add_vertex(); // 0
    g.add_vertex(); // 1
    g.add_vertex(); // 2

    g.add_edge(0,1,5);
    g.add_edge(0,2,3);
    g.add_edge(1,2,10);
    g.add_edge(2,0,1);

    g.add_vertex(); // 3
    g.add_vertex(); // 4

    g.add_edge(3,4,1);

    g.add_vertex(); // 5
    g.add_edge(2, 5, 4);

    g.print();

    std::cout << "0->3: " << g.has_path(0,3) << "\n0->5: " << g.has_path(0,5) << "\n\n";

    g.remove_edge(3,4);
    g.update_edge(0, 1, 100);
    g.remove_vertex(5);

    g.print();
}