#include <cstdio>

long long unsigned powers[10] = {1, 7, 49, 343, 2401, 16807, 117649, 823543, 5764801, 40353607};

long long unsigned pow(char n)
{
    return powers[(int)n - 48];
}

int rows, cols;
long long unsigned **max;

long long unsigned max2(int i, int j_left, int j_right)
{
    long long unsigned left = (j_left < 0 ? 0 : max[i][j_left]);
    long long unsigned right = (j_right >= cols ? 0 : max[i][j_right]);
    return (left > right ? left : right);
}

void swap(char **s1, char **s2)
{
    char *temp = *s1;
    *s1 = *s2;
    *s2 = temp;
}

void swap_arr()
{
    long long unsigned *temp = max[0];
    for (int i = 0; i < 3; i++)
    {
        max[i] = max[i + 1];
    }
    max[3] = temp;
}

void solve()
{

    scanf("%d %d", &rows, &cols);

    max = new long long unsigned *[4];
    for (int i = 0; i < 4; i++)
    {
        max[i] = new long long unsigned[cols];
    }

    char *r = new char[cols];
    char *lr = new char[cols];

    char **row = &r;
    char **last_row = &lr;

    for (int i = 0; i < 3; i++)
    {
        scanf("%s", *row);
        for (int j = 0; j < cols; j++)
        {
            max[i][j] = pow((*row)[j]);
        }
    }
    for (int j = 0; j < cols; j++)
    {
        unsigned long long better = max2(0,j-1,j+1);
        if (better>0)
            max[2][j] += max2(0, j - 1, j + 1);
        else
            max[2][j] == 0;
    }
    for (int j = 0; j < cols; j++)
    {
        unsigned long long better = max2(2, j - 2, j + 2);
        if (better>0)
            max[1][j] += better;
        else
            max[1][j] = 0;   
    }


    swap(row, last_row);

    for (int i = 3; i < rows; i++)
    {
        scanf("%s", *row);

        for (int j = 0; j < cols; j++)
        {   
            unsigned long long better = max2(1, j - 1, j + 1);
            if (better > 0)
                max[3][j] = pow((*row)[j]) + better;
            else
                max[3][j] = 0;
        }
        for (int j = 0; j < cols; j++)
        {
            long long unsigned better = max2(3, j - 2, j + 2);
            if (better > 0)
            {
                max[2][j] = (max[2][j] > better + pow((*last_row)[j]) ? max[2][j] : better + pow((*last_row)[j]));
            }
        }
        swap(last_row, row);
        swap_arr();
    }

    long long unsigned res = 0;

    for (int j = 0; j < cols; j++)
    {
        if (max[2][j] > res)
        {
            res = max[2][j];
        }
    }
    printf("%llu\n", res);
}

int main()
{
    solve();
}