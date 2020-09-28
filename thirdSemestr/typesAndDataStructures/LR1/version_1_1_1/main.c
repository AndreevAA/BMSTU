#include "functions.h"
#include "io.h"
#include "multi.h"

int main(int argc, char const *argv[])
{
	int error_code = ERROR_STATUS;

	output_welcome_text();

	number first_number, second_number, answer_number;

	if (scanf_input_numbers(&first_number, &second_number) == SUCCESS_STATUS)
	{
		multi_integer_and_float(&first_number, &second_number, &answer_number);
		
		if (is_right_order(&answer_number) == ERROR_STATUS)
			output_error_text_limit();
		else
			output_multiplied_result(answer_number.mantisa_sign, answer_number.mantisa, answer_number.order_sign, answer_number.order);	
	}
	
	return 0;
}