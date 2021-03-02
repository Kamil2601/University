#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *somestr(void) {
  char *a = malloc(sizeof("Hello World!"));
  const char *b = "Hello World!";
  strcpy(a,b);
  return a;
}
