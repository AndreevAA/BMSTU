#include "operations.h"
#include "io.h"
#include "time.h"

void allocate_memory_to_input_table_information(union students_accommodation_information *input_table_information)
{
	for (int add_cursor = 0; add_cursor < INPUT_TABLE_INFORMATION_MAX_SIZE; add_cursor++)
	{
		for (int i = 0; i < INPUT_STRING_MAX_SIZE; i++)
		{
			input_table_information[add_cursor].private_home.student.surname[i] = '\0';
			input_table_information[add_cursor].social_home.student.surname[i] = '\0';

			input_table_information[add_cursor].private_home.student.name[i] = '\0';
			input_table_information[add_cursor].social_home.student.name[i] = '\0';

			input_table_information[add_cursor].private_home.address.street[i] = '\0';
		}

		input_table_information[add_cursor].private_home.student.age = 0;
		input_table_information[add_cursor].social_home.student.age = 0;

		input_table_information[add_cursor].private_home.student.gender = 0;
		input_table_information[add_cursor].social_home.student.gender = 0;
		
		input_table_information[add_cursor].private_home.student.average_score_per_session = 0.0;
		input_table_information[add_cursor].social_home.student.average_score_per_session = 0.0;
		
		input_table_information[add_cursor].private_home.student.receipt_date.day = 0;
		input_table_information[add_cursor].social_home.student.receipt_date.day = 0;
		
		input_table_information[add_cursor].private_home.student.receipt_date.month = 0;
		input_table_information[add_cursor].social_home.student.receipt_date.month = 0;
		
		input_table_information[add_cursor].private_home.student.receipt_date.year = 0;
		input_table_information[add_cursor].social_home.student.receipt_date.year = 0;
		
		input_table_information[add_cursor].private_home.address.house_number = 0;
		input_table_information[add_cursor].social_home.address.house_number = 0;

		input_table_information[add_cursor].private_home.address.flat_number = 0;
		input_table_information[add_cursor].social_home.address.room_number = 0;
	}
}

int is_key_right(char *key)
{
 	// if (strcmp(key, "accommodation") == SUCCESS_STATUS || strcmp(key, "surname") == SUCCESS_STATUS || strcmp(key, "age") == SUCCESS_STATUS  || strcmp(key, "name") == SUCCESS_STATUS || strcmp(key, "gender") == SUCCESS_STATUS || strcmp(key, "average_score_per_session") == SUCCESS_STATUS || strcmp(key, "street") == SUCCESS_STATUS || strcmp(key, "house_or_campus_number") == SUCCESS_STATUS || strcmp(key, "flat_or_room_number") == SUCCESS_STATUS || strcmp(key, "date_in") == SUCCESS_STATUS)
		// return SUCCESS_STATUS;
	if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS || strcmp(key, "house_or_campus_number") == SUCCESS_STATUS || strcmp(key, "flat_or_room_number") == SUCCESS_STATUS || strcmp(key, "date_in") == SUCCESS_STATUS || strcmp(key, "age") == SUCCESS_STATUS)
		return SUCCESS_STATUS;
	return ERROR_STATUS;
}

