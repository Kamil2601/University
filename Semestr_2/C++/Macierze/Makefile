CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o macierz.o wyjatki.o
	$(CC) $(CFLAGS) -o main *.o

macierz.o: macierz.cpp macierz.h 
	$(CC) $(CFLAGS) -c macierz.cpp

wyjatki.o: wyjatki.cpp wyjatki.h 
	$(CC) $(CFLAGS) -c wyjatki.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
