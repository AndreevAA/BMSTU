#include "../inc/menu.h"
#include "../inc/v_o.h"
#include "../inc/s_o.h"
#include "../inc/io.h"

int scanf_menu_code()
{
	print_menu_input_welcome();
	int temp_menu_code;
	if (scanf("%d", &temp_menu_code))
		return temp_menu_code;
	return ERROR_STATUS;
}

int menu()
{
	print_menu();
	int menu_code = scanf_menu_code();
	if (menu_code == ERROR_STATUS)
		error_input_menu();
	else if (menu_code == EXIT_STATUS)
		return EXIT_STATUS;
	else if (menu_code == V_OPERATION)
		v_operations();
	else if (menu_code == S_OPERATION)
		s_operations();
	return ERROR_STATUS;
}
