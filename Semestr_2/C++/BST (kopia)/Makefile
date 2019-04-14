CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o bst.o
	$(CC) $(CFLAGS) -o main *.o

bst.o: bst.cpp bst.h 
	$(CC) $(CFLAGS) -c bst.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
