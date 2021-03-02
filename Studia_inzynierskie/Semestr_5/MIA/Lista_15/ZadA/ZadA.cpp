#include <iostream>

using namespace std;

int main()
{

    int n;
    cin >> n;
    long c, t, q = 0, max_size = 0, prev_time = 0, last_time = 0, final_time = 0;
    while (n--)
    {
        cin >> t >> c;
        if (t < last_time)
        {
            q += c - (t - prev_time);
            last_time += c;
        }
        else
        {
            q = c;
            last_time = t + c;
        }
        if (q > max_size)
        {
            max_size = q;
        }
        if (last_time > final_time)
        {
            final_time = last_time;
        }
        prev_time = t;
    }
    cout << final_time << " " << max_size << '\n';
    return 0;
}