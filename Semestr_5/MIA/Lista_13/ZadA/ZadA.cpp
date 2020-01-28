#include <iostream>
#include <algorithm>
#include <vector>
#include <complex>
#include <valarray>

using namespace std;

const double PI = 3.141592653589793238460;

typedef std::complex<double> Complex;
typedef std::valarray<Complex> CArray;

// Cooley–Tukey FFT (in-place)
void fft(CArray &x)
{
    const size_t N = x.size();
    if (N <= 1)
        return;

    CArray even = x[std::slice(0, N / 2, 2)];
    CArray odd = x[std::slice(1, N / 2, 2)];

    fft(even);
    fft(odd);

    for (size_t k = 0; k < N / 2; ++k)
    {
        Complex t = std::polar(1.0, -2 * PI * k / N) * odd[k];
        x[k] = even[k] + t;
        x[k + N / 2] = even[k] - t;
    }
}

void ifft(CArray &x)
{
    x = x.apply(std::conj);

    fft(x);

    x = x.apply(std::conj);
    
    x /= x.size();
}

int main()
{
    int T;
    cin >> T;

    while (T--)
    {
        int N;
        cin >> N;
        N++;

        int padded_size = 2 * (1 << int(ceil(log2(N))));
        vector<Complex> num1_vec(padded_size - N, 0.0), num2_vec(padded_size - N, 0.0);

        for (int i = 0; i < N; i++)
        {
            double coeff;
            cin >> coeff;
            num1_vec.push_back(coeff);
        }
        for (int i = 0; i < N; i++)
        {
            double coeff;
            cin >> coeff;
            num2_vec.push_back(coeff);
        }

        CArray data1(padded_size);
        for (int i = 0; i < padded_size; i++)
            data1[i] = num1_vec[i];
        CArray data2(padded_size);
        for (int i = 0; i < padded_size; i++)
            data2[i] = num2_vec[i];

        fft(data1);
        fft(data2);

        CArray data3(padded_size);
        data3 = data1 * data2;

        ifft(data3);

        vector<long long> ans;
        for (int i = 0; i < padded_size - 1; i++)
        {
            ans.push_back((long long)(round(data3[i].real())));
        }

        for (int i = padded_size - 1 - (2 * N - 1); i < padded_size - 1; i++)
        {
            cout << ans[i] << " ";
        }
        cout << endl;
    }
}