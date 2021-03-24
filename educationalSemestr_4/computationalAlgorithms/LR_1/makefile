all: app.exe clear

# APP.EXE
app.exe : main.o io.o base_functions.o check_functions.o newton_polynom.o armit_polynom.o comparators.o
	gcc -o app.exe out/main.o out/io.o out/base_functions.o out/check_functions.o out/newton_polynom.o out/armit_polynom.o out/comparators.o

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

base_functions.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/base_functions.o src/base_functions.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

check_functions.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/check_functions.o src/check_functions.c

newton_polynom.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/newton_polynom.o src/newton_polynom.c

armit_polynom.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/armit_polynom.o src/armit_polynom.c

comparators.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/comparators.o src/comparators.c

clear :
	rm out/*.o 

clear_all :
	rm *.exe
