# APP.EXE
app.exe : main.o key.o sort.o io.o
	gcc -o app.exe out/main.o out/key.o out/sort.o out/io.o

key.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -pedantic -c -o out/key.o src/key.c

sort.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -pedantic -c -o out/sort.o src/sort.c

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -pedantic -c -o out/io.o src/io.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe : check_unit_tests.o
	gcc -o unit_tests.exe out/check_unit_tests_sort.o out/main.o out/key.o out/sort.o out/io.o -lcheck -lpthread

check_unit_tests.o :
	gcc -std=c99 -c -o out/check_unit_tests.o unit-tests/check_unit_tests.c
