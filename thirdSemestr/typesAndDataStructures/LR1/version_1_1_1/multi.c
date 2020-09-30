#include "multi.h"
#include "io.h"

int get_number_of_symbols_after_E_in_mantisa(number *second_number);
void delete_point_in_float_number_mantisa(number *second_number);
void get_multiplied_mantisa(number *first_number, number *second_number, char *mantisa);
void get_multiplied_mantisa_sign(number *first_number, number *second_number, number *answer_number);

void multi_integer_and_float(number *first_number, number *second_number, number *answer_number)
{
	// printf("first_number: \n");
	// output_multiplied_result(first_number->mantisa_sign, first_number->mantisa, first_number->order_sign, first_number->order);
	// printf("\nsecond_number: \n");
	// output_multiplied_result(second_number->mantisa_sign, second_number->mantisa, second_number->order_sign, second_number->order);
	// printf("\n");

	second_number->order -= get_number_of_symbols_after_E_in_mantisa(second_number);
	//printf("%s\n", second_number->mantisa);
	delete_point_in_float_number_mantisa(second_number);

	// printf("first_number: \n");
	// output_multiplied_result(first_number->mantisa_sign, first_number->mantisa, first_number->order_sign, first_number->order);
	// printf("\nsecond_number: \n");
	// output_multiplied_result(second_number->mantisa_sign, second_number->mantisa, second_number->order_sign, second_number->order);
	// printf("\n");

	get_multiplied_mantisa(first_number, second_number, answer_number->mantisa);

	//printf("%lu\n", second_number->order + strlen(answer_number->mantisa) - 2);
	if ((second_number->order + strlen(answer_number->mantisa) - 2) >= 0)
		answer_number->order_sign = '+';
	else 
		answer_number->order_sign = '-';

	answer_number->order += second_number->order + strlen(answer_number->mantisa) - 2;

	get_multiplied_mantisa_sign(first_number, second_number, answer_number);
}

void get_multiplied_mantisa_sign(number *first_number, number *second_number, number *answer_number)
{
	if (first_number->mantisa_sign == second_number->mantisa_sign)
		answer_number->mantisa_sign = '+';
	else
		answer_number->mantisa_sign = '-';
}

int get_number_of_symbols_after_E_in_mantisa(number *second_number)
{
	int answer = 0, check_cursor = strlen(second_number->mantisa) - 1;

	while(second_number->mantisa[check_cursor] != '.')
	{
		answer++;
		check_cursor--;
	}

	return answer;
}

