#include "multiplication.h"
#include <math.h> 

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

	//printf("%s\n", mantisa);

}

void update_mantisa(int *mantisa, int mantisa_size)
{

	int check_cursor = mantisa_size - 2;

	//if (mantisa[mantisa_size - 2] >= 5 && mantisa[mantisa_size - 2] <= 9)
	while (check_cursor >= 0)
	{
		//printf("%d\n", mantisa[check_cursor]);
		

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
}

void get_multiplied_mantisa(number *first_number, number *second_number, char *mantisa)
{
	//printf("first_number = %s; second_number = %s; second_number_size = %lu\n",first_number->mantisa, second_number->mantisa, strlen(second_number->mantisa) );

	int i = strlen(second_number->mantisa) - 1;
	while (second_number->mantisa[i] < '0' || second_number->mantisa[i] > '9')
	{
		second_number->mantisa[i] = '\0';
		i--;
	}

	//printf("first_number = %s; second_number = %s; second_number_size = %lu\n",first_number->mantisa, second_number->mantisa, strlen(second_number->mantisa) );


	int number_of_decemal_order = 0;
	
	if (is_mantisa_float(second_number->mantisa) == SUCCESS_STATUS)
		number_of_decemal_order = get_number_of_decimal_order(second_number->mantisa);

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
	{

		update_mantisa(answer_number_mantisa_int_vector, answer_number_mantisa_int_vector_size);
	}

	get_transformed_mantisa_to_char_vector(mantisa, answer_number_mantisa_int_vector,answer_number_mantisa_int_vector_size, number_of_decemal_order);

	//printf("%s\n", mantisa);
	//printf("%s\n", );
}

void get_multiplied_order_sign(number *first_number, number *second_number, char *order_sign)
{
	*order_sign = second_number->order_sign;
}

int get_size_int(int number)
{
	int counter = 0;

	if (number == 0)
		return 1;

	while (number > 0)
	{
		number /= 10;
		counter++;
	}

	return counter;
}

void sum_decimal_and_order(char *first_number_mantisa, int number_of_decemal_order, char *second_number_order, char second_number_order_sign, char *second_number_mantisa)
{
	int temp_sum = 0;

	//printf("%d\n",number_of_decemal_order);
	//printf("%s\n", second_number_order);


	int p = strlen(second_number_order) - 1;

	//printf("p = %d\n", p);

	for (int i = 0; i < strlen(second_number_order); i++)
	{
		if (second_number_order_sign == '+')
		{
			//printf("%f\n", char_to_int(second_number_order[i])* (pow(10, p)));
			temp_sum += char_to_int(second_number_order[i]) * (pow(10, p));
		}
		else
			temp_sum -= char_to_int(second_number_order[i]) * (pow(10, p));

		p--;
	}

	//temp_sum += strlen(first_number_mantisa);

	if (second_number_mantisa[0] == '0')
		temp_sum -= number_of_decemal_order;
	else
		temp_sum += number_of_decemal_order;
	//printf("temp_sum = %d, %d, %lu\n", temp_sum, number_of_decemal_order, strlen(first_number_mantisa));
	//second_number_order_sign += number_of_decemal_order;// + strlen(first_number_mantisa);
	//printf("temp_sum = %d\n", temp_sum);
	//printf("%d\n", temp_sum);

	//printf("HERE 1: %d, %s\n", number_of_decemal_order, second_number_order);
	
	int i = get_size_int(temp_sum) - 1;
	
	//printf("i = %d\n", i);
	
	//sprintf("%s\n", second_number_order);

	while (temp_sum > 0)
	{

		second_number_order[i] = int_to_char(temp_sum % 10);
		//printf("%c\n", second_number_order[i]);
		temp_sum /= 10;
		i--;
	}

	//printf("%c\n", second_number_order[strlen(second_number_order) - 1]);
	if (second_number_order[strlen(second_number_order) - 1] == '0')
	{
		//printf("KAKA\n");
		second_number_order[strlen(second_number_order) - 1] = '\0';
	}

	//int i 

	//printf("%s\n", second_number_order);

	temp_sum = 0;
}

void free_mass(char *temp_mass)
{
	int i = strlen(temp_mass) - 1; 
	while (temp_mass[i] < '0' || temp_mass[i] > '9')
	{
		temp_mass[i] = '\0';
		i--;
	}
}

void get_multiplied_order(int first_order_int, int second_order_int, char *first_number_mantisa, char *second_number_order, char *order, int number_of_decemal_order, char second_number_order_sign, char *second_number_mantisa, number *answer_number)
{
	printf("first_order_int = %d, second_order_int = %d\n", first_order_int, second_order_int);

	free_mass(answer_number->mantisa);
	printf("%s\n", answer_number->mantisa);
	printf("%d, %d, %lu\n", first_order_int, second_order_int, strlen(answer_number->mantisa));
	int next_order = + second_order_int - strlen(answer_number->mantisa);

	printf("%lu\n", strlen(answer_number->mantisa));
	printf("next_order = %d\n", next_order);

	int i = strlen(answer_number->mantisa) - 1;

	while (answer_number->mantisa[i] < '0' || answer_number->mantisa[i] > '9')
	{
		answer_number->mantisa[i] = '\0';
		i--;
	}

	int num = 0;
	int p = strlen(second_number_mantisa) - 1;
	while (second_number_mantisa[p] != '.')
	{
		if (second_number_mantisa[p] != '.')
			num++;
		p--;
	}

	//printf("%s\n", answer_number->mantisa);
	//printf("%lu, %d\n", strlen(answer_number->mantisa), num);
	//printf("%lu\n", strlen(answer_number->mantisa) - num - 1);
	//printf("ZERO %s\n", second_number_order);
	int future_order = (strlen(answer_number->mantisa) - 1) - num + strlen(first_number_mantisa) - number_of_decemal_order + 1;

	printf("strlen(answer_number->mantisa) - 1 = %lu, num = %d\n", strlen(answer_number->mantisa) - 2, num);
	printf("answer_number->mantisa = %s\n", answer_number->mantisa);
	printf("future_order = %d\n", future_order);

	if (future_order > 30)
	{
		sum_decimal_and_order(first_number_mantisa, number_of_decemal_order, second_number_order, second_number_order_sign, second_number_mantisa);
		
		for (int i = 0; i < MAX_NUMBERS; i++)
		order[i] = '\0';

		for (int i = 0; i < strlen(second_number_order); i++)
		{
			if (second_number_order[i] >= '0' && second_number_order[i] <= '9')
				(order)[i] = second_number_order[i];
		}
	}
	else
	{
		int temp_sum = 0;
		

		//printf("second_number_order = %s\n", second_number_order);

		free_mass(second_number_order);

		p = strlen(second_number_order) - 1;

		for (int i = 0; i < strlen(second_number_order); i++)
		{
			if (second_number_order_sign == '+')
			{
				//printf("char_to_int(second_number_order[i])* (pow(10, p)) = %f\n", char_to_int(second_number_order[i])* (pow(10, p)));
				temp_sum += char_to_int(second_number_order[i]) * (pow(10, p));
			}
			else
				temp_sum -= char_to_int(second_number_order[i]) * (pow(10, p));

			p--;
		}

		printf("second_number_order = %s\n", second_number_order);

		printf("temp_sum = %d\n", temp_sum);

		printf("future_order = %d, temp_sum = %d\n", future_order, temp_sum);
		future_order += temp_sum;

		printf("future_order = %d, temp_sum = %d\n", future_order, temp_sum);


		int i = get_size_int(future_order) - 1;
		while (i >= 0)
		{
			//printf("%d\n", future_order);
			order[i] = int_to_char(future_order % 10);
			//printf("second_number_order = %s\n", second_number_order);
			future_order /= 10;
			i--;
		}

		free_mass(order);
	}
	//printf("%d, %s\n", number_of_decemal_order, second_number_order);

	
}

void multiply_integer_and_float(number *first_number, number *second_number, number *answer_number)
{
	int number_of_decemal_order = 0;
	
	int i = strlen(second_number->mantisa) - 1;

	while (second_number->mantisa[i] < '0' || second_number->mantisa[i] > '9')
	{
		if (second_number->mantisa[i] != '.')
			second_number->mantisa[i] = '\0';
		i--;
	}

	if (is_mantisa_float(second_number->mantisa) == SUCCESS_STATUS)
	{
		//printf("%s\n", second_number->mantisa);
		if (second_number->mantisa[0] != '0')
		{
			number_of_decemal_order = get_number_of_decimal_order(second_number->mantisa);
		}
		else
			number_of_decemal_order = strlen(second_number->mantisa) - get_number_of_decimal_order(second_number->mantisa) - 1;
	}

	get_multiplied_mantisa_sign(first_number, second_number, &answer_number->mantisa_sign);
	
	//printf("%c\n", first_number->mantisa[0]);
	if (first_number->mantisa[0] == '0' || strcmp(second_number->mantisa, "0.0") == SUCCESS_STATUS)
	{
		//printf("LALAe\n");
		char zero_answer[MAX_NUMBERS] = "0.0";
		for (int i = 0; i < strlen(zero_answer); i++)
			answer_number->mantisa[i] = zero_answer[i];
	}
	else
	{
		//printf("We are HERE1\n");
		get_multiplied_mantisa(first_number, second_number, answer_number->mantisa);

		//update_mantisa(answer_number->mantisa);
		int par = strlen(answer_number->mantisa);

		while (answer_number->mantisa[par] > '9' || answer_number->mantisa[par] <= '0')
		{
			answer_number->mantisa[par] = '\0';
			par--;
		}
	}

	//printf("%s\n", answer_number->order);
	get_multiplied_order_sign(first_number, second_number, &answer_number->order_sign);
	get_multiplied_order(first_number->order_int, second_number->order_int, first_number->mantisa, second_number->order, answer_number->order, number_of_decemal_order, second_number->order_sign, second_number->mantisa, answer_number);
	
	//printf("%s\n", answer_number->order);
	

	//printf("%lu\n", strlen(answer_number->mantisa));

	//printf("%s\n", answer_number->order);
}

void free_masses(number *first_number, number *second_number, number *answer_number)
{
	for (int i = 0; i < strlen(answer_number->order); i++)
	{
		answer_number->order[i] = '\0';
	}
	for (int i = 0; i < strlen(first_number->order); i++)
	{
		first_number->order[i] = '\0';
	}
	for (int i = 0; i < strlen(first_number->order); i++)
	{
		first_number->order[i] = '\0';
	}
}

int is_right_order(number *answer_number)
{
	int temp_sum = 0;

	int p = strlen(answer_number->order);
	// for (int i = 0; i < strlen(answer_number->order); i++)
	// {

	// 	temp_sum += char_to_int(answer_number->order[i]) * (pow(10, p));
	// 	p--;
	// }

	//printf("%s, %d\n",answer_number->order, temp_sum);
	//printf("p = %d\n", p);
	if (p >= 6)
		return ERROR_STATUS;

	return SUCCESS_STATUS;
}

void clear_input_data(number *first_number, number *second_number)
{
	int temp_int_first_number_mantissa[strlen(first_number->mantisa) - 1];
	int temp_int_second_number_mantissa[strlen(second_number->mantisa) - 1];

	int i = strlen(second_number->mantisa) - 1;
	while (i >= 0)
	{
		if (second_number->mantisa[i] < '0' || second_number->mantisa[i] >'9')
			second_number->mantisa[i] = '\0';
		i--;
	}
}

void get_and_multiply()
{
	number first_number, second_number, answer_number;

	if (scanf_input_numbers(&first_number, &second_number) == SUCCESS_STATUS)
	{
		//clear_input_data(&first_number, &second_number);

		multiply_integer_and_float(&first_number, &second_number, &answer_number);
		
		//printf("%s, %s\n", answer_number.mantisa, answer_number.order);
		//printf("%s\n", answer_number.mantisa);
		//printf("%s, %d\n", answer_number.order, strcmp(answer_number.order, "30"));
		if (is_right_order(&answer_number) == ERROR_STATUS)
		{
			printf("");
			//print_multiplied_result(answer_number.mantisa_sign, answer_number.mantisa, answer_number.order_sign, answer_number.order);
			printf("Порядок произведения превышен. Исправьте и повторите попытку.\n");
			//return ERROR_STATUS;
		}
		else
		{
			print_multiplied_result(answer_number.mantisa_sign, answer_number.mantisa, answer_number.order_sign, answer_number.order);
		}	
	}

	for (int i = 0; i < strlen(answer_number.mantisa); i++)
		answer_number.mantisa[i] = '\0';

	for (int i = 0; i < strlen(answer_number.order); i++)
		answer_number.order[i] = '\0';

}
