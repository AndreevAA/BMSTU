#include "../inc/sort.h"

int update_selected_position(int start_check_point, size_t integer_vector_num, void *integer_vector, int end_check_point, int (*compare)(void *, void *));
void swap(void *first, void *second, size_t size);
int compare(void *first, void *second);

void mysort(void *integer_vector, size_t integer_vector_size, size_t integer_vector_num, int (*compare)(void *, void *))
{
	if (integer_vector && integer_vector_num > 0 && compare != NULL && integer_vector_size > 0)
	{
		for (int input_cursor = 0; input_cursor < integer_vector_size; input_cursor++)
		{
			int selected_position = update_selected_position(input_cursor, integer_vector_num, integer_vector, integer_vector_size, compare);
			swap(((char *)integer_vector) + input_cursor * integer_vector_num, ((char *)integer_vector) + selected_position * integer_vector_num, integer_vector_num);
		}
	}
	else
		return;
}

int compare(void *first, void *second)
{
	return *(int *)first - *(int *)second;
}

void swap(void *first, void *second, size_t size)
{
	if (!first || !second || !size)
		return;
	char *a = first, *b = second;
	while (size)
	{
		char temp = *a;
		*a = *b;
		*b = temp;
		a++, b++, size--;
	}
}

int update_selected_position(int start_check_point, size_t integer_vector_num, void *integer_vector, int end_check_point, int (*compare)(void *, void *))
{
	char *temp_min_digit = ((char *)integer_vector + start_check_point * integer_vector_num);
	int temp_min_digit_position = start_check_point;
	
	for (int temp_check_point = start_check_point; temp_check_point < end_check_point; temp_check_point++)
	{
		if (compare(((char *)integer_vector + temp_check_point * integer_vector_num), temp_min_digit) < 0)
		{
			temp_min_digit = (((char *)integer_vector) + temp_check_point * integer_vector_num);
			temp_min_digit_position = temp_check_point;
		}
	}

	return temp_min_digit_position;
}

