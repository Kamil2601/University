CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

bst.o: bst.cpp bst.h 
	$(CC) $(CFLAGS) -c bst.cpp

main:  main.o bst.o
	$(CC) $(CFLAGS) -o main *.o



clean: 
	$(RM) main *.o *~
