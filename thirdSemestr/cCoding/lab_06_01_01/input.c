#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "input.h"
#include "main.h"

void delete_enter(char * temp_text)
{
	temp_text[strlen(temp_text) - 1] = '\0';
}

void input_data_transomation(char * temp_title, char * temp_name, char * temp_year)
{
	delete_enter(temp_title);
	delete_enter(temp_name);
	delete_enter(temp_year);
}

int read_string(char* temp_string, FILE *operationfile)
{
	if (fgets (temp_string, MAX_SIZE, operationfile) != NULL)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int scanf_input_data(char* temp_title, char* temp_name, char* temp_year, FILE *operationfile)
{
	if (read_string(temp_title, operationfile) == SUCCESS_STATUS && read_string(temp_name, operationfile) == SUCCESS_STATUS && read_string(temp_year, operationfile) == SUCCESS_STATUS)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int check_input_argv(int argc, char *argv[])
{
	int input_error_status = 1;

	if (argc >= MIN_NUM_OF_ARGC && argc <= MAX_NUM_OF_ARGC)
		if (strcmp(argv[2], "title") == SUCCESS_STATUS || strcmp(argv[2], "name") == SUCCESS_STATUS || strcmp(argv[2], "year") == SUCCESS_STATUS)
			input_error_status = SUCCESS_STATUS;

	return input_error_status;
}