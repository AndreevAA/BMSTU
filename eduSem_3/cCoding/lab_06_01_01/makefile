all: app.exe

# APP.EXE
app.exe : main.o input.o output.o operations.o functions.o comparation.o
	gcc -o app.exe main.o input.o output.o operations.o functions.o comparation.o

input.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o input.o input.c

output.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o output.o output.c

operations.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o operations.o operations.c

functions.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o functions.o functions.c

comparation.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o comparation.o comparation.c
	
main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o main.o main.c
