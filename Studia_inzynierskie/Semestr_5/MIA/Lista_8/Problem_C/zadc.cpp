#include <iostream>
#include <cmath>
#include <vector>

using namespace std;

long long int how_many(long long int s)
{
    long double x = (long double)s;

    long double result = (1.0+sqrt(1+8*s))/2.0;

    if (result-floor(result)==0){
        return (long long int)result;
    }
    else{
        return -1;
    }
}

int main()
{
    long long int a00,a11,a10,a01;

    cin >> a00 >> a01 >> a10 >> a01;

    long long int zeros = how_many(a00);
    long long int ones = how_many(a11);

    long long int n = zeros+ones;

    char *result = new char[n];

    if (zeros<0 || ones<0)
    {
        cout << "Impossible\n";
    }
    else if (a01+a10 != zeros*ones || zeros+ones > 1000000)
    {
        cout << "Impossible\n";
    }
    else
    {
        for (auto i=0; i<n; i++)
        {
            if (zeros<=0)
            {

            }

            if (a10>a01)
            {
                result[i] = '1';
                a10 -= zeros;
            }
        }
    }

    delete [] result;

    return 0;
    
}