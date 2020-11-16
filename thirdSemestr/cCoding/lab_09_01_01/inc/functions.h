#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef MAINH
#define MAINH

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
#define MAX_SIZE_TITLE 50
#define MAX_SIZE_NAME 50
#define MAX_SIZE_YEAR 10
#define MAX_NUMBER 15
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1
#define MAX_NUMBER_OF_STRUCTURES 15

typedef struct films 
{
	char *title;
	int title_size;
	char *name;
	int name_size;
	char *year;
	int year_size;
} films;

#endif

int char_to_int_number(char *string);
