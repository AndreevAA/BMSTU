#include "operations.h"
#include "io.h"

void allocate_memory_to_input_table_information(struct students_accommodation_information *input_table_information)
{
	for (int add_cursor = 0; add_cursor < INPUT_TABLE_INFORMATION_MAX_SIZE; add_cursor++)
	{
		for (int i = 0; i < INPUT_STRING_MAX_SIZE; i++)
		{
			input_table_information[add_cursor].accommodation[i] = '\0';
			input_table_information[add_cursor].student.surname[i] = '\0';
			input_table_information[add_cursor].student.name[i] = '\0';
			input_table_information[add_cursor].address.street[i] = '\0';
		}

		input_table_information[add_cursor].student.age = 0;
		input_table_information[add_cursor].student.gender = 0;
		input_table_information[add_cursor].student.average_score_per_session = 0.0;
		input_table_information[add_cursor].student.receipt_date.day = 0;
		input_table_information[add_cursor].student.receipt_date.month = 0;
		input_table_information[add_cursor].student.receipt_date.year = 0;
		input_table_information[add_cursor].address.house_or_campus_number = 0;
		input_table_information[add_cursor].address.flat_or_room_number = 0;
	}
}

int is_key_right(char *key)
{
	return SUCCESS_STATUS;
}

void sort_students_by_key(struct students_accommodation_information *input_table_information, int input_table_information_size)
{
	char key[INPUT_STRING_MAX_SIZE];
	printf("Доступные ключи сортировки таблицы:\n");
	printf("\t - accommodation\n");
	printf("\t - surname\n");
	printf("\t - name\n");
	printf("\t - gender\n");
	printf("\t - age\n");
	printf("\t - average_score_per_session\n");
	printf("\t - street\n");
	printf("\t - house_or_campus_number\n");
	printf("\t - flat_or_room_number\n");
	printf("\t - date_in\n\n");

	printf("Введите ключ сортировки: ");
	scanf("%s", key);
	if (is_key_right(key) == SUCCESS_STATUS)
	{
		for (int i = input_table_information_size - 1; i >= 0; i--)
	    {
	        for (int j = 0; j < i; j++)
	        {
	        	if (strcmp(key, "accommodation") == SUCCESS_STATUS)
	        	{
	        		if (strcmp(input_table_information[j].accommodation, input_table_information[j + 1].accommodation) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "surname") == SUCCESS_STATUS)
	        	{
	        		if (strcmp(input_table_information[j].student.surname, input_table_information[j + 1].student.surname) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "name") == SUCCESS_STATUS)
	        	{
	        		if (strcmp(input_table_information[j].student.name, input_table_information[j + 1].student.name) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "gender") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].student.gender > input_table_information[j + 1].student.gender)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "age") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].student.age > input_table_information[j + 1].student.age)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "average_score_per_session") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].student.average_score_per_session > input_table_information[j + 1].student.average_score_per_session)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "street") == SUCCESS_STATUS)
	        	{
	        		if (strcmp(input_table_information[j].address.street, input_table_information[j + 1].address.street) > 0)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "house_or_campus_number") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].address.house_or_campus_number > input_table_information[j + 1].address.house_or_campus_number)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "flat_or_room_number") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].address.flat_or_room_number > input_table_information[j + 1].address.flat_or_room_number)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
	        	else if (strcmp(key, "date_in") == SUCCESS_STATUS)
	        	{
	        		if (input_table_information[j].student.receipt_date.day + input_table_information[j].student.receipt_date.month * 30 + input_table_information[j].student.receipt_date.year * 360 > input_table_information[j + 1].student.receipt_date.day + input_table_information[j + 1].student.receipt_date.month * 30 + input_table_information[j + 1].student.receipt_date.year * 360)
	        		{
	        			students_accommodation_information tmp = input_table_information[j];
		                input_table_information[j] = input_table_information[j + 1];
		                input_table_information[j + 1] = tmp;
	        		}
	        	}
				else
				{
					printf("Вы ввели некорректный ключ. Попробуйте заново...\n");
					break;
				}
	        }
	    }
	}
	else
	{
		printf("Вы ввели некорректный ключ. Попробуйте заново...\n");
	}
}

