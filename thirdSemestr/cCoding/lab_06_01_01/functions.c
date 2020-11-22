#include "functions.h"
#include "math.h"

int char_to_int_number(char *string)
{
	int answer_number = 0;
	for (int check_cursor = 0; check_cursor < strlen(string); check_cursor++)
	{
		int ia = string[check_cursor] - '0';
		answer_number += ia * pow(10, strlen(string) - check_cursor - 1);
	}

	return answer_number;
}
