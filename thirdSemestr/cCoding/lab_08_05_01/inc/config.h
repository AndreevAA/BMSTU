#include <stdio.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define ERROR_WHILE_INPUT_SIZE 1
#define ERROR_INPUT_SIZE 2
#define ERROR_INPUT_MATRIX 3
#define ERROR_DELETE_MATRIX 4;

#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

#define NUMBER_OF_PARAMS 2
#define MIN_SIZE 1
#define MAX_SIZE 100

struct matrix
{
	int **matrix_indicators;
	int *matrix_elements;
	int matrix_height;
	int matrix_width;
} matrix;

#endif