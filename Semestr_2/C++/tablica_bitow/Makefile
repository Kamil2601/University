CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o tabbit.o
	$(CC) $(CFLAGS) -o main *.o

tabbit.o: tabbit.cpp tabbit.h 
	$(CC) $(CFLAGS) -c tabbit.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
