#include <cstdio>
#include <algorithm>
#include <cmath>

struct Point{
    long long int x;
    long long int y;
};

struct Pair{
    Point a,b;
};

Point *pt, *temp;

void print_point(Point p)
{
    printf("%lld %lld\n", p.x, p.y);
}

void print_pair(Pair p)
{
    printf("[(%lld %lld),(%lld %lld)]\n", p.a.x, p.a.y, p.b.x,p.b.y);
}

bool cmpx(Point a, Point b)
{
    if (a.x==b.x)
    {
        return a.y < b.y;
    }
    else
    {
        return a.x < b.x;
    }
}

bool cmpy(Point a, Point b)
{
    if (a.y==b.y)
    {
        return a.x<b.x;
    }
    else
    {
        return a.y < b.y;
    }
}

unsigned long long quad_distance(Point a, Point b)
{
    unsigned long long x_dist = (a.x-b.x)*(a.x-b.x);
    unsigned long long y_dist = (a.y-b.y)*(a.y-b.y);
    return x_dist+y_dist;
}

double abs(double x)
{
    if (x>0) return x;
    return -x;
}


int copy(int first, int last, double d)
{
    double axis = ((double)pt[(first+last)/2].x + (double)(pt[(first+last)/2+1].x))/2;
    //printf("Axis: %f\n", axis);
    int j=0;
    for (int i=first; i<=last; i++)
    {
        //print_point(pt[i]);
        //printf("Odleglosc od osi: %f \n",abs((double)(pt[i].x)-axis));
        if (abs((double)pt[i].x-axis)<d)
        {
            temp[j]=pt[i];
            j++;
        }
    }

    return j;
}

void divide_y(int first, int last, Point *y1, Point *y2)
{
    int left = first;
    int right = (first+last)/2 + 1;
    Point v = pt[right];

    for (int i=first; i<=last; i++)
    {
        if (cmpx(y1[i],v))
        {
            y2[left] = y1[i];
            left++;
        }
        else
        {
            y2[right] = y1[i];
            right++;
        }
    }

}

Pair find(int first, int last)
{
    if (last-first==1)
    {
        Pair res = {.a = pt[first], .b = pt[last]};
        return res;
    }
    else if (last-first==2)
    {
        Pair res;
        unsigned long long dist_1=quad_distance(pt[first], pt[first+1]);
        unsigned long long dist_2=quad_distance(pt[first], pt[last]);
        unsigned long long dist_3=quad_distance(pt[first+1],pt[last]);
        if (dist_1<dist_2)
        {
            if(dist_1<dist_3)
            {
                res = {.a = pt[first], .b = pt[first+1]};
                return res;
            }
            else
            {
                res = {.a = pt[first+1], .b = pt[last]};
                return res;
            }
        }
        else
        {
            if(dist_2<dist_3)
            {
                res = {.a = pt[first], .b = pt[last]};
                return res;
            }
            else
            {
                res = {.a = pt[first+1], .b = pt[last]};
                return res;
            }
        }
    }
    else
    {
        int mid = (first+last)/2;
        Pair left = find(first, mid);
        Pair right = find(mid+1, last);
        unsigned long long dist_left = quad_distance(left.a, left.b);
        unsigned long long dist_right = quad_distance(right.a, right.b);
        unsigned long long dist_min = ( dist_left < dist_right ? dist_left : dist_right);
        //print_pair(left);
        //print_pair(right);
        //printf("%lldu %lldu\n", dist_left, dist_right);
        Pair best = (dist_left < dist_right ? left : right);
        double d = sqrt((double)dist_min);
        int n = copy(first, last, d);
        std::sort(temp, temp+n, cmpy);

        for (int i=0; i<n; i++)
        {
            for (int j=i+1; j<=((7+i)<(n-1) ? 7+i : n-1); j++)
            {
                if (quad_distance(temp[i],temp[j])<dist_min)
                {
                    best = {.a = temp[i], .b=temp[j]};
                }
            }
        }

        return best;
    }
}


int main()
{
    int n;
    scanf("%d", &n);
    pt = new Point[n];
    temp = new Point[n];

    for (int i=0; i<n; i++)
    {
        scanf("%lld %lld", &pt[i].x, &pt[i].y);
    }
    std::sort(pt, pt+n, cmpx);

    Pair res = find(0,n-1);
    print_point(res.a);
    print_point(res.b);
    return 0;
}