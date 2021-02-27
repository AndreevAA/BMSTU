all: app.exe clear

# APP.EXE
app.exe : main.o io.o polynom_newton.o polynom_ermit.o
	gcc -o app.exe out/main.o out/io.o out/polynom_newton.o out/polynom_ermit.o

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

polynom_newton.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/polynom_newton.o src/polynom_newton.c

polynom_ermit.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/polynom_ermit.o src/polynom_ermit.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

clear :
	rm out/*.o 

clear_all :
	rm *.exe

