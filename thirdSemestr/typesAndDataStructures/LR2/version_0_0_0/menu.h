#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define INPUT_COMMAND_EXIT 0
#define INPUT_COMMAND_ERROR 1
#define INPUT_COMMAND_PRINT_ALL 2
#define INPUT_COMMAND_PRINT_FILTERED_STUDENTS 3
#define INPUT_COMMAND_SORT_TABLE_BY_KEY 4
#define INPUT_COMMAND_ADD_NOTE 5
#define INPUT_COMMAND_DELETE_NOTE 6
#define INPUT_COMMAND_SAVE_TABLE 7

#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

#define INPUT_TABLE_INFORMATION_MAX_SIZE 256
#define INPUT_STRING_MAX_SIZE 256
#define INPUT_ARGC_NUMBER 2

#define NUMBER_OF_PARAMETRS 12

typedef struct date 
{
	int day;
	int month;
	int year;
} date;

typedef struct student_personal_information 
{
	char surname[INPUT_STRING_MAX_SIZE];
	char name[INPUT_STRING_MAX_SIZE];
	int gender;
	int age;
	double average_score_per_session;
	struct date receipt_date;
} student_personal_information;

typedef struct student_address 
{
	char street[INPUT_TABLE_INFORMATION_MAX_SIZE];
	int house_or_campus_number;
	int flat_or_room_number;
} student_address;

typedef struct students_accommodation_information 
{
	char accommodation[INPUT_STRING_MAX_SIZE];
	struct student_personal_information student;
	struct student_address address;
} students_accommodation_information;

#endif

int get_menu_status();

void menu_comprator_by_menu_status(int menu_status, struct students_accommodation_information *input_table_information, int *input_table_information_size, char const *argv[]);
