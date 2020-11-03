#include "../inc/functions.h"

int pow_num(int a, int b);

int char_to_int_number(char *string)
{
	int answer_number = 0;
	for (int check_cursor = 0; check_cursor < strlen(string); check_cursor++)
	{
		int ia = string[check_cursor] - '0';
		answer_number += ia * pow_num(10, strlen(string) - check_cursor - 1);
	}

	return answer_number;
}

int pow_num(int a, int b)
{
	int answer = 1;
	for (int i = 0; i < b; i++)
		answer *= a;
	return answer;
}
