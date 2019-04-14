CC = gcc
CFLAGS = -std=c11 -g -Wall -Wextra

all: main

clean: 
	$(RM) main *.o

ulamki.o: ulamki.h ulamki.c

main.o: main.c

main: main.o ulamki.o
	$(CC) $(CFLAGS) -o main *.o
