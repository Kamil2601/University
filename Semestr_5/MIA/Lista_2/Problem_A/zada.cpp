#include <cstdio>
#include <cmath>
#include <iostream>
#include <iomanip>

#define M_PI 3.14159265358979323846

using namespace std;


long double arc_dist(int a, int b, int y, int m, int n, long double r)
{
    if (m==0 || a==b || n==0) return 0;
    //cout << "y = " << y <<  " n = " << n << ' ' <<  " m = " << m << "\n";
    long double diff = (long double)abs(a-b);
    //cout << "(a-b)/m = " << diff/m << '\n';
    long double radius = r*(long double)y/n;
    //cout << "radius = " << radius << '\n';
    return diff/m*M_PI*radius;
}

void distance()
{
    int n,m,ax,ay,bx,by;
    long double r;

    cin >> m >> n >> r;
    cin >> ax >> ay >> bx >> by;

    if (ay > by)
    {
        int p = ax;
        ax = bx;
        bx = p;
        p = ay;
        ay = by;
        by = p;
    }

    //cout << ax << " " << ay << " " << bx << " " << by << "\n";

    long double line = (long double)(by-ay)/n*r;

    
    long double dist1 = line+arc_dist(ax,bx,ay,m,n,r);

    long double dist2 = (double)(ay+by)/n*r;

    if (dist1 < dist2) cout << setprecision(10) << dist1 << '\n';
    else cout << setprecision(10) << dist2 << '\n';

}

int main()
{
    distance();
}