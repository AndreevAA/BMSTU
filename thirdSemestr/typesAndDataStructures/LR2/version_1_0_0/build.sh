#!/bin/bash

gcc -c main.c -o main.o  
gcc -c io.c -o io.o  
gcc -c operations.c -o operations.o  
gcc -c menu.c -o menu.o
gcc -c check.c -o check.o

gcc main.c io.c operations.c menu.c check.c