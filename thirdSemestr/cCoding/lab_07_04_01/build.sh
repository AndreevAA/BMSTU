#!/bin/bash

gcc -c main.c -o main.o  
gcc -c io.c -o io.o  
gcc -c functions.c -o functions.o

gcc main.c io.c functions.c
                             
