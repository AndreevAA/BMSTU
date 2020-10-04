#include "operations.h"

void allocate_memory_to_input_table_information(struct students_accommodation_information *input_table_information)
{
	for (int add_cursor = 0; add_cursor < INPUT_TABLE_INFORMATION_MAX_SIZE; add_cursor++)
	{
		*all_films[add_cursor].title = '\0';
		*all_films[add_cursor].name = '\0';
		*all_films[add_cursor].year = '\0';
	}
}