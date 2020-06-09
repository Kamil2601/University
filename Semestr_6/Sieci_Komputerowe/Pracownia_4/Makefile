CC = g++
CFLAGS = -std=c++11 -Wall -Wextra

all: main.o server.o
	$(CC) $(CFLAGS) main.o server.o -o webserver

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp -c -o main.o

server.o: server.h server.cpp
	$(CC) $(CFLAGS) server.cpp -c -o server.o

clean:
	rm -f webserver *.o