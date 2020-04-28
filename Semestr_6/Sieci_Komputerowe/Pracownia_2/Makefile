CC = g++
CFLAGS = -std=c++11 -Wall -Wextra

all: main.o udp.o table.o ip.o
	$(CC) $(CFLAGS) main.o udp.o table.o ip.o -o router

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp -c -o main.o

table.o: table.h table.cpp
	$(CC) $(CFLAGS) table.cpp -c -o table.o

udp.o: udp.h table.h udp.cpp
	$(CC) $(CFLAGS) udp.cpp -c -o udp.o

ip.o: udp.h	ip.h ip.cpp
	$(CC) $(CFLAGS) ip.cpp -c -o ip.o

clean:
	rm -f *.o

distclean:
	rm -f *.o router