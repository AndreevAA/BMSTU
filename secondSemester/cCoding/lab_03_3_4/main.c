#include <stdio.h>
#include <stdlib.h>

void transform(int **temp, int *buffer, int n, int m);
int input_data(int **temp, int *n, int *m);
void output(int **temp, int *n, int *m);
void count(int **temp, int *n, int *m);

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
        count(temp, &n, &m);
        output(temp, &n, &m);
    }
    else
    {
        printf("%s\n", "Error");
    }
    return err;
}

void count(int **temp, int *n, int *m)
{
    for (int y = 0; y < *n; y++)
    {
        for (int x = 0; x < *m; x++)
        {
            int y1 = x;
            int y2 = -x + *n;
            if (y < y2 && y >= y1)
            {
                int temp_num = *(*(temp + y) + (*m / 2 - x + *m % 2 - 1) + *m / 2);
                *(*(temp + y) + (*m / 2 - x + *m % 2 - 1) + *m / 2) = *(*(temp + y) + x);
                *(*(temp + y) + x) = temp_num;
            }
        }
    }
}


void output(int **temp, int *n, int *m)
{
    printf("\nМатрица с отсортированными строками по наименьшему элементу: \n");
    for (int i = 0; i < *n; i++)
    {
        for (int j = 0; j < *m; j++)
        {
            printf("%d ", *(*(temp + i) + j));
        }
        printf("\n");
    }
}

int input_data(int **temp, int *n, int *m) 
{
    int error_flag_0 = 0;
    
    error_flag_0 = ((scanf("%d ", n) != 1) || (scanf("%d ", m) != 1) || (*n < 1) || (*n > 10) || (*m < 1) || (*m > 10));
    
    if (*n == *m)
    {
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
    }
    else
    {
        error_flag_0 = 1;
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
