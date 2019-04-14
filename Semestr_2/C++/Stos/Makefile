CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o stos.o
	$(CC) $(CFLAGS) -o main *.o

stos.o:  stos.cpp stos.h 
	$(CC) $(CFLAGS) -c stos.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~