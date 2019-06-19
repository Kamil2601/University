#include <cstdio>
#include <vector>
#include <list>

struct Node_info{
    int sum;
    bool on_path;
};

struct List_el{
    int v;
    List_el *next;
};

class List{
    public:

    List_el *first;
    List_el *last;
    int size;

    List(){
        first = NULL;
        last = NULL;
        size = 0;
    }

    void add(int i)
    {
        if (first == NULL)
        {
            size = 1;
            first = new List_el;
            first->v = i;
            last = first;
        }
        else
        {
            last->next = new List_el;
            last = last->next;
            last->v = i;
            size++;
        }
    }
};

List *tree;
//Node_info *node;

Node_info count(int v, int prev)
{
    Node_info res, info;
    //printf("%d %d\n", v, tree[v].first->v);    
    if (tree[v].size==1 && tree[v].first->v==prev)
    {
        //printf("xd\n");
        res.on_path=false;
        res.sum = 1;
    }
    else
    {
        int s = 0;
        int count_false = 0;
        List_el *temp = tree[v].first;
        while(temp!=NULL)
        {
            if (temp->v!=prev)
            {
                info = count(temp->v, v);
                s+=info.sum;
                if (info.on_path==false)
                {
                    count_false++;
                }
            }
            temp = temp->next;
        }
        /*for (int i=0; i<tree[v].size; i++)
        {
            if (tree[v][i]!=prev)
            {
                
                count(tree[v][i], v);
                s+=node[tree[v][i]].sum;
                if (node[tree[v][i]].on_path==false)
                {
                    count_false++;
                }
                
            }
        }*/
        
        if (count_false==0)
        {
            res.sum=s+1;
            res.on_path=false;
        }
        else if (count_false==1)
        {
            res.sum=s;
            res.on_path=false;
        }
        else
        {
            res.sum=s-1;
            res.on_path=true;
        }
    }

    return res;

    
}


int main()
{
    int n;
    scanf("%d", &n);

    tree = new List[n];
    
    //node = new Node_info[n];
    int v1, v2;
    
    for (int i=0; i<n-1; i++)
    {
        scanf("%d %d", &v1, &v2);
        tree[v1-1].add(v2-1);
        tree[v2-1].add(v1-1);
    }

    int m = 0;
    int index = 0;

    for (int i=0; i<n; i++)
    {
        if (tree[i].size>m)
        {
            m=tree[i].size;
            index = i;
        }
    }
    
    /*for (int i=0; i<n; i++)
    {
        printf("%d: ", i);
        List_el *temp = tree[i].first;
        while(temp!=NULL)
        {
            printf("%d ", temp->v);
            temp = temp->next;
        }

        printf("\n");
    }*/

    //printf("%ld\n", sizeof(Node_info));
    //std::list <int> test;

    //printf("%ld\n",sizeof(test));

    //Node_info res = count(index,-1);
    printf("%d\n", 1);
}