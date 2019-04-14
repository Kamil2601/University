CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c11 $(shell pkg-config --cflags ncurses) 
LDLIBS = $(shell pkg-config --libs ncurses)

all: main

clean:
	rm -f main *.o

funkcje.o: funkcje.h funkcje.c

main.o: main.c

main: main.o funkcje.o
	$(CC) $(LDFLAGS) -o main $^ $(LDLIBS)


