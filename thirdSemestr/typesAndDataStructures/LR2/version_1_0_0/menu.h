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

typedef struct social_home_address
{
	int house_number;
	int room_number;
} social_home_address;

typedef struct social_home
{
	int is_social_home;
	struct student_personal_information student;
	struct social_home_address 			address;
} social_home;

typedef struct private_home_address
{
	char street[INPUT_TABLE_INFORMATION_MAX_SIZE];
	int house_number;
	int flat_number;
} private_home_address;

typedef struct private_home
{
	struct student_personal_information student;
	struct private_home_address 		address;
} private_home;

typedef union students_accommodation_information
{
	int is_social_home;
	struct social_home  social_home;
	struct private_home private_home;
} students_accommodation_information;

typedef struct sort_key
{
	int position;
	int int_value;
	char string_value[INPUT_STRING_MAX_SIZE];
	double double_value;
} sort_key;

#endif

int get_menu_status();

void menu_comprator_by_menu_status(int menu_status, union students_accommodation_information *input_table_information, int *input_table_information_size, char const *argv[]);