int get_sort_status(union students_accommodation_information *input_table_information, int left, int right, char *key)
{
	if (strcmp(key, "accommodation") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS && input_table_information[right].social_home.is_social_home == ERROR_STATUS)
		{
			return 1;
		}
		return 0;
	}
	else if (strcmp(key, "surname") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp(input_table_information[left].social_home.student.surname, input_table_information[left].social_home.student.surname);
			else
				return strcmp(input_table_information[left].social_home.student.surname, input_table_information[left].private_home.student.surname);
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp(input_table_information[left].private_home.student.surname, input_table_information[left].social_home.student.surname);
			else
				return strcmp(input_table_information[left].private_home.student.surname, input_table_information[left].private_home.student.surname);
		}
	}
	else if (strcmp(key, "name") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp(input_table_information[left].social_home.student.name, input_table_information[left].social_home.student.name);
			else
				return strcmp(input_table_information[left].social_home.student.name, input_table_information[left].private_home.student.name);
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp(input_table_information[left].private_home.student.name, input_table_information[left].social_home.student.name);
			else
				return strcmp(input_table_information[left].private_home.student.name, input_table_information[left].private_home.student.name);
		}
	}
	else if (strcmp(key, "gender") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].social_home.student.gender < input_table_information[left].social_home.student.gender;
			else
				return input_table_information[left].social_home.student.gender < input_table_information[left].private_home.student.gender;
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].private_home.student.gender < input_table_information[left].social_home.student.gender;
			else
				return input_table_information[left].private_home.student.gender < input_table_information[left].private_home.student.gender;
		}
	}
	else if (strcmp(key, "age") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].social_home.student.age < input_table_information[left].social_home.student.age;
			else
				return input_table_information[left].social_home.student.age < input_table_information[left].private_home.student.age;
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].private_home.student.age < input_table_information[left].social_home.student.age;
			else
				return input_table_information[left].private_home.student.age < input_table_information[left].private_home.student.age;
		}
	}
	else if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].social_home.student.average_score_per_session < input_table_information[left].social_home.student.average_score_per_session;
			else
				return input_table_information[left].social_home.student.average_score_per_session < input_table_information[left].private_home.student.average_score_per_session;
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].private_home.student.average_score_per_session < input_table_information[left].social_home.student.average_score_per_session;
			else
				return input_table_information[left].private_home.student.average_score_per_session < input_table_information[left].private_home.student.average_score_per_session;
		}
	}
	else if (strcmp(key, "street") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp("-", "-");
			else
				return strcmp("-", input_table_information[left].private_home.address.street);
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return strcmp(input_table_information[left].private_home.address.street, "-");
			else
				return strcmp(input_table_information[left].private_home.address.street, input_table_information[left].private_home.address.street);
		}
	}
	else if (strcmp(key, "house_or_campus_number") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].social_home.address.house_number < input_table_information[left].social_home.address.house_number;
			else
				return input_table_information[left].social_home.address.house_number < input_table_information[left].private_home.address.house_number;
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].private_home.address.house_number < input_table_information[left].social_home.address.house_number;
			else
				return input_table_information[left].private_home.address.house_number < input_table_information[left].private_home.address.house_number;
		}
	}
	else if (strcmp(key, "flat_or_room_number") == SUCCESS_STATUS)
	{
		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].social_home.address.room_number < input_table_information[left].social_home.address.room_number;
			else
				return input_table_information[left].social_home.address.room_number < input_table_information[left].private_home.address.flat_number;
		}
		else
		{
			if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
				return input_table_information[left].private_home.address.flat_number < input_table_information[left].social_home.address.room_number;
			else
				return input_table_information[left].private_home.address.flat_number < input_table_information[left].private_home.address.flat_number;
		}
	}
	else if (strcmp(key, "date_in") == SUCCESS_STATUS)
	{
		int first, second;

		if (input_table_information[left].social_home.is_social_home == SUCCESS_STATUS)
			first = input_table_information[left].social_home.student.receipt_date.day + input_table_information[left].social_home.student.receipt_date.month * 30 + input_table_information[left].social_home.student.receipt_date.year * 360;
		else 
			first = input_table_information[left].private_home.student.receipt_date.day + input_table_information[left].private_home.student.receipt_date.month * 30 + input_table_information[left].private_home.student.receipt_date.year * 360;
		

		if (input_table_information[right].social_home.is_social_home == SUCCESS_STATUS)
			second = input_table_information[right].social_home.student.receipt_date.day + input_table_information[right].social_home.student.receipt_date.month * 30 + input_table_information[right].social_home.student.receipt_date.year * 360;
		else 
			second = input_table_information[right].private_home.student.receipt_date.day + input_table_information[right].private_home.student.receipt_date.month * 30 + input_table_information[right].private_home.student.receipt_date.year * 360;
		return first < second;
	}

	return -1;
}

void qs(union students_accommodation_information *s_arr, int first, int last, char *key)
{
    if (first < last)
    {
        int left = first, right = last, middle = (left + right) / 2;
        do
        {
        	//printf("asksa\n");
            while (get_sort_status(s_arr, left, middle, key) > 0) left++;
            while (get_sort_status(s_arr, middle, right, key) < 0) right--;
            if (left <= right)
            {
                students_accommodation_information tmp = s_arr[left];

                allocate_memory_to_input_table_information(s_arr);
                s_arr[left] = s_arr[right];
                s_arr[right] = tmp;
                left++;
                right--;
            }
        } while (left <= right);

        qs(s_arr, first, right, key);
        qs(s_arr, left, last, key);
    }
}

