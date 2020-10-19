#!/bin/bash

gcc -c src/main.c -o out/main.o  
gcc -c src/io.c -o out/io.o  
gcc -c src/operations.c -o out/operations.o  

gcc src/main.c src/io.c src/operations.c
