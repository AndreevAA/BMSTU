all: app.exe unit_tests.exe unit_tests_coverage.exe

# APP.EXE
app.exe : main.o io.o operations.o
	gcc -o app.exe out/main.o out/io.o out/operations.o -lm

io.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

operations.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/operations.o src/operations.c

main.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe :  check_main.o check_io.o check_operations.o io.o operations.o
	gcc -o unit_tests.exe out/check_main.o out/check_operations.o out/check_io.o out/io.o out/operations.o -lcheck -lrt -lpthread

check_main.o :
	mkdir -p out
	gcc -std=gnu99 -c -o out/check_main.o unit-tests/check_main.c

check_io.o :
	mkdir -p out
	gcc -std=gnu99 -c -o out/check_io.o unit-tests/check_io.c

check_operations.o :
	mkdir -p out
	gcc -std=gnu99 -c -o out/check_operations.o unit-tests/check_operations.c

#UNIT_TESTS_COVERAGE.EXE
unit_tests_coverage.exe : check_main.o check_io.o operations_coverage.o io_coverage.o check_operations.o
	gcc --coverage -o unit_tests_coverage.exe out/check_main.o out/check_operations.o out/check_io.o out/io.o out/operations.o -lcheck -lpthread

operations_coverage.o :
	gcc -std=gnu99 -Wall -Werror -pedantic --coverage -c -o out/operations.o src/operations.c

io_coverage.o :
	gcc -std=gnu99 -Wall -Werror -pedantic --coverage -c -o out/io.o src/io.c
