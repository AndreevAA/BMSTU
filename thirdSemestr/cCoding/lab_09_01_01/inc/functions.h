#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef MAINH
#define MAINH

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
<<<<<<< HEAD
#define MAX_SIZE 50
#define MAX_NUMBER 50
=======
#define MAX_SIZE_TITLE 50
#define MAX_SIZE_NAME 50
#define MAX_SIZE_YEAR 10
#define MAX_NUMBER 15
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1
#define MAX_NUMBER_OF_STRUCTURES 15

typedef struct films 
{
<<<<<<< HEAD
	char title[MAX_SIZE];
	char name[MAX_SIZE];
	char year[MAX_SIZE];
=======
	char *title;
	int title_size;
	char *name;
	int name_size;
	char *year;
	int year_size;
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
} films;

#endif

int char_to_int_number(char *string);
<<<<<<< HEAD

=======
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
