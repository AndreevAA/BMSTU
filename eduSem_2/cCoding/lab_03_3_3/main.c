#include <stdio.h>
#include <stdlib.h>

void transform(int **temp, int *buffer, int n, int m);
int input_data(int **temp, int *n, int *m);
void output(int **temp, int *n, int *m);
void sortdiag(int **temp, int *n, int *m);
int min_list(int *temp, int *m);

int main()
{
	printf("%s\n", "Введите размер матрицы: ");
	int buffer[10][11];
	int *temp[10];

	transform(temp, *buffer, 10, 11);

	int n = 0, m = 0;
	int err = input_data(temp, &n, &m);
	
	if (!err)
	{
		sortdiag(temp, &n, &m);
		output(temp, &n, &m);
	}
	else
	{
		printf("%s\n", "Error");
	}
	return err;
}

int min_list(int *temp, int *m)
{
	int ans = *(temp + 0);
	for (int i = 0; i < *m; i++)
	{
		if (*(temp + i) < ans)
		{
			ans = *(temp + i);
		}
	}
	return ans;
}

void output(int **temp, int *n, int *m)
{
	printf("\nМатрица с отсортированными строками по наименьшему элементу: \n");
	for (int i = 0; i < *n; i++)
	{
		for (int j = 0; j < *m; j++)
		{
			printf("%d\n", *(*(temp + i) + j));
		}
	}
}

void sortdiag(int **temp, int *n, int *m)
{
	int *newelement, location, newmin;

	for (int i = 1; i < *n; i++)
	{
		newelement = *(temp + i);
		newmin = min_list(*(temp + i), m);
		location = i - 1;
		while (location >= 0 && min_list(*(temp + location), m) < newmin)
		{
			*(temp + location + 1) = *(temp + location);
			location -= 1;
		}
		*(temp + location + 1) = newelement;
	}
}

int input_data(int **temp, int *n, int *m) 
{
	int error_flag_0 = 0;
	
	error_flag_0 = ((scanf("%d ", n) != 1) || (scanf("%d ", m) != 1) || (*n < 2) || (*n > 10) || (*m < 2) || (*m > 10));
	
	if (!error_flag_0)
	{
		for (int i = 0; i < *n; i++)
		{
			for (int j = 0; j < *m; j++)
			{
				error_flag_0 = scanf("%d", *(temp + i) + j) != 1;
			}
		}
	}

	return error_flag_0;
}

void transform(int **temp, int *buffer, int n, int m)
{
	for (int i = 0; i < n; i++)
	{
		temp[i] = buffer + m * i;
	}
}
