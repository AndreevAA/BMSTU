#include <stdio.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define ERROR_STATUS 1

#define SUCCESS_STATUS 0

#define FILE_NAME "data/data_1.txt"

typedef struct point point_t;

struct point
{
	double x;
	double y;
	double derivative;	
};

#endif
