#include "menu.h"
#include "io.h"
#include "operations.h"
#include "check.h"

int main(int argc, char const *argv[])
{
	int errorflag = ERROR_STATUS;

	if (is_right_argc(argc) == SUCCESS_STATUS && is_right_argv(argc, argv) == SUCCESS_STATUS)
	{
		FILE *in_file = fopen(argv[1], "r");

		if (in_file != NULL)
		{
			int input_table_information_size = 0;
			students_accommodation_information input_table_information[INPUT_TABLE_INFORMATION_MAX_SIZE];
			allocate_memory_to_input_table_information(input_table_information);

			if (get_in_file_information(in_file, input_table_information, &input_table_information_size) == SUCCESS_STATUS)
			{
				output_welcome_information();
				int menu_status = get_menu_status();

				while (menu_status != INPUT_COMMAND_EXIT)
				{
					menu_comprator_by_menu_status(menu_status, input_table_information, &input_table_information_size, argv);

					menu_status = get_menu_status();
				}
			}
		}
	}
	return errorflag;
}