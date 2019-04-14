CC = g++
CFLAGS = -O2 -Wall -Wextra -std=c11 $(shell pkg-config --cflags sdl2) $(shell pkg-config --cflags SDL2_image)
LDLIBS = $(shell pkg-config --libs sdl2) $(shell pkg-config --libs SDL2_image) 
LINKER_FLAGS = -lSDL2 -lSDL2_image

all: main

clean:
	rm -f main *.o

10_color_keying.o: 10_color_keying.cpp


main: 10_color_keying.o
	$(CC) $(CFLAGS) $(LINKER_FLAGS) -o main $^ $(LDLIBS) 
