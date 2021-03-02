#include <iostream>

typedef unsigned long long ull;

struct row
{
  int base;
  int multiplier;
};

ull number(row r)
{
  return (ull)r.base * (ull)r.multiplier;
}

void prull_k_greatest(ull m, ull k)
{
  row *rows = new row[m];
  for (ull i = 0; i < m; i++)
  {
    rows[i].base = rows[i].multiplier = m - i;
  }
  while (k--)
  {
    ull current_number = number(rows[0]);
    printf("%llu\n", current_number);
    for (ull i = 0; i < m && number(rows[i]) == current_number; i++)
    {
      rows[i].multiplier--;
    }
    for (ull i = 1; i < m && number(rows[i - 1]) < number(rows[i]); i++)
    {
      std::swap(rows[i - 1], rows[i]);
    }
  }
  delete[] rows;
}

int main()
{

  ull m, k;
  scanf("%llu %llu", &m, &k);
  prull_k_greatest(m, k);

  return 0;
}
