#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define ERROR_STATUS 1
#define ERROR_ARGC 2
#define ERROR_ARGV 3
#define ERROR_FILE 4

#define SUCCESS_STATUS 0

#define MAX_STR_SIZE 256

#define NUM_OF_ARGS 3
#define NUM_OF_ARGS_FIND 4

#define ARGV_FIND -1
#define ARGV_REVERSE -2
#define ARGV_SORT -3

typedef struct node node_t;

struct node
{
	void *data;
	node_t *next;
};
#endif
