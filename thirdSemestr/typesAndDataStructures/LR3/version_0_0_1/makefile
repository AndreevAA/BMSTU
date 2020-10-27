all: app.exe 

# APP.EXE
app.exe : main.o operations.o menu.o io.o
	gcc -o app.exe out/main.o out/operations.o

menu.o :
	mkdir -p out
	gcc -std=c99 -c -o out/menu.o src/menu.c

main.o :
	mkdir -p out
	gcc -std=c99 -c -o out/main.o src/main.c

operations.o :
	mkdir -p out
	gcc -std=c99 -c -o out/operations.o src/operations.c

io.o :
	mkdir -p out
	gcc -std=c99 -c -o out/io.o src/io.c

