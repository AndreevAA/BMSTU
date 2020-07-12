#include <stdio.h>
#include <stdlib.h>
#define SHIFT 3
#define MAXSUM 10
#define MAX_SIZE 10

void exception();
void output(int **temp, int *num_of_strings, int *num_of_rows);
void transform(int **temp, int *buffer, int num_of_strings, int num_of_rows);
void shift_list_of_elements(int *list_of_elements, int *list_of_elements_size);
void change_matrix(int **temp, int *num_of_strings, int *num_of_rows, int *list_of_elements);


int number_points_sum(int temp_number);
int input_data(int **temp, int *num_of_strings, int *num_of_rows);
int forming_list_of_elements(int **matrix, int *num_of_strings, int *num_of_rows, int *list_of_elements, int *list_of_elements_size);


// Основная функция
int main()
{
	int buffer_matrix[MAX_SIZE][MAX_SIZE], *matrix[MAX_SIZE], list_of_elements[MAX_SIZE * MAX_SIZE]; 														

	transform(matrix, *buffer_matrix, MAX_SIZE, MAX_SIZE);										

	int num_of_strings = 0, num_of_rows = 0, list_of_elements_size = 0, err = input_data(matrix, &num_of_strings, &num_of_rows);	
	
	if (!err)
	{
		err = forming_list_of_elements(matrix, &num_of_strings, &num_of_rows, list_of_elements, &list_of_elements_size); 

		shift_list_of_elements(list_of_elements, &list_of_elements_size);

		change_matrix(matrix, &num_of_strings, &num_of_rows, list_of_elements);		
			
		if (err == 0)
			output(matrix, &num_of_strings, &num_of_rows);														
	}

	if (err == 1)
	{
		exception();
	}

	return err;
}

// Буферное преобразование матрицы
void transform(int **matrix, int *buffer_matrix, int num_of_strings, int num_of_rows)
{
	for (int i = 0; i < num_of_strings; i++)
	{
		matrix[i] = buffer_matrix + num_of_rows * i;
	}
}

// Ввод матрицы с клавиатуры
int input_data(int **matrix, int *num_of_strings, int *num_of_rows) 
{
	int error_flag_0 = 0;
	
	error_flag_0 = ((scanf("%d\n", num_of_strings) != 1) || (scanf("%d\n", num_of_rows) != 1) || (*num_of_strings < 1) || (*num_of_strings > 10) || (*num_of_rows < 1) || (*num_of_rows > 10));
	
	if (!error_flag_0)
	{
		for (int i = 0; i < *num_of_strings; i++)
		{
			for (int j = 0; j < *num_of_rows; j++)
			{
				error_flag_0 = scanf("%d", *(matrix + i) + j) != 1;
			}
		}
	}
	else
	{
		error_flag_0 = 1;
	}
	return error_flag_0;
}

//  Формирование массива элементов больше MAXSUM
int forming_list_of_elements(int **matrix, int *num_of_strings, int *num_of_rows, int *list_of_elements, int *list_of_elements_size)
{
	int error_flag_0 = 0;
	for (int i = 0; i < *num_of_strings; i++)
	{
		for (int j = 0; j < *num_of_rows; j++)
		{
			if (number_points_sum(*(*(matrix + i) + j)) > MAXSUM)
			{
				*(list_of_elements + *list_of_elements_size) = *(*(matrix + i) + j);
				*list_of_elements_size += 1;
			}
		}
	}	
	if (*list_of_elements_size == 0)
		error_flag_0 = 1;
	return error_flag_0;
}

// Сдвиг массива на значение SHIFT
void shift_list_of_elements(int *list_of_elements, int *list_of_elements_size)
{
	for (int shift_step = 0; shift_step < SHIFT; shift_step++) 
	{
		int temp_list_of_elements_number = *(list_of_elements + 0);
		for (int i = 0; i < *list_of_elements_size; i++)
		{
			*(list_of_elements + i) = *(list_of_elements + i + 1);
		}
		*(list_of_elements + *list_of_elements_size - 1) = temp_list_of_elements_number;
	}
}

void change_matrix(int **matrix, int *num_of_strings, int *num_of_rows, int *list_of_elements)
{
	int pointer = 0;
	for (int i = 0; i < *num_of_strings; i++)
	{
		for (int j = 0; j < *num_of_rows; j++)
		{
			if (number_points_sum(*(*(matrix + i) + j)) > MAXSUM)
			{
				*(*(matrix + i) + j) = *(list_of_elements + pointer);
				pointer += 1;
			}
		}
	}
}

// Вывод матрицы на экран
void output(int **matrix, int *num_of_strings, int *num_of_rows)
{
	for (int i = 0; i < *num_of_strings; i++)
	{
		for (int j = 0; j < *num_of_rows; j++)
		{
			printf("%d ", *(*(matrix + i) + j));
		}
		printf("\n");
	}
}

void exception()
{
	printf("%s\n", "Error");
}

// Подсчет и возврат суммы цифры числа
int number_points_sum(int temp_number)
{
	if (temp_number < 0)
		temp_number = -temp_number;
	int ans = 0;
	while (temp_number != 0)
	{	
		ans += temp_number % 10;
		temp_number /= 10;
	}
	return ans;
}


