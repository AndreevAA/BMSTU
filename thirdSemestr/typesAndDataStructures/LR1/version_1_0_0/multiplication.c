#include "multiplication.h"

void get_multiplied_mantisa_sign(number *first_number, number *second_number, char *mantisa_sign);
void get_multiplied_mantisa(number *first_number, number *second_number, char *mantisa);
void get_multiplied_order_sign(number *first_number, number *second_number, char *order_sign);
//void get_multiplied_order(number *first_number, number *second_number, char *order);

int is_mantisa_float(char *temp_string)
{
	for (int i = 0; i < strlen(temp_string); i++)
	{
		if (temp_string[i] == '.')
			return SUCCESS_STATUS;
	}

	return ERROR_STATUS;
}

int get_number_of_decimal_order(char *temp_string)
{
	int check_cursor = strlen(temp_string) - 1;
	
	while (check_cursor >= 0)
	{
		if (temp_string[check_cursor] == '.')
			return check_cursor;
		check_cursor--;
	}

	return check_cursor;
}

void get_multiplied_mantisa_sign(number *first_number, number *second_number, char *mantisa_sign)
{
	if (first_number->mantisa_sign == second_number->mantisa_sign)
		*mantisa_sign = '+';
	else
		*mantisa_sign = '-';
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

int get_temp_number_int_vector(number *temp_number, int *temp_number_int_vector)
{
	int add_cursor = 0;
	for (int check_cursor = 0; check_cursor < strlen(temp_number->mantisa); check_cursor++)
	{
		if (temp_number->mantisa[check_cursor] >= '0' && temp_number->mantisa[check_cursor] <= '9')
		{
			temp_number_int_vector[add_cursor] = char_to_int(temp_number->mantisa[check_cursor]);
			add_cursor++;
		}
	}
	return add_cursor;
}

void multiply_digit_and_int_vector(int temp_digit, int *second_number_mantisa_int_vector, int second_number_mantisa_int_vector_size, int *answer_number_mantisa_int_vector, int right_cursor, int answer_number_mantisa_int_vector_size)
{
	int check_cursor = second_number_mantisa_int_vector_size - 1;

	while (check_cursor >= 0)
	{
		//printf("check_cursor = %d\n", check_cursor);
		int temp_multiplication = temp_digit * second_number_mantisa_int_vector[check_cursor];

		int temp_position = answer_number_mantisa_int_vector_size - (right_cursor) - (second_number_mantisa_int_vector_size - check_cursor) + 1;
			
		if (temp_multiplication >= 10)
		{
			answer_number_mantisa_int_vector[temp_position] = temp_multiplication % 10;
			answer_number_mantisa_int_vector[temp_position - 1] += (temp_multiplication / 10);
		}
		else
		{
			int sum = answer_number_mantisa_int_vector[temp_position] + temp_multiplication;

			if (sum < 10)
				answer_number_mantisa_int_vector[temp_position] += temp_multiplication;
			else
			{
				answer_number_mantisa_int_vector[temp_position] = sum % 10;
				answer_number_mantisa_int_vector[temp_position - 1] += (sum / 10);
			}
		}

		check_cursor--;
	}
}

void fill_by_zero_answer_int_mantisa_vector(int *answer_number_mantisa_int_vector, int answer_number_mantisa_int_vector_size)
{
	for (int i = 0; i < answer_number_mantisa_int_vector_size; i++)
		answer_number_mantisa_int_vector[i] = 0;
}

int get_start_reading_position( int *answer_number_mantisa_int_vector, int answer_number_mantisa_int_vector_size)
{
	int i = 0;
	
	for (; i < answer_number_mantisa_int_vector_size; i++)
	{
		if (answer_number_mantisa_int_vector[i] != 0)
			return i;
	}

	return i;
}

void get_transformed_mantisa_to_char_vector(char *mantisa, int *answer_number_mantisa_int_vector, int answer_number_mantisa_int_vector_size, int number_of_decemal_order)
{
	int start_reading_position = get_start_reading_position(answer_number_mantisa_int_vector, answer_number_mantisa_int_vector_size);

	int add_cursor = 0;
	for (int check_cursor = start_reading_position; check_cursor < answer_number_mantisa_int_vector_size; check_cursor++)
	{	
		if (answer_number_mantisa_int_vector_size - number_of_decemal_order - start_reading_position - 1 == add_cursor)
		{
			mantisa[add_cursor] = '.';
			add_cursor++;
		}
		
		mantisa[add_cursor] = int_to_char(answer_number_mantisa_int_vector[check_cursor]);
		add_cursor++;
	}

}

void get_multiplied_mantisa(number *first_number, number *second_number, char *mantisa)
{
	int number_of_decemal_order = 0;
	if (is_mantisa_float(second_number->mantisa) == SUCCESS_STATUS)
		number_of_decemal_order = get_number_of_decimal_order(second_number->mantisa);

	int first_number_mantisa_int_vector[MAX_NUMBERS], second_number_mantisa_int_vector[MAX_NUMBERS];
	
	int first_number_mantisa_int_vector_size = get_temp_number_int_vector(first_number, first_number_mantisa_int_vector);
	int second_number_mantisa_int_vector_size = get_temp_number_int_vector(second_number, second_number_mantisa_int_vector);

	int answer_number_mantisa_int_vector_size = first_number_mantisa_int_vector_size * second_number_mantisa_int_vector_size + 1;
	int answer_number_mantisa_int_vector[answer_number_mantisa_int_vector_size];
	
	fill_by_zero_answer_int_mantisa_vector(answer_number_mantisa_int_vector, answer_number_mantisa_int_vector_size);

	int cursor_position = first_number_mantisa_int_vector_size - 1;

	while (cursor_position >= 0)
	{
		multiply_digit_and_int_vector(first_number_mantisa_int_vector[cursor_position], second_number_mantisa_int_vector, second_number_mantisa_int_vector_size, answer_number_mantisa_int_vector, first_number_mantisa_int_vector_size -  cursor_position, answer_number_mantisa_int_vector_size);
		cursor_position--;
	}

	get_transformed_mantisa_to_char_vector(mantisa, answer_number_mantisa_int_vector,answer_number_mantisa_int_vector_size, number_of_decemal_order);
}

void get_multiplied_order_sign(number *first_number, number *second_number, char *order_sign)
{
	*order_sign = second_number->order_sign;
}

void get_multiplied_order(char *second_number_order, char *order)
{
	for (int i = 0; i < MAX_NUMBERS; i++)
		order[i] = '\0';

	for (int i = 0; i < strlen(second_number_order); i++)
	{
		if (second_number_order[i] >= '0' && second_number_order[i] <= '9')
			(order)[i] = second_number_order[i];
	}
}

void multiply_integer_and_float(number *first_number, number *second_number, number *answer_number)
{
	get_multiplied_mantisa_sign(first_number, second_number, &answer_number->mantisa_sign);
	get_multiplied_mantisa(first_number, second_number, answer_number->mantisa);
	get_multiplied_order_sign(first_number, second_number, &answer_number->order_sign);
	get_multiplied_order(second_number->order, answer_number->order);
}
