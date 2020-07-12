#include <stdio.h>
#define N 10
#define M 10

int input(int **matrix, int *n, int *m);
void transform(int **matrix, int *buffer, int n, int m);
int ismonot(int *matrix, int *m);

int main()
{
	int n = 0, m = 0;

	int buffer[N][M];
	int *matrix[N];
	transform(matrix, *buffer, N, M);

	int error_flag = input(matrix, &n, &m);

	if (!error_flag)
	{
		for (int i = 0; i < n; i++)
		{
			if (m == 1)
			{
				printf("%d ", 0);
			}
			else
			{
				printf("%d ", ismonot(*(matrix + i), &m));
			}
		}
	}
	else
	{
		printf("Error\n");
	}
	return error_flag;
}


int ismonot(int *matrix, int *m)
{
	int par = 0;
	int temp_flag = 1;

	for (int j = 0; j < *m - 1; j++)
	{	
		if (par == 0)
		{
			if (*(matrix + j) < *(matrix + j + 1))
				par = 1;
			else if (*(matrix + j) > *(matrix + j + 1))
			{
				par = 2;
			}
		}
		else if ((par == 1 && *(matrix + j) > *(matrix + j + 1)) || (par == 2 && *(matrix + j) < *(matrix + j + 1)))
			temp_flag = 0;
	}
	if (*(matrix + *m - 2) > *(matrix + *m - 1) && par == 1)
	{
		temp_flag = 0;
	}
	else if (*(matrix + *m - 2) < *(matrix + *m - 1) && par == 2)
	{
		temp_flag = 0;
	}
	return temp_flag;
}

void transform(int **matrix, int *buffer, int n, int m)
{
	for (int i = 0; i < n; i++)
	{
		matrix[i] = buffer + m * i;
	}
}


int input(int **temp, int *n, int *m)
{
	int error_flag_0 = 0;

	// error_flag_0 принимает значени 1, если не удалось считать n и m типа integer, или размер матрицы не входят в границы от 1 до 10 по 
	// по высоте и ширине
	error_flag_0 = ((scanf("%d\n", n) != 1) || (scanf("%d\n", m) != 1) || (*n < 1) || (*n > 10) || (*m < 1) || (*m > 10));
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
