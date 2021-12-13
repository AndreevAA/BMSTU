CC := g++
OBJ = src/*.cpp
APPNAME := app.exe
FLAGS=-lpthread -O0 -Wall -lpthread -pg -lc
DEBUG_FLAGS=-D__DEBUG__ -g

build:
	$(CC) -o $(APPNAME) $(OBJ) $(FLAGS)

debug:
	$(CC) -o $(APPNAME) $(OBJ) $(FLAGS) $(DEBUG_FLAGS)

clean:
	rm out/*.ii out/*.s out/*.o .DS_Store

run: build
	./$(APPNAME)

prof: run
	gprof ${APPNAME} gmon.out -p
	