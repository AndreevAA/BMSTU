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

#define CHOOSE_BUILD_SIMPLE_TREE 1
#define CHOOSE_BUILD_BALANCED_TREE 2
#define CHOOSE_BUILD_DDT 3
#define CHOOSE_BUILD_BALANCED_DDT 4
#define CHOOSE_BUILD_HASH_TABLE 5
#define CHOOSE_PRINT_HASH_TABLE 6
#define CHOOSE_SEARCH_NUMBER_IN_HASH_TABLE 7
#define CHOOSE_SEARCH_NUMBER_IN_OP_FILE 8
#define CHOOSE_PRINT_EFFICINCY 9
#define CHOOSE_SEARCH_EXIT 0

#define NUM_OF_TESTING_OPERATIONS_WHILE_GET_TIME 1000

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