int comp_double (const void *i, const void *j)
{
	return ((sort_key*)i)->double_value < ((sort_key*)j)->double_value;
}

void bubble_sort(struct sort_key *input_vector, int input_vector_size)
{
	sort_key tmp;
	for (int i = input_vector_size - 1; i >= 0; i--)
        for (int j = 0; j < i; j++)
            if (input_vector[j].double_value > input_vector[j + 1].double_value)
            {
                tmp = input_vector[j];
                input_vector[j] = input_vector[j + 1];
                input_vector[j + 1] = tmp;
            }
}

double get_time_sort_by_field(struct sort_key *input_vector, int input_vector_size, int key_to_sort)
{
	clock_t start_qsort = clock();
	bubble_sort(input_vector, input_vector_size);
	clock_t end_qsort = clock();

	printf("\nТаблица ключей отсортированных данных в исходном файле\n");
	printf("┌───────┬──────────┐\n");
	printf("│     № │ Значение │\n");
	printf("├───────┼──────────┤\n");
	for (int i = 0; i < input_vector_size; i++)
	{	
		printf("│ %5.1d │ %8.1lf │\n", input_vector[i].position, input_vector[i].double_value);
		if (i != input_vector_size - 1)
		{
			printf("├───────┼──────────┤\n");
		}
		else
		{
			printf("└───────┴──────────┘\n");
		}
	}

	return (double) (end_qsort - start_qsort) / CLOCKS_PER_SEC;
}

