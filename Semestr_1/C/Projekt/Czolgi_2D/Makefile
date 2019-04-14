CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c11 -g $(shell pkg-config --cflags sdl2) $(shell pkg-config --cflags SDL2_image)
LDLIBS = $(shell pkg-config --libs sdl2) $(shell pkg-config --libs SDL2_image)

all: main

clean:
	rm -f main *.o

menu.o: menu.c menu.h

funkcje.o: funkcje.c funkcje.h

includes.o: includes.c includes.h

kolizje.o: kolizje.c kolizje.h

timer.o: timer.c timer.h

tekstury.o: tekstury.c tekstury.h

poziom_1.o: poziom_1.c poziom_1.h

poziom_2.o: poziom_2.c poziom_2.h

poziom_3.o: poziom_3.c poziom_3.h

si.o: si.c si.h

main.o: main.c

main: main.o funkcje.o timer.o tekstury.o includes.o kolizje.o poziom_1.o poziom_2.o poziom_3.o si.o menu.o
	$(CC) $(CFLAGS) -o main $^ $(LDLIBS)
