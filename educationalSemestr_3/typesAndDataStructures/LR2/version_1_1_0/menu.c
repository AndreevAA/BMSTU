#include "menu.h"
#include "io.h"
#include "operations.h"

int get_menu_status()
{
	char input_command_text[INPUT_STRING_MAX_SIZE];
	output_welcome_command();
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
		else if (strcmp(input_command_text, "GET_KEY_TABLE") == SUCCESS_STATUS)
			return INPUT_COMMAND_GET_KEY_TABLE;
		else if (strcmp(input_command_text, "ADD_NOTE") == SUCCESS_STATUS)
			return INPUT_COMMAND_ADD_NOTE;
		else if (strcmp(input_command_text, "DELETE_NOTE") == SUCCESS_STATUS)
			return INPUT_COMMAND_DELETE_NOTE;
		else if (strcmp(input_command_text, "SAVE_TABLE") == SUCCESS_STATUS)
			return INPUT_COMMAND_SAVE_TABLE;
	}
	return INPUT_COMMAND_ERROR;
	
}

void menu_comprator_by_menu_status(int menu_status, union students_accommodation_information *input_table_information, int *input_table_information_size, char const *argv[])
{
	if (menu_status == INPUT_COMMAND_PRINT_ALL)
		output_all_students(input_table_information, input_table_information_size);
	else if (menu_status == INPUT_COMMAND_PRINT_FILTERED_STUDENTS)
		output_filtered_students(input_table_information, *input_table_information_size);
	else if (menu_status == INPUT_COMMAND_SORT_TABLE_BY_KEY)
		sort_students_by_key(input_table_information, *input_table_information_size);
	else if (menu_status == INPUT_COMMAND_ADD_NOTE)
		*input_table_information_size = add_note(input_table_information, input_table_information_size);
	else if (menu_status == INPUT_COMMAND_DELETE_NOTE)
		*input_table_information_size = delete_note(input_table_information, input_table_information_size);
	else if (menu_status == INPUT_COMMAND_SAVE_TABLE)
		save_information_into_file(argv, input_table_information, input_table_information_size);
	else if (menu_status == INPUT_COMMAND_GET_KEY_TABLE)
		get_key_table(input_table_information, *input_table_information_size);
	else
	{
		printf("Вы указали неверную команду. Попробуйте еще раз...\n");
	}
	
}

