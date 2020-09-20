#!/bin/bash

gcc -c main.c -o main.o  
gcc -c io.c -o io.o  
gcc -c multiplication.c -o multiplication.o  

gcc main.c io.c multiplication.c
                             
