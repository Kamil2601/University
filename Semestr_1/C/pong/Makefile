CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c11 $(shell pkg-config --cflags sdl) 
LDLIBS = $(shell pkg-config --libs sdl)

all: main

clean:
	rm -f main *.o

main.o: main.c

main: main.o
	$(CC) $(LDFLAGS) -o main $^ $(LDLIBS) 
