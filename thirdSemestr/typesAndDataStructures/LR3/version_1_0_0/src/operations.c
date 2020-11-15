#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#include "../inc/multiplication.h"
#define OK 0
#define ERROR 1

int **rand_matrix(int *row, int *col, int *count)
{
	int fill = 0, read_status = 0;
	printf("\nВведите размер матрицы и процент заполнения.\n");
    printf("\nrow = ");
    read_status += scanf("%d", row);
    printf("\ncol = ");
    read_status += scanf("%d", col);
    printf("\nfill = ");
    read_status += scanf("%d", &fill);
	while (read_status != 3 || fill > 100)
		printf("\nнекоректный ввод , повторите\n");
	
    printf("\nМатрица генерируется...\n");
	int **res = malloc(*row * sizeof(int*));
    printf("int **res = malloc(*row * sizeof(int*));\n");
	for (int i = 0; i < *row; i++)
		res[i] = calloc(*col, sizeof(int));
    printf("HERE1\n");
	*count = (*row * *col * fill) / 100;
    printf("*count = (*row * *col * fill) / 100;\n");
	for (int j = 0; j < *count; j++)
	{
		int x = 0, y = 0;
		while (res[x][y])
		{
    		x = (*row - 1)  * rand()/RAND_MAX;
    		y = (*col - 1) * rand()/RAND_MAX;
		}
		res[x][y] = rand()%1000 + 1;
	}
    printf("HERE2\n");
	return res;
}

unsigned long long tick(void)
{
	unsigned long long d;
	__asm__ __volatile__ ("rdtsc": "=A" (d));
	return d;
}

void statistic(int **matrix, int size_rows, int size_cols, int *A, int *IA, int*JA, int count)
{
	unsigned long long time = tick();
	mult_std_matrix(matrix, size_rows, size_cols, count * 100 / size_cols / size_rows);
	unsigned long long second_time = tick() - time;
    output_stand_stat(second_time, size_cols * size_rows * sizeof(int));
	time = tick();
	mult_matrix(A, IA, JA, count, size_rows, count * 100 / size_cols / size_rows);
	unsigned long long first_time = tick() - time;
    output_raz_stat(first_time, (count + count + size_rows) * sizeof(int));
}
