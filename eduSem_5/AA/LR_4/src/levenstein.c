#include "../inc/levenstein.h"

// Проверка длин слова
int is_target_string_longer(char **first_word, char **second_word);

// Своп строк
void swap(char **target, char **source);

// Получение длин слов
void* get_words_lengths(void *args);

// Получение предыдущей строки
void get_previous_row(int **previous_row, int **current_row, int target_length);

// Обновление полученного ряда
void update_current_row(int **current_row, int step, int target_length);

// Минимум
int min(int a, int b);

void out_row(int *row, int target_length);

void *change_rows(void *args);

void *counting_add(void *args);

void *counting_delete(void *args);

void *counting_change(void *args);

// Получение расстояния между словами
void out_levenstein_distance(char *target, char *source)
{
	// Инициализация основного поток вычисления и обработки длин
	pthread_t thread_words_lengths;

	// Результирующая длина
	int result_levenstein_distance = 0;

	// Длины слов
	int target_length = 0, source_length = 0;

	Args_words args_words_lengths;
	args_words_lengths.target = target;
	args_words_lengths.source = source;
	int get_words_length_status = pthread_create(&thread_words_lengths, NULL, get_words_lengths, (void*) &args_words_lengths);

	// Ожидание завершения потока
	pthread_join(thread_words_lengths, NULL);

	// Возврат значений из обработки потока
	target = args_words_lengths.target;
	source = args_words_lengths.source;
	target_length = args_words_lengths.target_length;
	source_length = args_words_lengths.source_length;

	if (get_words_length_status != SUCCESS_STATUS)
		out_error_message();

	// Выделение памяти под текущую строку
	int *current_row = (int*) malloc(MAX_WORD_SIZE);

	for (int check_cur = 0; check_cur < target_length + 1; check_cur++)
		current_row[check_cur] = check_cur;

	for (int i = 1; i < source_length + 1; i++)
	{
		// Инициализация поток заполнения ряда
		pthread_t thread_filling_rows;

		// Выделение памяти
		int *previous_row = (int *) malloc(target_length + 1);

		// Инициализация структуры
		Args_rows args_rows;

		// Установка данных потока
		args_rows.current_row = current_row;
		args_rows.previous_row = previous_row;
		args_rows.target_length = target_length;
		args_rows.i = i;

		// Переназначение 
		int change_rows_status = pthread_create(&thread_filling_rows, NULL, change_rows, (void*) &args_rows);

		// Ожидание завершения потока
		pthread_join(thread_filling_rows, NULL);
		
		// Установка данных из потока
		current_row = args_rows.current_row;
		previous_row = args_rows.previous_row;

		if (change_rows_status != SUCCESS_STATUS)
			out_error_message();

		for (int target_cur = 1; target_cur < target_length + 1; target_cur++)
		{
			// Инициализация структуры
			Args_values args_values;

			// Передача значений в структуру
			args_values.current_row = current_row;
			args_values.previous_row = previous_row;
			args_values.target_cur = target_cur;
			args_values.source = source;
			args_values.target = target;

			// Создание группы параллельных потоков вычислений стоимости
			pthread_t thread_value_counting_add;
			pthread_t thread_value_counting_delete;
			pthread_t thread_value_counting_change;

			// Переназначение 
			int counting_add_status = pthread_create(&thread_value_counting_add, NULL, counting_add, (void*) &args_values);
			int counting_detele_status = pthread_create(&thread_value_counting_delete, NULL, counting_delete, (void*) &args_values);
			int counting_change_status = pthread_create(&thread_value_counting_change, NULL, counting_change, (void*) &args_values);

			// Ожидание завершения потока
			pthread_join(thread_value_counting_add, NULL);
			pthread_join(thread_value_counting_delete, NULL);
			pthread_join(thread_value_counting_change, NULL);

			if (counting_add_status != SUCCESS_STATUS ||
				counting_detele_status != SUCCESS_STATUS || 
				counting_change_status != SUCCESS_STATUS)
				out_error_message();

			current_row[target_cur] = min(min(args_values.add_c, args_values.delete_c), args_values.change_c);
		}

		
	}

	result_levenstein_distance = current_row[target_length];

	out_levestein_get_distance_result(result_levenstein_distance);
}

int min(int a, int b)
{
	if (a < b)
		return a;
	return b;
}

void *counting_add(void *args)
{
	Args_values *arg = (Args_values*) args;

	arg->add_c = arg->previous_row[arg->target_cur] + 1;

	//завершаем поток
	pthread_exit(0);

	return SUCCESS_STATUS;
}

void *counting_delete(void *args)
{
	Args_values *arg = (Args_values*) args;

	arg->delete_c = arg->current_row[arg->target_cur - 1] + 1;

	pthread_exit(0);

	return SUCCESS_STATUS;
}

void *counting_change(void *args)
{
	Args_values *arg = (Args_values*) args;

	arg->change_c = arg->previous_row[arg->target_cur - 1];

	if (arg->target[arg->target_cur - 1] != arg->source[arg->target_cur - 1])
		arg->change_c += 1;

	pthread_exit(0);

	return SUCCESS_STATUS;
}

void *change_rows(void *args)
{
	Args_rows *arg = (Args_rows*) args;

	for (int check_cur = 0; check_cur < arg->target_length + 1; check_cur++)
	{
		arg->previous_row[check_cur] = arg->current_row[check_cur];

		if (check_cur == 0)
			arg->current_row[check_cur] = arg->i;
		else
			arg->current_row[check_cur] = 0;
	}

	//завершаем поток
	pthread_exit(0);

	return SUCCESS_STATUS;
}

void out_row(int *row, int target_length)
{
	for (int out_cur = 0; out_cur < target_length; out_cur++)
	{
		printf("%d ", row[out_cur]);
	}
	printf("\n");
}

// Обновление полученного ряда
void update_current_row(int **current_row, int step, int target_length)
{
	current_row[0] = &step;

	for (int update_cur = 1; update_cur < target_length + 1; update_cur++)
	{
		current_row[update_cur] = 0;
	}
}

// Получение предыдущей строки
void get_previous_row(int **previous_row, int **current_row, int target_length)
{
	for (int check_cur = 0; check_cur < target_length; check_cur++)
	{
		*(*previous_row + check_cur) = *(*current_row + check_cur);
	}
}

// Своп строк
void swap(char **target, char **source)
{
	char *new_target;

	new_target = *target;
	*target = *source;
	*source = new_target;
}

// Получение длин слов
void* get_words_lengths(void *args)
{
	Args_words *arg = (Args_words*) args;

	arg->target_length = strlen(arg->target);
	arg->source_length = strlen(arg->source);

	// Смена назначений target и source
	if (arg->target_length > arg->source_length)
	{
		swap(&arg->target, &arg->source);

		arg->target_length = strlen(arg->target);
		arg->source_length = strlen(arg->source);
	}

	//завершаем поток
	pthread_exit(0);

	return SUCCESS_STATUS;
}

