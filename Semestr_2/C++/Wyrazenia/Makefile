CC = g++
CFLAGS = -g -Wall -Wextra -std=c++11

all: main

main:  main.o wyrazenie.o liczby.o binarne.o unarne.o
	$(CC) $(CFLAGS) -o main *.o

wyrazenie.o: wyrazenie.h wyrazenie.cpp
	$(CC) $(CFLAGS) -c wyrazenie.cpp

liczby.o: liczby.h liczby.cpp
	$(CC) $(CFLAGS) -c liczby.cpp

unarne.o: unarne.h unarne.cpp
	$(CC) $(CFLAGS) -c unarne.cpp

binarne.o: binarne.h binarne.cpp
	$(CC) $(CFLAGS) -c binarne.cpp

main.o:  main.cpp
	$(CC) $(CFLAGS) -c main.cpp

clean: 
	$(RM) main *.o *~
