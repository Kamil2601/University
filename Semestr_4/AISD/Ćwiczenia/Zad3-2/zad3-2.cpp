#include <iostream>

using namespace std;

int main()
{
    long long int power = 2;
    int n;
    int operations = 8;
    for (int i=1; i<=30; i++)
    {   
        n = 3*power;
        cout << "k: " << i << " |  ";
        cout << "n: " << n << " |  ";
        cout << "operacji: " << operations << "  | ";
        long long int diff = operations-n*3/2;
        cout << "roznica: " << diff << "  | ";
        float error = (float)power/(float)operations;
        cout << "wzgledna: " << error << endl;
        power *=2;
        operations = operations*2+2;
    }

    return 0;
}