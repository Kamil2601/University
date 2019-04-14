#include <iostream>
#include <cstdio>

struct row
{
  int base;
  int multiplier;
};

long long int number(row r)
{
  return (long long int)r.base * (long long int)r.multiplier;
}

void print_k_greatest(int m, int k)
{
  row *rows = new row[m];
  for (int i = 0; i < m; i++)
  {
    rows[i].base = m - i;
    rows[i].multiplier = m;
  }
  while (k--)
  {
    long long int current_number = number(rows[0]);
    printf("%lld\n", current_number);
    for (int i = 0; i < m && number(rows[i]) == current_number; i++)
    {
      rows[i].multiplier--;
    }
    for (int i = 1; i < m && number(rows[i - 1]) < number(rows[i]); i++)
    {
      row temp = rows[i - 1];
      rows[i - 1] = rows[i];
      rows[i] = temp;
    }
  }
  delete[] rows;
}

int main()
{

  int m, k;
  scanf("%d %d", &m, &k);
  print_k_greatest(m, k);

  return 0;
}
