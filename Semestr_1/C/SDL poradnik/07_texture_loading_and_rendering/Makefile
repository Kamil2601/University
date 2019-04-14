CC = g++
CFLAGS = -O2 -Wall -Wextra -std=c11 $(shell pkg-config --cflags sdl2) $(shell pkg-config --cflags SDL2_image)
LDLIBS = $(shell pkg-config --libs sdl2) $(shell pkg-config --libs SDL2_image) 
LINKER_FLAGS = -lSDL2 -lSDL2_image

all: main

clean:
	rm -f main *.o

07_texture_loading_and_rendering.o: 07_texture_loading_and_rendering.cpp


main: 07_texture_loading_and_rendering.o
	$(CC) $(CFLAGS) $(LINKER_FLAGS) -o main $^ $(LDLIBS) 
