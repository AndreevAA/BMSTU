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

int is_key_right(char *key)
{
	if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS || strcmp(key, "house_or_campus_number") == SUCCESS_STATUS || strcmp(key, "flat_or_room_number") == SUCCESS_STATUS || strcmp(key, "age") == SUCCESS_STATUS)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}