void sort_students_by_key(union students_accommodation_information *input_table_information, int input_table_information_size)
{
	char key[INPUT_STRING_MAX_SIZE];
	printf("Доступные ключи сортировки таблицы:\n");
	// printf("\t - accommodation\n");
	// printf("\t - surname\n");
	// printf("\t - name\n");
	// printf("\t - gender\n");
	printf("\t - age\n");
	printf("\t - average_score_per_session\n");
	//printf("\t - street\n");
	printf("\t - house_or_campus_number\n");
	printf("\t - flat_or_room_number\n");
	printf("\t - date_in\n\n");

	printf("Введите ключ сортировки: ");
	scanf("%s", key);

	
	if (is_key_right(key) == SUCCESS_STATUS)
	{
		int key_to_sort = 0;
		sort_key key_sort_table[INPUT_TABLE_INFORMATION_MAX_SIZE] ;
		for (int check_cursor = 0; check_cursor < input_table_information_size; check_cursor++)
		{
			if (strcmp(key, "house_or_campus_number") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.address.house_number;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.address.house_number;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			else if (strcmp(key, "age") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.student.age;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.student.age;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			else if (strcmp(key, "date_in") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.student.receipt_date.day + input_table_information[check_cursor].private_home.student.receipt_date.month * 30 + input_table_information[check_cursor].private_home.student.receipt_date.year * 360;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.student.receipt_date.day + input_table_information[check_cursor].social_home.student.receipt_date.month * 30 + input_table_information[check_cursor].social_home.student.receipt_date.year * 360;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			else if (strcmp(key, "flat_or_room_number") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.address.flat_number;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.address.room_number;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			else if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.student.average_score_per_session;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.student.average_score_per_session;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			// else if (strcmp(key, "surname") == SUCCESS_STATUS)
			// {
			// 	if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
			// 		sim_str(input_table_information[check_cursor].private_home.student.surname, key_sort_table[check_cursor].string_value);
			// 	else
			// 		sim_str(input_table_information[check_cursor].social_home.student.surname, key_sort_table[check_cursor].string_value);
			// 	key_to_sort = 2;
			// }
			// else if (strcmp(key, "name") == SUCCESS_STATUS)
			// {
			// 	if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
			// 		sim_str(input_table_information[check_cursor].private_home.student.name, key_sort_table[check_cursor].string_value);
			// 	else
			// 		sim_str(input_table_information[check_cursor].social_home.student.name, key_sort_table[check_cursor].string_value);
			// 	key_to_sort = 2;
			// }
			// else if (strcmp(key, "street") == SUCCESS_STATUS)
			// {
			// 	if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
			// 		sim_str(input_table_information[check_cursor].private_home.address.street, key_sort_table[check_cursor].string_value);
			// 	else
			// 		sim_str("-", key_sort_table[check_cursor].string_value);
			// 	key_to_sort = 2;
			// }
			else if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].private_home.student.average_score_per_session;
				else
					key_sort_table[check_cursor].double_value = input_table_information[check_cursor].social_home.student.average_score_per_session;
				key_to_sort = 3;
				key_sort_table[check_cursor].position = check_cursor;
			}
			
		}

		clock_t start_bubble = clock();
		for (int i = input_table_information_size - 1; i >= 0; i--)
	    {
	        for (int j = 0; j < i; j++)
	        {
	        	if (strcmp(key, "accommodation") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "surname") == SUCCESS_STATUS)
	        	{
	        		char first[INPUT_STRING_MAX_SIZE];
	        		char second[INPUT_STRING_MAX_SIZE];

	        		for (int u = 0; u < INPUT_STRING_MAX_SIZE; u++)
	        		{
	        			first[u] = '\0';
	        			second[u] = '\0';
	        		}

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].social_home.student.surname); u++)
	        				first[u] = input_table_information[j].social_home.student.surname[u];
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].private_home.student.surname); u++)
	        				first[u] = input_table_information[j].private_home.student.surname[u];
	        		}

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].social_home.student.surname); u++)
	        				second[u] = input_table_information[j + 1].social_home.student.surname[u];
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j + 1].private_home.student.surname); u++)
	        				second[u] = input_table_information[j + 1].private_home.student.surname[u];
	        		}

	        		if (strcmp(first, second) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "name") == SUCCESS_STATUS)
	        	{
	        		char first[INPUT_STRING_MAX_SIZE];
	        		char second[INPUT_STRING_MAX_SIZE];

	        		for (int u = 0; u < INPUT_STRING_MAX_SIZE; u++)
	        		{
	        			first[u] = '\0';
	        			second[u] = '\0';
	        		}

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].social_home.student.name); u++)
	        				first[u] = input_table_information[j].social_home.student.name[u];
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].private_home.student.name); u++)
	        				first[u] = input_table_information[j].private_home.student.name[u];
	        		}

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].social_home.student.name); u++)
	        				second[u] = input_table_information[j + 1].social_home.student.name[u];
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j + 1].private_home.student.name); u++)
	        				second[u] = input_table_information[j + 1].private_home.student.name[u];
	        		}

	        		if (strcmp(first, second) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "gender") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.student.gender;
	        		else 
	        			first = input_table_information[j].private_home.student.gender;

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.student.gender;
	        		else 
	        			second = input_table_information[j + 1].private_home.student.gender;

	        		if (first < second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "age") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.student.age;
	        		else 
	        			first = input_table_information[j].private_home.student.age;

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.student.age;
	        		else 
	        			second = input_table_information[j + 1].private_home.student.age;

	        		if (first > second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.student.average_score_per_session;
	        		else 
	        			first = input_table_information[j].private_home.student.average_score_per_session;

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.student.average_score_per_session;
	        		else 
	        			second = input_table_information[j + 1].private_home.student.average_score_per_session;

	        		if (first > second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "street") == SUCCESS_STATUS)
	        	{
	        		char first[INPUT_STRING_MAX_SIZE];
	        		char second[INPUT_STRING_MAX_SIZE];

	        		for (int u = 0; u < INPUT_STRING_MAX_SIZE; u++)
	        		{
	        			first[u] = '\0';
	        			second[u] = '\0';
	        		}

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			first[0] = '-';
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j].private_home.address.street); u++)
	        				first[u] = input_table_information[j].private_home.address.street[u];
	        		}

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        		{
	        			second[0] = '-';
	        		}
	        		else 
	        		{
	        			for (int u = 0; u < strlen(input_table_information[j + 1].private_home.address.street); u++)
	        				second[u] = input_table_information[j + 1].private_home.address.street[u];
	        		}

	        		if (strcmp(first, second) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "house_or_campus_number") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.address.house_number;
	        		else 
	        			first = input_table_information[j].private_home.address.house_number;

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.address.house_number;
	        		else 
	        			second = input_table_information[j + 1].private_home.address.house_number;

	        		if (first > second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "flat_or_room_number") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.address.room_number;
	        		else 
	        			first = input_table_information[j].private_home.address.flat_number;

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.address.room_number;
	        		else 
	        			second = input_table_information[j + 1].private_home.address.flat_number;

	        		if (first > second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "date_in") == SUCCESS_STATUS)
	        	{
	        		int first, second;

	        		if (input_table_information[j].social_home.is_social_home == SUCCESS_STATUS)
	        			first = input_table_information[j].social_home.student.receipt_date.day + input_table_information[j].social_home.student.receipt_date.month * 30 + input_table_information[j].social_home.student.receipt_date.year * 360;
	        		else 
	        			first = input_table_information[j].private_home.student.receipt_date.day + input_table_information[j].private_home.student.receipt_date.month * 30 + input_table_information[j].private_home.student.receipt_date.year * 360;
	        		

	        		if (input_table_information[j + 1].social_home.is_social_home == SUCCESS_STATUS)
	        			second = input_table_information[j + 1].social_home.student.receipt_date.day + input_table_information[j + 1].social_home.student.receipt_date.month * 30 + input_table_information[j + 1].social_home.student.receipt_date.year * 360;
	        		else 
	        			second = input_table_information[j + 1].private_home.student.receipt_date.day + input_table_information[j + 1].private_home.student.receipt_date.month * 30 + input_table_information[j + 1].private_home.student.receipt_date.year * 360;
	        		

	        		if (first > second)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        }
	    }
	    clock_t end_bubble = clock();

		double buble = (double) (end_bubble - start_bubble) / CLOCKS_PER_SEC;
		double q_sort = get_time_sort_by_field(key_sort_table, input_table_information_size, key_to_sort);

		double comp_ans = (1 - (q_sort / buble)) * 100;
		printf("Информация по сортировкам: \n");
		printf("Сортировка не по ключам: %f(сек)\n", buble);
		printf("Сортировка по ключам: %f(сек)\n", q_sort);
		printf("Сортировка по ключам быстрее на: %f%%\n", comp_ans);

	}
	else
	{
		printf("Вы ввели некорректный ключ. Попробуйте заново...\n");
	}
	
}

