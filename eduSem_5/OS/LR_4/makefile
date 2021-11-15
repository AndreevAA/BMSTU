# task_1.EXE
task_1.exe : task_1.o 
	gcc -o app.exe out/task_1.o

task_1.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/task_1.o src/task_1.c

# task_2.EXE
task_2.exe : task_2.o 
	gcc -o app.exe out/task_2.o

task_2.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/task_2.o src/task_2.c

# task_3.EXE
task_3.exe : task_3.o 
	gcc -o app.exe out/task_3.o 

task_3.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/task_3.o src/task_3.c

# task_3_files.EXE
# task_3_files.exe : second_thread.o first_thread.o
# 	gcc -o app.exe meta/average/out/second_thread.o meta/factorial/out/first_thread.o
	
first_thread.exe :
	mkdir -p meta/out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o meta/factorial/out/first_thread.o meta/factorial/factorial.c

second_thread.exe :
	mkdir -p meta/out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o meta/average/out/second_thread.o meta/average/average.c

# task_4.EXE
task_4.exe : task_4.o 
	gcc -o app.exe out/task_4.o

task_4.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/task_4.o src/task_4.c

# task_5.EXE
task_5.exe : task_5.o 
	gcc -o app.exe out/task_5.o

task_5.o :
	mkdir -p out
	gcc -std=gnu99 -Wall -Werror -ggdb -pedantic -c -o out/task_5.o src/task_5.c
