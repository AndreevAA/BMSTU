#include <stdio.h>
#include <math.h>
#define N 10
#define M 10

void output(int **matrix, int *result, int *m, int *n);
void transform(int **matrix, int *buffer, int n, int m);
void count(int **matrix, int *result, int *n, int *m, int *all_num, int *number);

int check(int matrix, int number);
int input_data(int **matrix, int *n, int *m, int *number);

int main()
{
	int buffer[N][M];
	int *matrix[N];

	transform(matrix, *buffer, N, M);

	int n = 0, m = 0, number = 0;
	int err = input_data(matrix, &n, &m, &number);

	int result[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	
	if (!err)
	{
		int all_num = 0;
		count(matrix, result, &n, &m, &all_num, &number);
		if (all_num == m)
		{
			printf("Error");
			err = 1;
		}
		else
		{
			output(matrix, result, &m, &n);
		}
	}
	else
	{
		printf("Error");
	}
	return err;
}

void count(int **matrix, int *result, int *n, int *m, int *all_num, int *number)
{
	for (int i = 0; i < *n; i++)
	{
		for (int j = 0; j < *m; j++)
		{
			if (check(*(*(matrix + i) + j), *number) == 1)
			{
				if (*(result + j) != 1)
				{
					*(result + j) = 1;
					*all_num += 1;
				}
			}
		}
	}
}

void output(int **matrix, int *result, int *m, int *n)
{
	for (int i = 0; i < *n; i++)
	{
		for (int j = 0; j < *m; j++)
		{
			if (*(result + j) != 1)
			{
				printf("%d ", *(*(matrix + i) + j));
			}
		}
		printf("\n");
	}
}

int check(int temp_number, int number)
{
	if (temp_number < 0)
		temp_number = -temp_number;

	int ans = 0;

	if (temp_number == number)
		ans = 1;
	while (temp_number != 0)
	{	
		if (temp_number % 10 == number)
		{
			ans = 1;
		}
		temp_number /= 10;
	}

	return ans;
}

int input_data(int **matrix, int *n, int *m, int *number)
{
	int error_flag_0 = 0;
	error_flag_0 = ((scanf("%d\n", n) != 1) || (scanf("%d\n", m) != 1) || (*n < 2) || (*n > 10) || (*m < 2) || (*m > 10));
	if (!error_flag_0)
	{
		for (int i = 0; i < *n; i++)
		{
			for (int j = 0; j < *m; j++)
			{
				error_flag_0 = scanf("%d", *(matrix + i) + j) != 1;
			}
		}
	}
	if (!error_flag_0)
	{
		error_flag_0 = ((scanf("%d", number) != 1) || *number < 0 || *number > 9);
	}
	return error_flag_0;
}

void transform(int **matrix, int *buffer, int n, int m)
{
	for (int i = 0; i < n; i++)
	{
		matrix[i] = buffer + m * i;
	}
}

