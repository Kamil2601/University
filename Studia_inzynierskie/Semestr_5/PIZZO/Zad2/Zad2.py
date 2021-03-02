import json

def reduce(graph):
    removed = True
    while removed:
        to_remove = set()
        removed = False
        for i in graph.keys():
            if len(graph[i]) < 4:
                removed = True
                to_remove.add(i)

        for v in to_remove:
            graph.pop(v)

        for i in graph.keys():
            for v in to_remove:
                if v in graph[i]:
                    graph[i].remove(v)

def correct_vars(graph):
    vertexes = list(graph.keys())
    vertexes.sort()
    length = len(vertexes)
    v_dict = { vertexes[i] : i+1 for i in range(length)}

    result = {v_dict[v] : graph[v] for v in graph.keys()}

    for i in result.keys():
        result[i] = set(map(lambda x : v_dict[x], result[i]))

    return result

def print_groups(n):
    for i in range(1,n+1):
        v = [i + j*n for j in range(4)]
        print(v[0],v[1],v[2],v[3],0)
        for j in range(4):
            for k in range(j+1,4):
                print(-v[j],-v[k],0)

def var(v,g,n):
    return v+(g-1)*n

def conflicts(graph):
    n = len(graph)
    conflicts = set()
    for v in graph.keys():
        for u in graph[v]:
            x = min(v,u)
            y = max(v,u)

            conflicts.add((x,y))

    return conflicts

def print_conflicts(conflicts,n):
    for conflict in conflicts:
        v = conflict[0]
        u = conflict[1]
        for g in range(1,5):
            print(-var(v,g,n),-var(u,g,n),0)

def solve(graph):
    if len(graph)==0:
        print("p cnf 1 1")
        print("1 0")

    else:
        conf = conflicts(graph)
        n = len(graph)
        print("p cnf",4*n,n*7+4*len(conf))
        print_groups(n)
        print_conflicts(conf,n)

                

def main():
    path = input()
    f = open(path, "r")
    problem = json.loads(f.read())
    students = problem["studenci"]
    
    graph = {i : set() for i in range(1,students+1)}
    
    for conflict in problem["konflikty"]:
        v1 = conflict["zrzeda"]
        v2 = conflict["nielubiany"]
        graph[v1].add(v2)
        graph[v2].add(v1)

    reduce(graph)

    graph = correct_vars(graph)

    solve(graph)

if __name__=="__main__":
    main()
