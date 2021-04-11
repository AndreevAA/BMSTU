#include "../../inc/menu/checks.h"

int is_choose_build_simple_tree(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_BUILD_SIMPLE_TREE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_build_balanced_tree(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_BUILD_BALANCED_TREE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_build_simple_ddt(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_BUILD_DDT)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_build_balanced_ddt(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_BUILD_BALANCED_DDT)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_build_hash_table(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_BUILD_HASH_TABLE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_print_hash_table(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_PRINT_HASH_TABLE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_search_number_in_hash_table(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_SEARCH_NUMBER_IN_HASH_TABLE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_search_number_in_op_file(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_SEARCH_NUMBER_IN_OP_FILE)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_print_efficiency(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_PRINT_EFFICINCY)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_choose_exit(int temp_menu_status)
{
	if (temp_menu_status == CHOOSE_SEARCH_EXIT)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
