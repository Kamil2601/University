CC = gcc
CFLAGS = -std=c11 -g -Wall -Wextra

all: main

clean: 
	$(RM) main *.o

tablica.o: tablica.h tablica.c

main.o: main.c

main: main.o tablica.o
	$(CC) $(CFLAGS) -o main *.o