void delete_point_in_float_number_mantisa(number *second_number)
{
	char future_second_number_mantisa[MAX_NUMBERS];

	free_mass(second_number->mantisa);

	// for (int i = 0; i < strlen(second_number->mantisa) - 1; i++)
	// 	future_second_number_mantisa[i] = '0';

	//printf("%s\n", future_second_number_mantisa);

	int add_cursor = 0;
	for (int i = 0; i < strlen(second_number->mantisa); i++)
	{
		if (second_number->mantisa[i] != '.')
		{

			future_second_number_mantisa[add_cursor] = second_number->mantisa[i];
			//printf("%c\n", future_second_number_mantisa[add_cursor]);
			add_cursor++;
		}
	}

	int right_border = strlen(second_number->mantisa) - 1;
	while (right_border >= 0)
	{
		second_number->mantisa[right_border] = '\0';
		right_border--;
	}

	//printf("%s\n", future_second_number_mantisa);

	for (int i = 0; i < strlen(future_second_number_mantisa); i++)
	{
		second_number->mantisa[i] = future_second_number_mantisa[i];
	}

	//printf("%lu, %d\n", strlen(second_number->mantisa), add_cursor);

	int par = strlen(second_number->mantisa) - 1;
	while (par >= add_cursor)
	{
		second_number->mantisa[par] = '\0';
		par--;
	}

	free_mass(second_number->mantisa);
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
		int temp_multiplication = temp_digit * second_number_mantisa_int_vector[check_cursor];

		int temp_position = answer_number_mantisa_int_vector_size - (right_cursor) - (second_number_mantisa_int_vector_size - check_cursor) + 1;
		
		//printf("%d, %d\n", temp_position, temp_multiplication);	
		if (temp_multiplication >= 10)
		{
			int sum_right = temp_multiplication % 10 + answer_number_mantisa_int_vector[temp_position];
			
			answer_number_mantisa_int_vector[temp_position] = sum_right % 10;
			
			answer_number_mantisa_int_vector[temp_position - 1] += (temp_multiplication / 10) + sum_right / 10;
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

int is_mantisa_float(char *temp_string)
{
	for (int i = 0; i < strlen(temp_string); i++)
	{
		if (temp_string[i] == '.')
			return SUCCESS_STATUS;
	}

	return ERROR_STATUS;
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

	int add_cursor = 2;
	
	mantisa[0] = '0';
	mantisa[1] = '.';

	for (int check_cursor = start_reading_position; check_cursor < answer_number_mantisa_int_vector_size; check_cursor++)
	{	
		mantisa[add_cursor] = int_to_char(answer_number_mantisa_int_vector[check_cursor]);
		add_cursor++;
	}
}

void update_mantisa(int *mantisa, int *mantisa_size)
{
	int check_cursor = *mantisa_size - 1;

	// printf("%d\n", *mantisa_size);

	while (mantisa[*mantisa_size - 1] == 0)
	{
		mantisa[*mantisa_size - 1] = '\0';
		(*mantisa_size)--;
	}

	// printf("%d\n", *mantisa_size);

	// for (int i = 0; i < *mantisa_size; i++)
	// 	printf("%d", mantisa[i]);

	// printf("\n");

	*mantisa_size = check_cursor;

	while (check_cursor >= 0)
	{
		if (mantisa[check_cursor] >= 5)
		{
			mantisa[check_cursor] = 0;

			if (mantisa[check_cursor - 1] < 9)
			{
				mantisa[check_cursor - 1] += 1;
				break;
			}
		}

		check_cursor--;
	}

	mantisa[*mantisa_size - 1] = '\0';
	(*mantisa_size)--;


	if (mantisa[0] == 0)
		for (int i = 1; i < *mantisa_size; i++)
		{
			mantisa[i - 1] = mantisa[i];
		}

	mantisa[*mantisa_size - 1] = '\0';
	mantisa[*mantisa_size - 2] = '\0';

	*mantisa_size -= 2;
	// int par = 0;

	// int search_cursor = 0;

	// while (mantisa[search_cursor] == 0)
	// 	search_cursor++;

	// for (int i = 0; i < mantisa_size; i++)
	// {
	// 	mantisa[i] = mantisa[i + search_cursor];
	// }


	// int right_border = mantisa_size - 1;
	// while (right_border >= mantisa_size - 1 - search_cursor)
	// {
	// 	mantisa[right_border] = '\0';
	// 	printf("YP\n");
	// 	right_border--;
	// }
	// // for (int i = mantisa_size - 1; i >= mantisa_size - 1 - search_cursor; i--)
	// // 	mantisa[i] = '\0';

	// mantisa_size -= search_cursor + 1;
	// printf("%d, %d\n", mantisa_size, search_cursor);

	for (int i = 0; i < *mantisa_size; i++)
		printf("%d", mantisa[i]);

	printf("\n");

	
}

void get_multiplied_mantisa(number *first_number, number *second_number, char *mantisa)
{
	int i = strlen(second_number->mantisa) - 1;
	while (second_number->mantisa[i] < '0' || second_number->mantisa[i] > '9')
	{
		second_number->mantisa[i] = '\0';
		i--;
	}

	int number_of_decemal_order = 0;
	
	int first_number_mantisa_int_vector[MAX_NUMBERS], second_number_mantisa_int_vector[MAX_NUMBERS];
	
	int first_number_mantisa_int_vector_size = get_temp_number_int_vector(first_number, first_number_mantisa_int_vector);
	int second_number_mantisa_int_vector_size = get_temp_number_int_vector(second_number, second_number_mantisa_int_vector);

	int answer_number_mantisa_int_vector_size = first_number_mantisa_int_vector_size + second_number_mantisa_int_vector_size + 1;
	int answer_number_mantisa_int_vector[answer_number_mantisa_int_vector_size];
	
	fill_by_zero_answer_int_mantisa_vector(answer_number_mantisa_int_vector, answer_number_mantisa_int_vector_size);

	int cursor_position = first_number_mantisa_int_vector_size - 1;

	while (cursor_position >= 0)
	{
		multiply_digit_and_int_vector(first_number_mantisa_int_vector[cursor_position], second_number_mantisa_int_vector, second_number_mantisa_int_vector_size, answer_number_mantisa_int_vector, first_number_mantisa_int_vector_size -  cursor_position, answer_number_mantisa_int_vector_size);
		cursor_position--;
	}

	if (answer_number_mantisa_int_vector_size > MAX_MANTISA_SIZE)
		update_mantisa(answer_number_mantisa_int_vector, &answer_number_mantisa_int_vector_size);

	get_transformed_mantisa_to_char_vector(mantisa, answer_number_mantisa_int_vector,answer_number_mantisa_int_vector_size, number_of_decemal_order);

	free_mass(mantisa);
}
