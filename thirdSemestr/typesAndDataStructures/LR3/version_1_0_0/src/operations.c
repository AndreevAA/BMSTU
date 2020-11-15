#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#define OK 0
#define ERROR 1

int **rand_matrix(int *row, int *col, int *count)
{
	//srand(3567);
	int fill = 0;
	printf("\nВведите размер матрицы и процент заполнения.\n");
	while (scanf("%d%d%d", row, col, &fill) != 3 || fill > 100)
		printf("\nнекоректный ввод , повторите\n");
	
	int **res = malloc(*row * sizeof(int*));
	for (int i = 0; i < *row; i++)
		res[i] = calloc(*col, sizeof(int));
	*count = (*row * *col * fill) / 100;
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
	return res;
}

unsigned long long tick(void)
{
	unsigned long long d;
	__asm__ __volatile__ ("rdtsc": "=A" (d));
	return d;
}

int mult_std_matrix(int **matrix, int size_rows, int size_cols, int c)
{
	
    int *vector = get_vector(size_rows, c);
    if (vector != NULL)
    {
		//unsigned long long time = tick();
        int *result = calloc(size_cols,sizeof(int));
        if (result != NULL)
        {
            for (int i=0; i < size_cols; i++)
                for (int j=0; j < size_rows; j++)
                    result[i] = result[i]+vector[j]*matrix[j][i];
		    if (c == 0)
		    {
                printf("\nРезультат вектор-строка: \n");
                for (int j = 0; j < size_cols; j++)
                    printf("%d ",result[j]);
                printf("\n");
		    }
			//unsigned long long t2 = tick() - time;
	            //printf("Время умножения матрицы на вектор в стандартном виде: %I64d тиков\n ", t2);
        free(result);
        }
        free(vector);
        return 0;
    }
    else
        return 1;
}

int mult_matrix(int *A, int *IA, int*JA, int count, int size, int c)
{
    int *vector = get_vector(size, c);
    int error = OK;
    int count_s = 0;
    for(int m = 0; m < size; m++)
        if(!vector[m])
            count_s++;
    int * AS = malloc(count_s * sizeof(int));
    error = (AS == NULL) ? ERROR : OK;
    int * JAS = malloc((size + 1) * sizeof(int));
    error = (JAS == NULL) ? ERROR : OK;
    if (error)
    {
        if (!JAS)
            free(JAS);
        if (!AS)
            free(AS);
        return error;
    }
    if (count_s != 0)
    {
        int flag=0;
        int s = count_s - 1;
        JAS[size]=count_s;
        for (int i = size - 1; i>=0;i--)
        {
            flag = 0;
            if (vector[i] != 0)
            {
                AS[s] = vector[i];
                JAS[i] = s;
                s--;
                flag = 1;
            }
            if (flag == 0)
                JAS[i] = JAS[i+1];
        }
    }
    else
    {
        if (!JAS)
            free(JAS);
        if (!AS)
            free(AS);
        printf("\nВ векторе-строке нет ненулевых элементов\n");
        return 0;
    }

    if (vector != NULL)
    {        
        int * AR = (int*)calloc(size, sizeof(int));
        if (AR == NULL)
            error = 1;
        int * JAR = (int*)malloc((size+1)*sizeof(int));
        if (JAR == NULL)
        error = 1;
        JAR[size] = size-1;
		
        if (JAR != NULL && AR != NULL)
        {
            int r = 0;
            int k = 0;
            int count_r = 0;
				//unsigned long long time = tick();
            for (int i = 0; i < size; i++)
            {
                for(int z = 0, j = JA[i]; j <= JA[i+1] - 1; z++)
                {
                    if (IA[k] == z)
                    {
                        if (JAS[z] != JAS[z+1])
                        {
                            AR[r] += AS[JAS[z]] * A[k];
                        }
                        k++;
                        j++;
                    }
                }
                if (AR[r] != 0)
                {
                    count_r++;
                    JAR[i] = r;
                    r++;
                }
                else
                    JAR[i] = -1;
            }
				//unsigned long long t2 = tick() - time;
	            //printf("Время умножения матрицы на вектор в разреженом виде: %I64d тиков\n ", t2);
            for (int i = size - 1; i >= 0; i--)
                if(JAR[i] == -1)
                    JAR[i] = JAR[i + 1];
			if (c == 0)
			{
                printf("\nРезультат: \nА: ");
                for (int i=0;i<count_r;i++)
                    printf("%d ",AR[i]);
                printf("\nJA: ");
                for (int i = 0; i < size + 1; i++)
                    printf("%d ",JAR[i]);
                printf("\n");
			}
        }
            if (!JAR)
                free(JAR);
            if (!AR)
                free(AR);
        free(vector);
        return 0;
    }
    else
        return 1;
    if (!JAS)
        free(JAS);
    if (!AS)
        free(AS);
}

void statistic(int **matrix, int size_rows, int size_cols, int *A, int *IA, int*JA, int count)
{
	unsigned long long time = tick();
	mult_std_matrix(matrix, size_rows, size_cols, count * 100 / size_cols / size_rows);
	unsigned long long t2 = tick() - time;
	printf("Время умножения матрицы на вектор в стандартном виде: %llu тиков\n ", t2);
	printf("Память умножения матрицы на вектор в стандартном виде: %lu байт\n ", size_cols * size_rows * sizeof(int));
	time = tick();
	mult_matrix(A, IA, JA, count, size_rows, count * 100 / size_cols / size_rows);
	unsigned long long t1 = tick() - time;
	printf("Время умножения матрицы на вектор в разреженом виде: %llu\n", t1);
	printf("Память умножения матрицы на вектор в стандартном виде: %lu байт\n ", (count + count + size_rows) * sizeof(int));
}
