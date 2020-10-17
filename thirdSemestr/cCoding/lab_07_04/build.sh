#!/bin/bash

gcc -c src/main.c -o out/main.o  
gcc -c src/io.c -o out/io.o  
gcc -c src/key.c -o out/key.o  
gcc -c src/sort.c -o out/sort.o   
gcc -c src/functions.c -o out/functions.o   

gcc src/main.c src/io.c src/key.c src/sort.c src/functions.c
                             