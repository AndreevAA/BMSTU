#include "io.h"

int get_input_table_information_size(FILE *in_file);

void output_welcome_information()
{
	printf("Программа обработко текстовых данных запущена.\n");
	printf("Программа умеется выполнять команды:\n");
	printf("\tEXIT - Закрытие программы\n");
	printf("\tPRINT_ALL - Печать всех студентов\n");
	printf("\tPRINT_FILTERED_STUDENTS - Печать только студентов по ключам\n");
	printf("\tSORT_TABLE_BY_KEY - Сортировка таблицы по ключу\n");
	printf("\tADD_NOTE - Добавление записи в таблицу\n");
	printf("\tDELETE_NOTE - Удаление записи из таблицы\n");
	printf("\tSAVE_TABLE - Сохранение изменений\n");
}

void output_welcome_command()
{
	printf("Введите команду: ");
}

void output_head_of_table()
{
	printf("┌───────────┬────────────────┬──────────────┬──────────────┐\n");
	printf("│ %12.18s │ %21.20s │ %15.20s │ %15.20s │ %21.20s │\n", "Тип", "Фамилия", "Имя", "Пол", "Возраст");
}

void output_person(struct students_accommodation_information temp_person)
{
	printf("├───────────┼────────────────┼──────────────┼──────────────┤\n");
	printf("│ %12.18s │ %20.20s │ %.30s │ %6.1d │ %6.1d │ %6.2lf │ %.30s │ %6.1d │ %6.1d │ %d.%d.%d │\n", temp_person.accommodation, temp_person.student.surname, temp_person.student.name, temp_person.student.gender, temp_person.student.age, temp_person.student.average_score_per_session, temp_person.address.street, temp_person.address.house_or_campus_number, temp_person.address.flat_or_room_number, temp_person.student.receipt_date.day, temp_person.student.receipt_date.month, temp_person.student.receipt_date.year);
}

void output_all_students(struct students_accommodation_information *input_table_information, int *input_table_information_size)
{
	if (*input_table_information_size == 0)
		printf("Таблица пуста...");
	else
	{
		output_head_of_table();
		for (int search_cursor = 0; search_cursor < *input_table_information_size; search_cursor++)
		{
			output_person(input_table_information[search_cursor]);
		}
		printf("└────────────────┴──────────────┴──────────────┘\n");
	}
}

void sim_str(char *first, char *second)
{
	for (int i = 0; i < strlen(first); i++)
	{
		second[i] = first[i];
	}
}

int get_in_file_information(FILE *in_file, struct students_accommodation_information *input_table_information, int *input_table_information_size)
{
	*input_table_information_size = get_input_table_information_size(in_file);
	int temp_add_position = 0;

	if (*input_table_information_size <= INPUT_TABLE_INFORMATION_MAX_SIZE)
	{
		while (!feof(in_file))
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

			fscanf(in_file, "%s%s%s", accommodation, surname, name);
			fscanf(in_file, "%d", &gender);
			fscanf(in_file, "%d%lf", &age, &average_score_per_session);
			fscanf(in_file, "%s", street);
			fscanf(in_file, "%d%d%d%d%d", &house_or_campus_number, &flat_or_room_number, &day, &month, &year);

			sim_str(accommodation, input_table_information[temp_add_position].accommodation);
			sim_str(surname, input_table_information[temp_add_position].student.surname);
			sim_str(name, input_table_information[temp_add_position].student.name);
			sim_str(street, input_table_information[temp_add_position].address.street);

			input_table_information[temp_add_position].student.gender = gender;
			input_table_information[temp_add_position].student.age = age;
			input_table_information[temp_add_position].student.average_score_per_session = average_score_per_session;
			input_table_information[temp_add_position].address.house_or_campus_number = house_or_campus_number;
			input_table_information[temp_add_position].address.flat_or_room_number = flat_or_room_number;
			input_table_information[temp_add_position].student.receipt_date.day = day;
			input_table_information[temp_add_position].student.receipt_date.month = month;
			input_table_information[temp_add_position].student.receipt_date.year = year;

			temp_add_position++;
		}

		fclose(in_file);

		return SUCCESS_STATUS;
	}

	return ERROR_STATUS;
}

int get_input_table_information_size(FILE *in_file)
{
	int temp_number;
	fscanf(in_file, "%d", &temp_number);
	return temp_number;
}

void save_information_into_file(char const *argv[], struct students_accommodation_information *input_table_information, int *input_table_information_size)
{
	FILE *out_file = fopen(argv[1], "w");
	fprintf(out_file, "%d\n", *input_table_information_size);
	for (int check_cursor = 0; check_cursor < *input_table_information_size; check_cursor++)
	{
		fprintf(out_file, "%s\n%s\n%s\n%d\n%d\n%lf\n%s\n%d\n%d\n%d\n%d\n%d\n", input_table_information[check_cursor].accommodation, input_table_information[check_cursor].student.surname, input_table_information[check_cursor].student.name, input_table_information[check_cursor].student.gender, input_table_information[check_cursor].student.age, input_table_information[check_cursor].student.average_score_per_session, input_table_information[check_cursor].address.street, input_table_information[check_cursor].address.house_or_campus_number, input_table_information[check_cursor].address.flat_or_room_number, input_table_information[check_cursor].student.receipt_date.day, input_table_information[check_cursor].student.receipt_date.month, input_table_information[check_cursor].student.receipt_date.year);
	}
	fclose(out_file);
}

void output_filtered_students(struct students_accommodation_information *input_table_information, int input_table_information_size)
{
	int day, month, year, number_of_output_students = 0;
	printf("Укажите дату поступления через пробел (ДД ММ ГГ): ");
	scanf("%d%d%d", &day, &month, &year);
	for (int search_cursor = 0; search_cursor < input_table_information_size; search_cursor++)
	{
		if (strcmp(input_table_information[search_cursor].accommodation, "Общежитие") == SUCCESS_STATUS)
		{
			if (day == input_table_information[search_cursor].student.receipt_date.day && month == input_table_information[search_cursor].student.receipt_date.month && year == input_table_information[search_cursor].student.receipt_date.year)
			{
				if (number_of_output_students == 0)
					output_head_of_table();

				output_person(input_table_information[search_cursor]);
				number_of_output_students++;
			}
		}
	}

	if (number_of_output_students == 0)
		printf("Ничего не найдено...\n");
}

