#include "check.h"

int is_right_argc(int argc)
{
	if (argc == INPUT_ARGC_NUMBER)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int is_right_argv(int argc, char const *argv[])
{
	return SUCCESS_STATUS;
}