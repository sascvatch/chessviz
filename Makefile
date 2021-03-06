CC = gcc
CFLAGS  = -Wall -Werror -std=gnu11

.PHONY: clean

all: bin build test default

default: bin/chessviz

test: bin/chessviz-test
	bin/chessviz-test

bin/chessviz: build/main.o build/board.o  build/move.o bin
	$(CC) $(CFLAGS) build/main.o build/board.o  build/move.o -o bin/chessviz

build/main.o: src/main.c src/board.h  src/move.h build
	$(CC) $(CFLAGS) -c src/main.c -o build/main.o

build/board.o: src/board.c src/board.h  src/move.h build
	$(CC) $(CFLAGS) -c src/board.c -o build/board.o


#make: *** No rule to make target `thirdparty/ctest.h', needed by `build/main_test.o'.  Stop.

#gcc -I thirdparty src -c test/board_test.c -o build/test/board_test.o

build/move.o: src/move.c src/move.h build
	$(CC) $(CFLAGS) -c src/move.c -o build/move.o

bin/chessviz-test: build/main_test.o build/board.o  build/move.o bin
	$(CC) $(CFLAGS) build/main_test.o build/board.o  build/move.o -o bin/chessviz-test

#build/main_test.o: test/main.c thirdparty/ctest.h src/board.h src/move.h build
#	$(CC) $(CFLAGS) -I thirdparty -I src -c test/main.c -o build/main_test.o

build/main_test.o: test/main.c thirdparty/ctest.h src/board.h src/move.h build
	$(CC) $(CFLAGS) -I thirdparty -I src  -c test/main.c -o build/main_test.o

build:
	mkdir build

bin:
	mkdir bin

clean:
	rm -rf build bin