int delete_note(union students_accommodation_information *input_table_information, int *input_table_information_size)
{
	int temp_table_information_size = 0;
	students_accommodation_information temp_table_information[INPUT_TABLE_INFORMATION_MAX_SIZE];
	allocate_memory_to_input_table_information(temp_table_information);

	char accommodation[INPUT_STRING_MAX_SIZE];

	char surname[INPUT_STRING_MAX_SIZE];
	char name[INPUT_STRING_MAX_SIZE];
	int gender;
	int age;
	double average_score_per_session;

	char street[INPUT_TABLE_INFORMATION_MAX_SIZE];
	int house_number;
	int flat_number, room_number;

	int day;
	int month;
	int year;

	printf("Введите тип жилья Дом/Общежитие: ");
	scanf("%s", accommodation);
	printf("Введите фамилию: ");
	scanf("%s", surname);
	printf("Введите имя: ");
	scanf("%s", name);

	printf("Укажите пол 0/1 (Ж/М): ");
	scanf("%d", &gender);

	printf("Введите возраст: ");
	scanf("%d", &age);

	printf("Введите средний балл за сессию: ");
	scanf("%lf", &average_score_per_session);

	if (strcmp(accommodation, "Дом") == SUCCESS_STATUS)
	{
		printf("Введите улицу: ");
		scanf("%s", street);

		printf("Введите номер дома: ");
		scanf("%d", &house_number);

		printf("Укажите номер квартивы: ");
		scanf("%d", &flat_number);

		printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
		scanf("%d%d%d", &day, &month, &year);
	}
	else if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		
		printf("Введите номер общежития: ");
		scanf("%d", &house_number);

		printf("Укажите номер комнаты: ");
		scanf("%d", &room_number);

		printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
		scanf("%d%d%d", &day, &month, &year);
	}

	for (int check_cursor = 0; check_cursor < *input_table_information_size; check_cursor++)
	{
		if ( input_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
		{	
			
			int par = SUCCESS_STATUS;

			if (strcmp("Дом", accommodation) == SUCCESS_STATUS && strcmp(input_table_information[check_cursor].private_home.student.surname, surname) == SUCCESS_STATUS && strcmp(input_table_information[check_cursor].private_home.student.name, name) == SUCCESS_STATUS)
			{
				if (input_table_information[check_cursor].private_home.student.gender == gender && input_table_information[check_cursor].private_home.student.age == age && input_table_information[check_cursor].private_home.student.average_score_per_session == average_score_per_session)
				{
					if (strcmp(input_table_information[check_cursor].private_home.address.street, street) == SUCCESS_STATUS && input_table_information[check_cursor].private_home.address.house_number == house_number && input_table_information[check_cursor].private_home.address.flat_number == flat_number)
					{
						if (input_table_information[check_cursor].private_home.student.receipt_date.day == day && input_table_information[check_cursor].private_home.student.receipt_date.month == month && input_table_information[check_cursor].private_home.student.receipt_date.year == year)
							{
								par = ERROR_STATUS;
							}
					}
				}
			}

			if (par == SUCCESS_STATUS)
			{
				temp_table_information[temp_table_information_size].social_home.is_social_home = ERROR_STATUS;

				sim_str(input_table_information[check_cursor].private_home.student.surname, temp_table_information[temp_table_information_size].private_home.student.surname);
				sim_str(input_table_information[check_cursor].private_home.student.name, temp_table_information[temp_table_information_size].private_home.student.name);
				sim_str(input_table_information[check_cursor].private_home.address.street, temp_table_information[temp_table_information_size].private_home.address.street);

				temp_table_information[temp_table_information_size].private_home.student.gender = input_table_information[check_cursor].private_home.student.gender;
				temp_table_information[temp_table_information_size].private_home.student.age = input_table_information[check_cursor].private_home.student.age;
				temp_table_information[temp_table_information_size].private_home.student.average_score_per_session = input_table_information[check_cursor].private_home.student.average_score_per_session;

				temp_table_information[temp_table_information_size].private_home.address.house_number = input_table_information[check_cursor].private_home.address.house_number;
				temp_table_information[temp_table_information_size].private_home.address.flat_number = input_table_information[check_cursor].private_home.address.flat_number;
				temp_table_information[temp_table_information_size].private_home.student.receipt_date.day = input_table_information[check_cursor].private_home.student.receipt_date.day;
				temp_table_information[temp_table_information_size].private_home.student.receipt_date.month = input_table_information[check_cursor].private_home.student.receipt_date.month;
				temp_table_information[temp_table_information_size].private_home.student.receipt_date.year = input_table_information[check_cursor].private_home.student.receipt_date.year;

				temp_table_information_size++;
			}
		}

		if (input_table_information[check_cursor].social_home.is_social_home == SUCCESS_STATUS)
		{
			int par = SUCCESS_STATUS;

			if (strcmp("Общежитие", accommodation) == SUCCESS_STATUS &&  strcmp(input_table_information[check_cursor].social_home.student.surname, surname) == SUCCESS_STATUS && strcmp(input_table_information[check_cursor].social_home.student.name, name) == SUCCESS_STATUS)
				if (input_table_information[check_cursor].social_home.student.gender == gender && input_table_information[check_cursor].social_home.student.age == age && input_table_information[check_cursor].social_home.student.average_score_per_session == average_score_per_session)
					if (input_table_information[check_cursor].social_home.address.house_number == house_number && input_table_information[check_cursor].social_home.address.room_number == room_number)
						if (input_table_information[check_cursor].social_home.student.receipt_date.day == day && input_table_information[check_cursor].social_home.student.receipt_date.month == month && input_table_information[check_cursor].social_home.student.receipt_date.year == year)
							par = ERROR_STATUS;

			if (par == SUCCESS_STATUS)
			{

				temp_table_information[temp_table_information_size].social_home.is_social_home = SUCCESS_STATUS;

				sim_str(input_table_information[check_cursor].social_home.student.surname, temp_table_information[temp_table_information_size].social_home.student.surname);
				sim_str(input_table_information[check_cursor].social_home.student.name, temp_table_information[temp_table_information_size].social_home.student.name);
		
				temp_table_information[temp_table_information_size].social_home.student.gender = input_table_information[check_cursor].social_home.student.gender;
				temp_table_information[temp_table_information_size].social_home.student.age = input_table_information[check_cursor].social_home.student.age;
				temp_table_information[temp_table_information_size].social_home.student.average_score_per_session = input_table_information[check_cursor].social_home.student.average_score_per_session;

				temp_table_information[temp_table_information_size].social_home.address.house_number = input_table_information[check_cursor].social_home.address.house_number;
				temp_table_information[temp_table_information_size].social_home.address.room_number = input_table_information[check_cursor].social_home.address.room_number;
				temp_table_information[temp_table_information_size].social_home.student.receipt_date.day = input_table_information[check_cursor].social_home.student.receipt_date.day;
				temp_table_information[temp_table_information_size].social_home.student.receipt_date.month = input_table_information[check_cursor].social_home.student.receipt_date.month;
				temp_table_information[temp_table_information_size].social_home.student.receipt_date.year = input_table_information[check_cursor].social_home.student.receipt_date.year;

				temp_table_information_size++;
			}
		}
	}

	//printf("%d\n", temp_table_information_size);

	allocate_memory_to_input_table_information(input_table_information);

	for (int check_cursor = 0; check_cursor < temp_table_information_size; check_cursor++)
	{
		if (strcmp("Дом", accommodation) == SUCCESS_STATUS && temp_table_information[check_cursor].social_home.is_social_home != SUCCESS_STATUS)
		{
			input_table_information[check_cursor].social_home.is_social_home = ERROR_STATUS;

			sim_str(temp_table_information[check_cursor].private_home.student.surname, input_table_information[check_cursor].private_home.student.surname);
			sim_str(temp_table_information[check_cursor].private_home.student.name, input_table_information[check_cursor].private_home.student.name);
			sim_str(temp_table_information[check_cursor].private_home.address.street, input_table_information[check_cursor].private_home.address.street);

			input_table_information[check_cursor].private_home.student.gender = temp_table_information[check_cursor].private_home.student.gender;
			input_table_information[check_cursor].private_home.student.age = temp_table_information[check_cursor].private_home.student.age;
			input_table_information[check_cursor].private_home.student.average_score_per_session = temp_table_information[check_cursor].private_home.student.average_score_per_session;

			input_table_information[check_cursor].private_home.address.house_number = temp_table_information[check_cursor].private_home.address.house_number;
			input_table_information[check_cursor].private_home.address.flat_number = temp_table_information[check_cursor].private_home.address.flat_number;
			input_table_information[check_cursor].private_home.student.receipt_date.day = temp_table_information[check_cursor].private_home.student.receipt_date.day;
			input_table_information[check_cursor].private_home.student.receipt_date.month = temp_table_information[check_cursor].private_home.student.receipt_date.month;
			input_table_information[check_cursor].private_home.student.receipt_date.year = temp_table_information[check_cursor].private_home.student.receipt_date.year;
		}
		else
		{
			input_table_information[check_cursor].social_home.is_social_home = SUCCESS_STATUS;

			sim_str(temp_table_information[check_cursor].social_home.student.surname, input_table_information[check_cursor].social_home.student.surname);
			sim_str(temp_table_information[check_cursor].social_home.student.name, input_table_information[check_cursor].social_home.student.name);

			input_table_information[check_cursor].social_home.student.gender = temp_table_information[check_cursor].social_home.student.gender;
			input_table_information[check_cursor].social_home.student.age = temp_table_information[check_cursor].social_home.student.age;
			input_table_information[check_cursor].social_home.student.average_score_per_session = temp_table_information[check_cursor].social_home.student.average_score_per_session;

			input_table_information[check_cursor].social_home.address.house_number = temp_table_information[check_cursor].social_home.address.house_number;
			input_table_information[check_cursor].social_home.address.room_number = temp_table_information[check_cursor].social_home.address.room_number;
			input_table_information[check_cursor].social_home.student.receipt_date.day = temp_table_information[check_cursor].social_home.student.receipt_date.day;
			input_table_information[check_cursor].social_home.student.receipt_date.month = temp_table_information[check_cursor].social_home.student.receipt_date.month;
			input_table_information[check_cursor].social_home.student.receipt_date.year = temp_table_information[check_cursor].social_home.student.receipt_date.year;
		}
	}

	return(temp_table_information_size);
}

