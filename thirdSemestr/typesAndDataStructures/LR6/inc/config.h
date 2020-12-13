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

#define EXIT_STATUS -2

#define FILENAME "numbers.txt"

#define FILE_ERROR 1

typedef struct node_table
{
    int value;
    struct node_table *next;
}t_hash;

typedef struct tnode
{
    int value;
    int balance;
    struct tnode *left;
    struct tnode *right;
}t_node;

#endif //CONFIG_H
