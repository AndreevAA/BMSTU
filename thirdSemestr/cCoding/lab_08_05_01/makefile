all: app.exe

# APP.EXE
app.exe : main.o io.o operations.o
	gcc -o app.exe out/main.o out/io.o out/operations.o

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c
	
main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

operations.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/operations.o src/operations.c
