#include <iostream>

struct row {
  long long int base;
  long int multiplier;
};

long long int number(row &r) {
  return r.base * r.multiplier;
}

void print_k_greatest(int m, int k) {
  row *rows = new row[m];
  for (int i = 0; i < m; i++) {
    rows[i].base = rows[i].multiplier = m - i;
  }
  while (k--) {
    long long int current_number = number(rows[0]);
    std::cout << current_number << std::endl;
    for (long long int i = 0; i < m && number(rows[i]) == current_number; i++) {
      rows[i].multiplier--;
    }
    for (long long int i = 1; i < m && number(rows[i - 1]) < number(rows[i]); i++) {
      std::swap(rows[i - 1], rows[i]);
    }
  }
  delete [] rows;
}

int main() {

  std::ios_base::sync_with_stdio(0);
  long long int m, k;
  std::cin >> m >> k;
  print_k_greatest(m, k);

  return 0;
}
