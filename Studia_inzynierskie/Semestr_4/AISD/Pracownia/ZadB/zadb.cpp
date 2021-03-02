#include <cstdio>
#include <iostream>
#include <limits.h>

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

class PQueue
{
    public:
    unsigned int max_size = 0;
    unsigned long long int * heap;
    unsigned int size = 0;

    void print()
    {
        for (unsigned i=1; i<size; i++)
        {
            printf("%llu  ", heap[i]);
        }
        printf("\n");
    }

    PQueue(unsigned int k)
    {
        max_size = k;
        heap = new unsigned long long int [max_size];
        for (unsigned i=0; i<max_size; i++)
        {
            heap[i] = 0;
        }
        max_size--;
        size = 0;
    }

    ~PQueue()
    {
        delete [] heap;
    }

    void move_up(unsigned int i)
    {
        if (i>0 && heap[i]>heap[parent(i)])
        {
            std::swap(heap[i],heap[parent(i)]);
            move_up(parent(i));
        }
    }

    void push(unsigned long long int val)
    {
        if (size<max_size-1)
        {

            heap[size] = val;
            size++;

            move_up(size-1);
        }
        else
        {
            if (heap[size]<val)
            {
                heap[size]=val;
            }
        }
    }

    unsigned long long int top()
    {
        return heap[0];
    }

    unsigned int max_index(unsigned i, unsigned j)
    {
        if (heap[i]>heap[j] || j>=size)
        {
            return i;
        }
        else
        {
            return j;
        }
    }

    void repair(unsigned int i)
    {
        if (left(i)<size)
        {
            unsigned k = max_index(left(i),right(i));
            if (heap[k]>heap[i])
            {
                std::swap(heap[k],heap[i]);
                repair(k);
            }
        }
    }

    unsigned long long int pop()
    {
        if (size==0)
        {
            return 0;
        }
        else
        {
            unsigned long long val = heap[0];
            size--;
            heap[0]=heap[size];
            heap[size]=0;
            
            repair(0);
            return val;
        }
    }

    unsigned long long int last()
    {
        if (size==0)
            return 0;
        else
            return heap[size-1];
    }

};

void print_k_largest(unsigned m, unsigned k)
{
    PQueue queue(1200000);
 
    unsigned long long last = ULLONG_MAX;
    unsigned long long val;
    for (unsigned long long i=m; i>0; i--)
    {
        //if (queue.size+(m-i+1)>queue.max_size-10)
        //{
            while(queue.top()>i*m)
            {
                //printf("%llu ", queue.top());
                val = queue.pop();
                //printf("%llu\n",val);
                if (val < last)
                {
                    printf("%llu\n", val);
                    k--;
                    last = val;
                    if (k<=0) return;
                }
            }
        //}

        for (unsigned long long j=m; j>=i; j--)
        {
            queue.push(i*j);
        }

    }

    while(k>0)
    {
        val = queue.pop();
        //printf("%llu\n",val);
        if (val < last)
        {
            printf("%llu\n", val);
            k--;
            last = val;
        }
    }
}

int main()
{
    unsigned long long int m,k;
    scanf("%llu %llu", &m, &k);
    print_k_largest(m,k);
}
