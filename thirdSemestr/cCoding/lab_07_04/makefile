all: app.exe unit_tests.exe

# APP.EXE
app.exe : main.o key.o sort.o io.o
	gcc -o app.exe out/main.o out/key.o out/sort.o out/io.o

key.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/key.o src/key.c

sort.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/sort.o src/sort.c

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe : check_sort.o check_main.o check_key.o main.o key.o sort.o io.o
	gcc -o unit_tests.exe out/check_main.o out/check_sort.o out/check_key.o out/key.o out/sort.o out/io.o -lcheck -lpthread -lrt

check_main.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_main.o unit-tests/check_main.c

check_sort.o :
	gcc -std=c99 -c -o out/check_sort.o unit-tests/check_sort.c   

check_key.o :
	gcc -std=c99 -c -o out/check_key.o unit-tests/check_key.c



