CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c11 $(shell pkg-config --cflags gtk+-3.0) 
LDLIBS = $(shell pkg-config --libs gtk+-3.0)

all: main

clean:
	rm -f main *.o

main.o: main.c

main: main.o
	$(CC) $(LDFLAGS) -o main $^ $(LDLIBS) 
