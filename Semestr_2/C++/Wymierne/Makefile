CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o wymierne.o wyjatki.o
	$(CC) $(CFLAGS) -o main *.o

wymierne.o: wymierne.cpp wymierne.h
	$(CC) $(CFLAGS) -c wymierne.cpp

wyjatki.o: wyjatki.cpp wyjatki.h 
	$(CC) $(CFLAGS) -c wyjatki.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
