#include <complex>
#include <valarray>
#include <math.h>
#include <iostream>

typedef std::complex<double> Complex;
typedef std::valarray<Complex> CArray;


void fft(CArray& x)
{
    const int N = x.size();
    if (N <= 1) return;
 
    CArray even = x[std::slice(0, N/2, 2)];
    CArray  odd = x[std::slice(1, N/2, 2)];
 
    fft(even);
    fft(odd);
 
    for (int k = 0; k < N/2; k++)
    {
        Complex t = std::polar(1.0, -2 * M_PI * k / N) * odd[k];
        x[k] = even[k] + t;
        x[k+N/2] = even[k] - t;
    }
}

void ifft(CArray& x)
{
    x = x.apply(std::conj);
    fft(x);
    x = x.apply(std::conj);
    x /= x.size();
}

int main()
{
    int *coins;
    int n;
    scanf("%d", &n);
    coins = new int[n];
    int max = 0;
    for (int i=0; i<n; i++)
    {
        scanf("%d", &coins[i]);
        if (coins[i]>max)
        {
            max = coins[i];
        }
    }
    int m = 2*max;
    int k = 1;
    while (k<=m)
    {
        k*=2;
    }
    Complex *poly = new Complex[k];
    for (int i=0; i<n; i++)
    {
        poly[coins[i]]=1.0;
    }
    poly[0] = 1.0;

    CArray data(poly, k);
    fft(data);

    for (int i = 0; i < k; i++)
    {
        data[i]*=data[i];
    }

    ifft(data);

    int *res = new int [k];
    int degree = 0;
    
    for (int i=0; i<k; i++)
    {
        res[i] = (int)(round(std::real(data[i])));
        //printf("%d %d\n", i ,res[i]);
        if (res[i]>0)
        {
            degree=i;
        }
    }


    res[0]=1;


    for (int i=0; i<n; i++)
    {
        //printf("%d ", coins[i]);
        res[2*coins[i]]++;
        //res[coins[i]]++;
    }
    //printf("\n");
    for (int i=0; i<=degree; i++)
    {
        res[i]>>=1;
    }
    for (int i=0; i<n; i++)
    {
        res[2*coins[i]]--;
    }
    res[0]=1;
    for (int i=0; i<=degree; i++)
    {
        if(res[i]>0)
        {
            printf("%d %d\n", i ,res[i]);
        }
    }



    

    return 0;

}