#include "main.h"
#include "io.h"
#include "multiplication.h"

int main()
{
	int error_code = ERROR_STATUS;
	number first_number, second_number, answer_number;

	if (scanf_input_numbers(&first_number, &second_number) == SUCCESS_STATUS)
	{
		multiply_integer_and_float(&first_number, &second_number, &answer_number);
		print_multiplied_result(answer_number.mantisa_sign, answer_number.mantisa, answer_number.order_sign, answer_number.order);
	}

	return error_code;
}