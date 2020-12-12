all: app.exe unit_tests.exe

# APP.EXE
app.exe : main.o mysnprintf.o checks.o comps.o funcs.o
	gcc -o app.exe out/main.o out/mysnprintf.o out/checks.o out/comps.o out/funcs.o 

mysnprintf.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/mysnprintf.o src/mysnprintf.c

checks.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/checks.o src/checks.c

comps.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/comps.o src/comps.c

funcs.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/funcs.o src/funcs.c

main.o :
	mkdir -p out
	gcc -std=c99 -Wall -Werror -ggdb -pedantic -c -o out/main.o src/main.c

#UNIT_TESTS.EXE
unit_tests.exe : check_snprintf.o check_main.o mysnprintf.o checks.o comps.o funcs.o
	gcc -o unit_tests.exe out/check_main.o out/check_snprintf.o out/mysnprintf.o out/checks.o out/comps.o out/funcs.o -lcheck -lrt -lpthread -lm

check_main.o :
	mkdir -p out
	gcc -std=c99 -c -Wall -Wextra -Werror -ggdb -pedantic -c -o out/check_main.o unit-tests/check_main.c

check_snprintf.o :
	gcc -std=c99 -c -Wall -Wextra -Werror -ggdb -pedantic -c -o out/check_snprintf.o unit-tests/check_snprintf.c
