#!/bin/bash

gcc -c src/main.c -o out/main.o  
gcc -c src/io.c -o out/io.o  
gcc -c src/operations.c -o out/operations.o  
gcc -c src/menu.c -o out/menu.o
gcc -c src/comparation.c -o out/comparation.o

gcc src/main.c src/io.c src/operations.c src/menu.c src/comparation.c
