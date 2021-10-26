all: app.exe
	
# APP.EXE
app.exe : main.o levenstein.o io.o
	gcc -o app.exe out/main.o out/levenstein.o out/io.o

levenstein.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/levenstein.o src/levenstein.c

io.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

main.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c