int add_note(union students_accommodation_information *input_table_information, int *input_table_information_size)
{
	char accommodation[INPUT_STRING_MAX_SIZE];

	char surname[INPUT_STRING_MAX_SIZE];
	char name[INPUT_STRING_MAX_SIZE];
	int gender;
	int age;
	double average_score_per_session;

	char street[INPUT_TABLE_INFORMATION_MAX_SIZE];
	int house_number;
	int flat_number, room_number;

	int day;
	int month;
	int year;

	printf("Введите тип жилья Дом/Общежитие: ");
	scanf("%s", accommodation);
	printf("Введите фамилию: ");
	scanf("%s", surname);
	printf("Введите имя: ");
	scanf("%s", name);

	printf("Укажите пол 0/1 (М/Ж): ");
	scanf("%d", &gender);

	printf("Введите возраст: ");
	scanf("%d", &age);

	printf("Введите средний балл за сессию: ");
	scanf("%lf", &average_score_per_session);

	if (strcmp(accommodation, "Дом") == SUCCESS_STATUS)
	{
		printf("Введите улицу: ");
		scanf("%s", street);

		printf("Введите номер дома: ");
		scanf("%d", &house_number);

		printf("Укажите номер квартивы: ");
		scanf("%d", &flat_number);

		printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
		scanf("%d%d%d", &day, &month, &year);


		input_table_information[*input_table_information_size].social_home.is_social_home = ERROR_STATUS;

		sim_str(surname, input_table_information[*input_table_information_size].private_home.student.surname);
		sim_str(name, input_table_information[*input_table_information_size].private_home.student.name);
		sim_str(street, input_table_information[*input_table_information_size].private_home.address.street);

		input_table_information[*input_table_information_size].private_home.student.gender = gender;
		input_table_information[*input_table_information_size].private_home.student.age = age;
		input_table_information[*input_table_information_size].private_home.student.average_score_per_session = average_score_per_session;

		input_table_information[*input_table_information_size].private_home.address.house_number = house_number;
		input_table_information[*input_table_information_size].private_home.address.flat_number = flat_number;
		input_table_information[*input_table_information_size].private_home.student.receipt_date.day = day;
		input_table_information[*input_table_information_size].private_home.student.receipt_date.month = month;
		input_table_information[*input_table_information_size].private_home.student.receipt_date.year = year;
	}
	else if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		
		printf("Введите номер общежития: ");
		scanf("%d", &house_number);

		printf("Укажите номер комнаты: ");
		scanf("%d", &room_number);

		printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
		scanf("%d%d%d", &day, &month, &year);

		input_table_information[*input_table_information_size].social_home.is_social_home = SUCCESS_STATUS;

		sim_str(surname, input_table_information[*input_table_information_size].social_home.student.surname);
		sim_str(name, input_table_information[*input_table_information_size].social_home.student.name);

		input_table_information[*input_table_information_size].social_home.student.gender = gender;
		input_table_information[*input_table_information_size].social_home.student.age = age;
		input_table_information[*input_table_information_size].social_home.student.average_score_per_session = average_score_per_session;

		input_table_information[*input_table_information_size].social_home.address.house_number = house_number;
		input_table_information[*input_table_information_size].social_home.address.room_number = room_number;
		input_table_information[*input_table_information_size].social_home.student.receipt_date.day = day;
		input_table_information[*input_table_information_size].social_home.student.receipt_date.month = month;
		input_table_information[*input_table_information_size].social_home.student.receipt_date.year = year;
	}

	*input_table_information_size += 1;

	return *input_table_information_size;
}

