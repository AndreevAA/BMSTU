#include "../inc/config.h"
#include "../inc/levenstein.h"
#include "../inc/io.h"

// Стартовый блок 
int main()
{
	int error_status = ERROR_STATUS;

	char first_word[MAX_WORD_SIZE], second_word[MAX_WORD_SIZE];

	if (scanf("%s", first_word))
		if (scanf("%s", second_word))
			error_status = SUCCESS_STATUS;


	if (error_status == SUCCESS_STATUS)
	{
		out_levenstein_distance(first_word, second_word);
		out_levenstein_distance_parall(first_word, second_word);

		return SUCCESS_STATUS;
	}

	return ERROR_STATUS;
}