int delete_note(struct students_accommodation_information *input_table_information, int *input_table_information_size)
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
	int house_or_campus_number;
	int flat_or_room_number;

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

	printf("Введите улицу: ");
	scanf("%s", street);

	if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		printf("Введите номер общежития: ");
		scanf("%d", &house_or_campus_number);

		printf("Укажите номер комнаты: ");
		scanf("%d", &flat_or_room_number);
	}
	else if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		printf("Введите номер дома: ");
		scanf("%d", &house_or_campus_number);

		printf("Укажите номер квартивы: ");
		scanf("%d", &flat_or_room_number);
	}

	printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
	scanf("%d%d%d", &day, &month, &year);

	for (int check_cursor = 0; check_cursor < *input_table_information_size; check_cursor++)
	{
		int par = SUCCESS_STATUS;

		if (strcmp(input_table_information[check_cursor].accommodation, accommodation) == SUCCESS_STATUS)
			if (strcmp(input_table_information[check_cursor].student.surname, surname) == SUCCESS_STATUS && strcmp(input_table_information[check_cursor].student.name, name) == SUCCESS_STATUS)
				if (input_table_information[check_cursor].student.gender == gender && input_table_information[check_cursor].student.age == age && input_table_information[check_cursor].student.average_score_per_session == average_score_per_session)
					if (strcmp(input_table_information[check_cursor].address.street, street) == SUCCESS_STATUS && input_table_information[check_cursor].address.house_or_campus_number == house_or_campus_number && input_table_information[check_cursor].address.flat_or_room_number == flat_or_room_number)
						if (input_table_information[check_cursor].student.receipt_date.day == day && input_table_information[check_cursor].student.receipt_date.month == month && input_table_information[check_cursor].student.receipt_date.year == year)
							par = ERROR_STATUS;

		if (par == SUCCESS_STATUS)
		{
			sim_str(accommodation, temp_table_information[temp_table_information_size].accommodation);
			sim_str(surname, temp_table_information[temp_table_information_size].student.surname);
			sim_str(name, temp_table_information[temp_table_information_size].student.name);
			sim_str(street, temp_table_information[temp_table_information_size].address.street);

			temp_table_information[temp_table_information_size].student.gender = gender;
			temp_table_information[temp_table_information_size].student.age = age;
			temp_table_information[temp_table_information_size].student.average_score_per_session = average_score_per_session;
			temp_table_information[temp_table_information_size].address.house_or_campus_number = house_or_campus_number;
			temp_table_information[temp_table_information_size].address.flat_or_room_number = flat_or_room_number;
			temp_table_information[temp_table_information_size].student.receipt_date.day = day;
			temp_table_information[temp_table_information_size].student.receipt_date.month = month;
			temp_table_information[temp_table_information_size].student.receipt_date.year = year;

			temp_table_information_size++;
		}
	}

	allocate_memory_to_input_table_information(input_table_information);

	for (int check_cursor = 0; check_cursor < temp_table_information_size; check_cursor++)
	{
		sim_str(temp_table_information[check_cursor].accommodation, input_table_information[check_cursor].accommodation);
		sim_str(temp_table_information[check_cursor].student.surname, input_table_information[check_cursor].student.surname);
		sim_str(temp_table_information[check_cursor].student.name, input_table_information[check_cursor].student.name);
		sim_str(temp_table_information[check_cursor].address.street, input_table_information[check_cursor].address.street);

		input_table_information[check_cursor].student.gender = temp_table_information[check_cursor].student.gender;
		input_table_information[check_cursor].student.age = temp_table_information[check_cursor].student.age;
		input_table_information[check_cursor].student.average_score_per_session = temp_table_information[check_cursor].student.average_score_per_session;
		input_table_information[check_cursor].address.house_or_campus_number = temp_table_information[check_cursor].address.house_or_campus_number;
		input_table_information[check_cursor].address.flat_or_room_number = temp_table_information[check_cursor].address.flat_or_room_number;
		input_table_information[check_cursor].student.receipt_date.day = temp_table_information[check_cursor].student.receipt_date.day;
		input_table_information[check_cursor].student.receipt_date.month = temp_table_information[check_cursor].student.receipt_date.month;
		input_table_information[check_cursor].student.receipt_date.year = temp_table_information[check_cursor].student.receipt_date.year;
	}

	return(temp_table_information_size);
}

int add_note(struct students_accommodation_information *input_table_information, int *input_table_information_size)
{
	char accommodation[INPUT_STRING_MAX_SIZE];

	char surname[INPUT_STRING_MAX_SIZE];
	char name[INPUT_STRING_MAX_SIZE];
	int gender;
	int age;
	double average_score_per_session;

	char street[INPUT_TABLE_INFORMATION_MAX_SIZE];
	int house_or_campus_number;
	int flat_or_room_number;

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

	printf("Введите улицу: ");
	scanf("%s", street);

	if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		printf("Введите номер общежития: ");
		scanf("%d", &house_or_campus_number);

		printf("Укажите номер комнаты: ");
		scanf("%d", &flat_or_room_number);
	}
	else if (strcmp(accommodation, "Общежитие") == SUCCESS_STATUS)
	{
		printf("Введите номер дома: ");
		scanf("%d", &house_or_campus_number);

		printf("Укажите номер квартивы: ");
		scanf("%d", &flat_or_room_number);
	}

	printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
	scanf("%d%d%d", &day, &month, &year);

	sim_str(accommodation, input_table_information[*input_table_information_size].accommodation);
	sim_str(surname, input_table_information[*input_table_information_size].student.surname);
	sim_str(name, input_table_information[*input_table_information_size].student.name);
	sim_str(street, input_table_information[*input_table_information_size].address.street);

	input_table_information[*input_table_information_size].student.gender = gender;
	input_table_information[*input_table_information_size].student.age = age;
	input_table_information[*input_table_information_size].student.average_score_per_session = average_score_per_session;
	input_table_information[*input_table_information_size].address.house_or_campus_number = house_or_campus_number;
	input_table_information[*input_table_information_size].address.flat_or_room_number = flat_or_room_number;
	input_table_information[*input_table_information_size].student.receipt_date.day = day;
	input_table_information[*input_table_information_size].student.receipt_date.month = month;
	input_table_information[*input_table_information_size].student.receipt_date.year = year;

	*input_table_information_size += 1;

	return *input_table_information_size;
}


