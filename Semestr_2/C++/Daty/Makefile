CC = g++
CFLAGS = -g -Wall -std=c++11

all: main

main:  main.o data.o datagodz.o wydarzenie.o
	$(CC) $(CFLAGS) -o main *.o

data.o: data.cpp data.h 
	$(CC) $(CFLAGS) -c data.cpp

datagodz.o: datagodz.cpp datagodz.h 
	$(CC) $(CFLAGS) -c datagodz.cpp

wydarzenie.o: wydarzenie.cpp wydarzenie.h 
	$(CC) $(CFLAGS) -c wydarzenie.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
