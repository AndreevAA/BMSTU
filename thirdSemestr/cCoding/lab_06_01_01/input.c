#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "input.h"
#include "main.h"
#include "output.h"

void delete_enter(char * temp_text)
{
	if (temp_text[strlen(temp_text) - 1] == '\n')
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
		{
			// output_data(temp_title, temp_name, temp_year);
		return SUCCESS_STATUS;
		}

	return ERROR_STATUS;
}

int is_data_right(char *data)
{
	int input_error_status = SUCCESS_STATUS;

	for (int i = 0; i < strlen(data); i++)
		if (data[i] > '9' || '0' > data[i])
		{
			input_error_status = ERROR_STATUS;
			break;
		}

	if (data[0] == '0')
		input_error_status = ERROR_STATUS;
	
	if (input_error_status == SUCCESS_STATUS)
		if (atoi(data) >= 2020 || atoi(data) <= 0)
			input_error_status = ERROR_STATUS;

	return input_error_status;
}

int check_input_argv(int argc, char *argv[])
{
	int input_error_status = ERROR_STATUS;

	if (argc >= MIN_NUM_OF_ARGC && argc <= MAX_NUM_OF_ARGC)
	{
		if (strcmp(argv[2], "year") == SUCCESS_STATUS)
		{
			if (argc == MAX_NUM_OF_ARGC && is_data_right(argv[3]) == SUCCESS_STATUS)
				input_error_status = SUCCESS_STATUS;
			else if (argc == MIN_NUM_OF_ARGC)
				input_error_status = SUCCESS_STATUS;
		}
		else if (strcmp(argv[2], "title") == SUCCESS_STATUS || strcmp(argv[2], "name") == SUCCESS_STATUS)
		{
			if (argc == MAX_NUM_OF_ARGC && strlen(argv[3]) <= 25)
			{
				input_error_status = SUCCESS_STATUS;
			}
			else if (argc == MIN_NUM_OF_ARGC)
			{
				input_error_status = SUCCESS_STATUS;
			}
		}
	}

	return input_error_status;
}