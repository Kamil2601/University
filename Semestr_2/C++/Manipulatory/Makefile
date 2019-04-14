CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o manipulatory.o #wyjatki.o
	$(CC) $(CFLAGS) -o main *.o

manipulatory.o: manipulatory.cpp manipulatory.h
	$(CC) $(CFLAGS) -c manipulatory.cpp

#wyjatki.o: wyjatki.cpp wyjatki.h 
#	$(CC) $(CFLAGS) -c wyjatki.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
