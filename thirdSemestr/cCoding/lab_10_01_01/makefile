all: app.exe unit_tests.exe
	
# APP.EXE
app.exe : main.o elem_operations.o list_operations.o sort_operations.o io.o list_functions.o
	gcc -o app.exe out/main.o out/elem_operations.o out/list_operations.o out/sort_operations.o out/io.o out/list_functions.o

elem_operations.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/elem_operations.o src/elem_operations.c

list_operations.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/list_operations.o src/list_operations.c

sort_operations.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/sort_operations.o src/sort_operations.c

io.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/io.o src/io.c

list_functions.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/list_functions.o src/list_functions.c

main.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe : check_main.o check_io.o elem_operations.o io.o list_functions.o list_operations.o sort_operations.o
	gcc -o unit_tests.exe out/check_main.o out/check_io.o out/elem_operations.o out/list_operations.o out/sort_operations.o out/io.o out/list_functions.o -lcheck #-lrt 

check_main.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_main.o unit-tests/check_main.c

check_io.o :
	gcc -std=c99 -c -o out/check_io.o unit-tests/check_io.c   
