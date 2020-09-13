#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef mainh
#define mainh

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
#define MAX_SIZE 25
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

typedef struct films {
  char title[MAX_SIZE];
  char name[MAX_SIZE];
  char year[MAX_SIZE];
} films;

#endif
