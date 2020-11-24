#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef MAINH
#define MAINH

#define ERROR_WHILE_INPUT_SIZE 1
#define ERROR_INPUT_SIZE 2
#define ERROR_INPUT_MATRIX 3
#define ERROR_DELETE_MATRIX 4;
#define ERROR_WHILE_INPUT_DEGREES 5;
#define ERROR_INPUT_DEGREES 6;
#define ERROR_NEW_SIZE 7;

#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

#define NUMBER_OF_PARAMS 2
#define MIN_SIZE 1
#define MAX_SIZE 1000000

struct matrix
{
	int **indicators;
	int *elements;
	int height;
	int width;
};

#endif
