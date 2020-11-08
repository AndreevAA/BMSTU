#!/bin/bash

gcc -c src/main.c -o out/main.o  
gcc -c src/io.c -o out/io.o  
gcc -c src/menu.c -o out/menu.o
gcc -c src/s_o.c -o out/s_o.o  
gcc -c src/v_o.c -o out/v_o.o

gcc src/main.c src/io.c src/menu.c src/s_o.c src/v_o.c
