#ifndef CONFIG_H
#define CONFIG_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <string.h>
#include <time.h>

#define ERROR_STATUS -1
#define SUCCESS_STATUS 0

#define FILENAME "test_2.txt"

#define FILE_ERROR 1

typedef struct matrix matrix;

struct matrix
{
	int num_of_points;
	int **content;
};

#endif //CONFIG_H
