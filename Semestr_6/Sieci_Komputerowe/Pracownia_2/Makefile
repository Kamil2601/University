CC = g++
CFLAGS = -std=c++11 -Wall -Wextra

all: main.o #send.o receive.o
	$(CC) $(CFLAGS) main.o -o router

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp -c -o main.o

# send.o: includes.h send.h send.cpp
# 	$(CC) $(CFLAGS) send.cpp -c -o send.o

# receive.o: includes.h receive.h receive.cpp
# 	$(CC) $(CFLAGS) receive.cpp -c -o receive.o

clean:
	rm -f router *.o