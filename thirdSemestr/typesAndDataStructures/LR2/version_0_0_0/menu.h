#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define INPUT_COMMAND_EXIT 0;
#define INPUT_COMMAND_ERROR 1;
#define INPUT_COMMAND_PRINT_ALL 2;
#define INPUT_COMMAND_PRINT_FILTERED_STUDENTS 3;
#define INPUT_COMMAND_SORT_TABLE_BY_KEY 4;
#define INPUT_COMMAND_ADD_NOTE 5;
#define INPUT_COMMAND_DELETE_NOTE 6;
#define INPUT_COMMAND_SAVE_TABLE 7;

#define SUCCESS_STATUS 0;
#define ERROR_STATUS 1;

#define INPUT_TABLE_INFORMATION_MAX_SIZE 100;


typedef struct students_accommodation_information 
{
	char title[MAX_SIZE];
	char name[MAX_SIZE];
	char year[MAX_SIZE];
} students_accommodation_information;

#endif

int get_menu_status();

void menu_comprator_by_menu_status(int menu_status, struct students_accommodation_information *input_table_information, int input_table_information_size);

