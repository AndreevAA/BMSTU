#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#include "../inc/multiplication.h"
#define OK 0
#define ERROR 1

int **rand_matrix(int *row, int *col, int *count)
{
    srand(123);
	int fill = 0, read_status = 0;
	printf("\n   Введите размер матрицы и процент заполнения: \n");
    printf("\n   Высота = ");
    read_status += scanf("%d", row);
    printf("\n   Ширина = ");
    read_status += scanf("%d", col);
    printf("\n   Заполненность = ");
    read_status += scanf("%d", &fill);
	while (read_status != 3 || fill > 100)
		printf("\n   Возникла ошибка при вводе. Повторите попытку...\n");
	
    printf("\n   Матрица генерируется...\n");
	int **res = malloc(*row * sizeof(int*));
	for (int i = 0; i < *row; i++)
		res[i] = calloc(*col, sizeof(int));
	*count = (*row * *col * fill) / 100;
	for (int j = 0; j < *count; j++)
	{
		int x = 0, y = 0;
		while (res[x][y])
		{
            x = (abs(rand()) % *row); 
            y = (abs(rand()) % *col);
		}
		res[x][y] = rand()%1000 + 1;
	}
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

    clock_t start_1 = clock();
	mult_std_matrix(matrix, size_rows, size_cols, count * 100 / size_cols / size_rows);
    clock_t end_1 = clock();
	unsigned long long second_time = tick() - time;
    output_stand_stat((double)(end_1 - start_1) / CLOCKS_PER_SEC, size_cols * size_rows * sizeof(int));
    //output_stand_stat(second_time, size_cols * size_rows * sizeof(int));
	time = tick();
    clock_t start_2 = clock();
	mult_matrix(A, IA, JA, count, size_rows, count * 100 / size_cols / size_rows);
    clock_t end_2 = clock();
	unsigned long long first_time = tick() - time;
    output_raz_stat((double)(end_2 - start_2) / CLOCKS_PER_SEC, (count + count + size_rows) * sizeof(int));
    // output_raz_stat(first_time, (count + count + size_rows) * sizeof(int));
}