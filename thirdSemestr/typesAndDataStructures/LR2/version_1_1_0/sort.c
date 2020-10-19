#include "sort.h"
#include "time.h"
#include "comparators.h"
#include "io.h"

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

double get_time_sort_by_field(struct sort_key *input_vector, int input_vector_size, int key_to_sort, union students_accommodation_information *input_table_information, int flag, int sort_flag)
{
	clock_t start_qsort = clock();
	if (sort_flag == 1)
	{
		//clock_t start_qsort = clock();
		bubble_sort(input_vector, input_vector_size);
		//clock_t end_qsort = clock();
	}
	else if (sort_flag == 2)
	{
		
		qsort(input_vector, input_vector_size, sizeof(sort_key), comp_double);
		
	}
	clock_t end_qsort = clock();

	if (flag == SUCCESS_STATUS)
	{
		printf("\nТаблица ключей отсортированных данных в исходном файле\n");
		printf("┌───────┬──────────┬───────────┬─────────────┬────────────┬────┬────────┬──────────┬─────────────────────┬─────────────────┬───────────┬────────────┐\n");
		
		printf("│     № │ Значение ");

		printf("│ %.18s", "Тип");
		output_spaces(strlen("Тип"), 10);

		printf("│ %.20s", "Фамилия");
		output_spaces(strlen("Фамилия"), 12);

		printf("│ %.20s", "Имя");
		output_spaces(strlen("Имя"), 11);

		printf("│ %.20s", "Пол");
		output_spaces(strlen("Пол"), 3);

		printf("│ %.20s", "Возраст");
		output_spaces(strlen("Возраст"), 7);

		printf("│ %.20s", "Ср. балл");
		output_spaces(strlen("Ср. балл"), 8);

		printf("│ %.25s", "Ул. дома");
		output_spaces(strlen("Ул. дома"), 19);

		printf("│ %.20s", "№ Дома/Общ.");
		output_spaces(strlen("№ Дома/Общ."), 15);

		printf("│ %.20s", "№ Кв./Ком.");
		output_spaces(strlen("№ Кв./Ком."), 7);

		printf("│ %.20s", "Дата пос-я");
		output_spaces(strlen("Дата пос-я"), 10);

		printf("│\n");

		printf("├───────┼──────────┼───────────┼─────────────┼────────────┼────┼────────┼──────────┼─────────────────────┼─────────────────┼───────────┼────────────┤\n");

		// printf("┌───────┬──────────┐\n");
		// printf("│     № │ Значение │\n");
		// printf("├───────┼──────────┤\n");
		for (int i = 0; i < input_vector_size; i++)
		{	
			printf("│ %5.1d │ %8.1lf ", input_vector[i].position, input_vector[i].double_value);
			//output_person(input_table_information[input_vector[i].position]);
			
			if (input_table_information[input_vector[i].position].social_home.is_social_home == SUCCESS_STATUS)
		{
			printf("│ %12.18s ", "Общежитие");

			printf("│ %.20s ", input_table_information[input_vector[i].position].social_home.student.surname);
			output_spaces(strlen(input_table_information[input_vector[i].position].social_home.student.surname), 11);

			printf("│ %.20s ", input_table_information[input_vector[i].position].social_home.student.name);
			output_spaces(strlen(input_table_information[input_vector[i].position].social_home.student.name), 10);

			if (input_table_information[input_vector[i].position].social_home.student.gender == 1)
				printf("│ М  ");
			else
				printf("│ Ж  ");

			printf("│ %0.1d     ", input_table_information[input_vector[i].position].social_home.student.age);

			printf("│ %5.1lf    ", input_table_information[input_vector[i].position].social_home.student.average_score_per_session);

			printf("│ %.25s ", "-");
			output_spaces(strlen("-"), 18);

			printf("│ %3.1d             ", input_table_information[input_vector[i].position].social_home.address.house_number);

			printf("│ %5.1d     ", input_table_information[input_vector[i].position].social_home.address.room_number);

			printf("│ %2.1d.%2.1d.%2.1d │\n",  input_table_information[input_vector[i].position].social_home.student.receipt_date.day, input_table_information[input_vector[i].position].social_home.student.receipt_date.month, input_table_information[input_vector[i].position].social_home.student.receipt_date.year);
		}
		else
		{
			printf("│ %12.18s ", "Дом");

			printf("│ %.20s ", input_table_information[input_vector[i].position].private_home.student.surname);
			output_spaces(strlen(input_table_information[input_vector[i].position].private_home.student.surname), 11);

			printf("│ %.20s ", input_table_information[input_vector[i].position].private_home.student.name);
			output_spaces(strlen(input_table_information[input_vector[i].position].private_home.student.name), 10);

			if (input_table_information[input_vector[i].position].social_home.student.gender == 1)
				printf("│ М  ");
			else
				printf("│ Ж  ");

			printf("│ %0.1d     ", input_table_information[input_vector[i].position].private_home.student.age);

			printf("│ %5.1lf    ", input_table_information[input_vector[i].position].private_home.student.average_score_per_session);

			printf("│ %.25s ", input_table_information[input_vector[i].position].private_home.address.street);
			output_spaces(strlen(input_table_information[input_vector[i].position].private_home.address.street), 19);

			printf("│ %3.1d             ", input_table_information[input_vector[i].position].private_home.address.house_number);

			printf("│ %5.1d     ", input_table_information[input_vector[i].position].private_home.address.flat_number);

			printf("│ %2.1d.%2.1d.%2.1d │\n",  input_table_information[input_vector[i].position].private_home.student.receipt_date.day, input_table_information[input_vector[i].position].private_home.student.receipt_date.month, input_table_information[input_vector[i].position].private_home.student.receipt_date.year);
		
		}

			if (i != input_vector_size - 1)
			{
				// printf("├───────────┼─────────────┼────────────┼────┼────────┼──────────┼─────────────────────┼─────────────────┼───────────┼────────────┤\n");
		
				printf("├───────┼──────────┼───────────┼─────────────┼────────────┼────┼────────┼──────────┼─────────────────────┼─────────────────┼───────────┼────────────┤\n");
			}
			else
			{
				printf("└───────┴──────────┴───────────┴─────────────┴────────────┴────┴────────┴──────────┴─────────────────────┴─────────────────┴───────────┴────────────┘\n");
			}
		}
	}

	return (double) (end_qsort - start_qsort) / CLOCKS_PER_SEC;
}
