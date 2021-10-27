all: app.exe
	
# APP.EXE
app.exe : main.o 
	gcc -o app.exe out/main.o

main.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c
