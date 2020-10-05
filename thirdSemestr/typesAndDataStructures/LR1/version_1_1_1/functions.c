#include "functions.h"

int is_right_order(number *answer_number)
{
	if (answer_number->order - 1 > 99999)
		return ERROR_STATUS;

	return SUCCESS_STATUS;
}

int char_to_int(char symbol)
{
	int i = 0;
	char numbers[10] = "0123456789";
	for (; i < 10; i++)
		if (symbol == numbers[i])
			return i;
	return i;
}

int int_to_char(int digit)
{
	int i = 0;
	char numbers[10] = "0123456789";
	for (; i < 10; i++)
		if (digit == i)
			return numbers[i];
	return numbers[i];
}

void free_mass(char *temp_mass)
{
	int right_border = strlen(temp_mass) - 1;
	while (temp_mass[right_border] < '0' || temp_mass[right_border] > '9')
	{
		temp_mass[right_border] = '\0';
		right_border--;
	}	
}
