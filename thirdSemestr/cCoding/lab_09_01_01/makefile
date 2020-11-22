all: app.exe unit_tests.exe 

# APP.EXE
app.exe : main.o operations.o input.o output.o comparation.o operations.o functions.o
	gcc -o app.exe out/functions.o out/operations.o out/main.o out/input.o out/output.o out/comparation.o 

input.o :
	mkdir -p out
<<<<<<< HEAD
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/input.o src/input.c

output.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/output.o src/output.c

operations.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/operations.o src/operations.c

functions.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/functions.o src/functions.c

comparation.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/comparation.o src/comparation.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe :  check_main.o check_input.o
	gcc -o unit_tests.exe out/check_main.o out/check_input.o out/comparation.o out/functions.o out/output.o out/input.o -lcheck -lpthread -lrt

check_input.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_input.o unit-tests/check_input.c

check_main.o :
	mkdir -p out
	gcc -std=c99 -c -o out/check_main.o unit-tests/check_main.c
=======
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/input.o src/input.c

output.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/output.o src/output.c

operations.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/operations.o src/operations.c

functions.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/functions.o src/functions.c

comparation.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/comparation.o src/comparation.c

main.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe :  check_main.o check_input.o
	gcc -o unit_tests.exe out/check_main.o out/check_input.o out/comparation.o out/functions.o out/output.o out/input.o -lcheck -lrt -lpthread 

check_input.o :
	mkdir -p out
	gcc -std=gnu99 -c -o out/check_input.o unit-tests/check_input.c

check_main.o :
	mkdir -p out
	gcc -std=gnu99 -c -o out/check_main.o unit-tests/check_main.c
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
