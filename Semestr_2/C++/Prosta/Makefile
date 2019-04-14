CC = g++
CFLAGS = -std=c++11 -g -Wall -Wextra

all: main

clean: 
	$(RM) main *.o

punkt.o: punkt.h punkt.cpp

wektor.o: wektor.h wektor.cpp

prosta.o: prosta.h prosta.cpp

main.o: main.cpp

main: main.o punkt.o wektor.o prosta.o
	$(CC) $(CFLAGS) -o main *.o
