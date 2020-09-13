#!/bin/bash

gcc -c main.c -o main.o  
gcc -c input.c -o input.o  
gcc -c output.c -o output.o  
gcc -c comparation.c -o comparation.o  
gcc -c operations.c -o operations.o  

gcc main.c input.c output.c comparation.c operations.c
                             
