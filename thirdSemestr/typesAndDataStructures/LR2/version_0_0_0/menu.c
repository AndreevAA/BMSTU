#include "menu.h"

int get_menu_status()
{
	char *input_command_text;

	if (scanf("%s", input_command_text) == 1)
	{
		if (strcmp(input_command_text, "EXIT") == SUCCESS_STATUS)
			return INPUT_COMMAND_EXIT;
		else if (strcmp(input_command_text, "PRINT_ALL") == SUCCESS_STATUS)
			return INPUT_COMMAND_PRINT_ALL;
		else if (strcmp(input_command_text, "PRINT_FILTERED_STUDENTS") == SUCCESS_STATUS)
			return INPUT_COMMAND_PRINT_FILTERED_STUDENTS;
		else if (strcmp(input_command_text, "SORT_TABLE_BY_KEY") == SUCCESS_STATUS)
			return INPUT_COMMAND_SORT_TABLE_BY_KEY;
		else if (strcmp(input_command_text, "ADD_NOTE") == SUCCESS_STATUS)
			return INPUT_COMMAND_ADD_NOTE;
		else if (strcmp(input_command_text, "DELETE_NOTE") == SUCCESS_STATUS)
			return INPUT_COMMAND_DELETE_NOTE;
		else if (strcmp(input_command_text, "SAVE_TABLE") == SUCCESS_STATUS)
			return INPUT_COMMAND_SAVE_TABLE;
	}
	
	return INPUT_COMMAND_ERROR;
	
}

void menu_comprator_by_menu_status(int menu_status, struct students_accommodation_information *input_table_information, int input_table_information_size)
{
	if (menu_status == INPUT_COMMAND_PRINT_ALL)
	{
		printf("menu_status == INPUT_COMMAND_PRINT_ALL\n");
	}
	else if (menu_status == INPUT_COMMAND_PRINT_FILTERED_STUDENTS)
	{
		printf("menu_status == INPUT_COMMAND_PRINT_FILTERED_STUDENTS\n");
	}
	else if (menu_status == INPUT_COMMAND_SORT_TABLE_BY_KEY)
	{
		printf("menu_status == INPUT_COMMAND_SORT_TABLE_BY_KEY\n");
	}
	else if (menu_status == INPUT_COMMAND_ADD_NOTE)
	{
		printf("menu_status == INPUT_COMMAND_ADD_NOTE\n");
	}
	else if (menu_status == INPUT_COMMAND_DELETE_NOTE)
	{
		printf("menu_status == INPUT_COMMAND_DELETE_NOTE\n");
	}
}