#include "../inc/functions.h"
<<<<<<< HEAD
#include "math.h"
=======

int pow_num(int a, int b);
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4

int char_to_int_number(char *string)
{
	int answer_number = 0;
	for (int check_cursor = 0; check_cursor < strlen(string); check_cursor++)
	{
		int ia = string[check_cursor] - '0';
<<<<<<< HEAD
		answer_number += ia * pow(10, strlen(string) - check_cursor - 1);
=======
		answer_number += ia * pow_num(10, strlen(string) - check_cursor - 1);
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
	}

	return answer_number;
}
<<<<<<< HEAD
=======

int pow_num(int a, int b)
{
	int answer = 1;
	for (int i = 0; i < b; i++)
		answer *= a;
	return answer;
}
>>>>>>> e3f61bf299ee1ac8a886fcd8eb24a5aeea858af4
