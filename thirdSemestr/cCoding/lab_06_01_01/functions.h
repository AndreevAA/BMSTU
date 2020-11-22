#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef MAINH
#define MAINH

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
#define MAX_SIZE 50
#define MAX_NUMBER 50
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1
#define MAX_NUMBER_OF_STRUCTURES 15

typedef struct films 
{
	char title[MAX_SIZE];
	char name[MAX_SIZE];
	char year[MAX_SIZE];
} films;

#endif

int char_to_int_number(char *string);

