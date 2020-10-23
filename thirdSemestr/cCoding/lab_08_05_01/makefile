all: app.exe unit_tests.exe unit_tests_coverage.exe

# APP.EXE
app.exe : main.o io.o operations.o
	gcc -o app.exe out/main.o out/io.o out/operations.o

io.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

operations.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/operations.o src/operations.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe :  check_main.o check_io.o io.o operations.o
	gcc -o unit_tests.exe out/check_main.o out/check_io.o out/io.o out/operations.o -lcheck -lpthread  

check_main.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_main.o unit-tests/check_main.c

check_io.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_io.o unit-tests/check_io.c

#UNIT_TESTS_COVERAGE.EXE
unit_tests_coverage.exe : check_main.o check_io.o operations_coverage.o io_coverage.o
	gcc --coverage -o unit_tests_coverage.exe out/check_main.o out/check_io.o out/io.o out/operations.o -lcheck -lpthread

operations_coverage.o :
	gcc -std=c99 -Wall -Werror -pedantic --coverage -c -o out/operations.o src/operations.c

io_coverage.o :
	gcc -std=c99 -Wall -Werror -pedantic --coverage -c -o out/io.o src/io.c
