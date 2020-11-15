#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#include "../inc/multiplication.h"
#define OK 0
#define ERROR 1

void free_ja(struct ja * JA)
{
    struct ja *p;
    p = JA;
    for (;JA->next;)
    {
        p = JA->next;
        free(JA);
        JA = p;
    }
}
void add_elem(struct ja **JA)
{
    struct ja *p;
    struct ja *elem = (struct ja *)malloc(sizeof(struct ja));
    if (elem!= NULL)
    {
        
        if (*JA == NULL)
        {
            *JA = elem;
            printf("|%p| ",*JA);
            printf("%p |",elem);
        }
        else
        {
            p = *JA;
            for (;p -> next;p++)
                printf("%p| ",p);
            p -> next = elem;
        }
        elem -> next = NULL;
    }
    p = *JA;
    for (;p->next;p++)
        printf("%p ",p);
    printf("%p\n",p);
}

void clean_stdin(void)
{
    int c;
    do
    {
        c = getchar();
    }
    while (c != '\n' && c != EOF);
}

void free_mtr(int **mtr, int size)
{
    if (mtr != NULL)
    {
        for (int i = 0; i < size ;i++)
        {
            if (mtr[i] != NULL)
                free(mtr[i]);
        }
        free(mtr);
    }
} 

int ** manual_input(int *size_rows, int *size_cols, int *count)
{
    int error = 1;
    int str, col, num;
    printf("\n\n   Размерность матрицы через пробел: ");
    while(error == 1)
    {
        while(scanf("%d %d", size_rows, size_cols) != 2)
        {
            printf("\n   Возникла ошибка при вводе. Повторите попытку...\n   Размерность матрицы через пробел: ");
            clean_stdin();
        }
        if (*size_rows < 1 || *size_cols < 1)
            printf("\n   Указан неверный размер\n   Размерность матрицы через пробел: ");
        else
            error = 0;
    }
    int ** matrix = calloc(*size_rows,sizeof(int*));
    if (matrix != NULL)
    {
        int i = 0;
        for (; i < *size_rows; i++)
        {
            matrix[i] = calloc(*size_cols, sizeof(int));
            if (matrix[i] == NULL)
            {
                free_mtr(matrix, *size_rows);
            }
        }
    }
    
    error = 1;
    printf("\n   Количичество ненулевых элементов: ");
    while(error == 1)
    {
        while(scanf("%d", count) == 0)
        {
            printf("\n   Возникла ошибка при вводе. Повторите попытку...\n   Количичество ненулевых элементов: ");
            clean_stdin();
        }
        if (*count < 0)
            printf("\n   Указано неверное количество. Повторите попытку...\n   Количичество ненулевых элементов: ");
        else
            error = 0;
    }
    for (int i = 0; i<*count;i++)
    {
        error = 1;
        printf("\n   Номер строки: ");
        while(error == 1)
        {
            while(scanf("%d", &str) == 0)
            {
                printf("\n   Возникла ошибка при вводе. Повторите попытку...\n   Номер строки: ");
                clean_stdin();
            }
            if (str < 0 || str > *size_rows-1)
                printf("\n   Указан неверный размер. Повторите попытку...\n   Номер строки: ");
            else
                error = 0;
        }
        error = 1;
        printf("\n   Номер столбца: ");
        while(error == 1)
        {
            while(scanf("%d", &col) == 0)
            {
                printf("\n   Возникла ошибка при вводе. Повторите попытку...\n   Номер столбца: ");
                clean_stdin();
            }
            if (col < 0 || col > *size_cols-1)
                printf("\n   Указан неверный размер. Повторите попытку...\n   Номер столбца: ");
            else
                error = 0;
        }
        error = 1;
        printf("\n   Укажите значение:");
        while(scanf("%d", &num) == 0 || num == 0)
        {
            printf("\n   Возникла ошибка при вводе. Повторите попытку...\n   Укажите значение:");
            clean_stdin();
        }
        matrix[str][col] = num;
    }
    return matrix;
}

int **input_from_file(int *size_cols, int *size_rows, int *count)
{
	FILE *f = NULL;
	char fname[50];
	while (!f)
	{
	    printf("\n   Имя файла не более 50 символов: ");
	    fgets(fname, 50, stdin);
		int j = 0;
		while (fname[j])
			j++;
		if (j)
			fname[j - 1] = 0;
        f = fopen(fname, "r");
		if (!f)
			printf("\n   Допущена ошибка при открытии файла. Повторите попытку...\n");
	}
    int row, col, num;
    fscanf(f,"%d %d %d", size_cols ,size_rows , count);
    int **matrix = calloc(*size_cols, sizeof(int*));
    if (matrix != NULL)
        for (int i = 0; i < *size_cols; i++)
        {
            matrix[i] = calloc(*size_rows, sizeof(int));
            if (matrix[i] == NULL)
            {
                free_mtr(matrix, *size_cols);
            }
        }
    for (int i = 0; i < *count; i++)
    {
        fscanf(f,"%d %d %d", &row, &col, &num);
        matrix[row][col] = num;
    }
    fclose(f);
    return matrix;
}

void input_matrix(int **mtr, int size_rows, int size_cols, int count, int *A, int *IA, int *JA)
{
    int s,flag=0;
    JA[size_cols] = count;
    s = count-1;
    for (int i = size_cols-1; i>=0; i--)
    {
        flag = 0;
        for (int j = size_rows-1; j>=0;j--)
        {
            if (mtr[j][i] != 0)
            {
                A[s] = mtr[j][i];
                IA[s] = j;
                JA[i] = s;
                flag = 1;
                s--;
            }
        }
        if (flag == 0)
            JA[i] = JA[i+1];
    }
}
void print_std_matrix(int **mtr, int size_rows, int size_cols)
{
    for (int i = 0;i<size_rows;i++)
	{
            for (int j = 0;j<size_cols;j++)
                printf("%6d ", mtr[i][j]);
            printf("\n");
	}
}

void print_matrix(int *A, int *IA, int*JA, int count, int size_cols)
{
    printf("   A: ");    
    for (int i =0; i<count;i++)
        printf("%d ",A[i]);
    printf("\n");
    printf("   IA: ");    
    for (int i =0; i<count;i++)
        printf("%d ",IA[i]);
    printf("\n");
    printf("   JA: ");    
    for (int i =0; i<size_cols + 1;i++)
        printf("%d ",JA[i]);
    printf("\n");
}

int * get_vector(int size, int c)
{
    int num;
    int *vector = malloc(size * sizeof(int));
    int count, pos;
    if (vector != NULL)
    {
        for (int i = 0; i < size; i++)
        {
            vector[i] = 0;
        }
		if (c)
		{
			count = c;
		}
		else
		{
            printf("\n   Процент ненулевых элементов: ");
            scanf("%d", &count);
            clean_stdin();
		}
	}

	for (int i = 0; i < size * count / 100; i++)
	    vector[(size) * rand() / RAND_MAX] = rand() / 1000;
	return vector;
}

void output_welcome()
{
    printf("\nОсновное меню программы:");
    printf("\n   1 - Ручной ввод матрицы\n   2 - Чтение матрицы из файла\n   3 - Генерация матрицы\n\n   Укажите пункт меню (1-3): ");
}

void output_stand_stat(unsigned long long t, unsigned long memory)
{
    printf("   Время умножения матрицы на вектор в стандартном виде: %llu тиков\n", t);
    printf("   Память умножения матрицы на вектор в стандартном виде: %lu байт\n", memory);
}

void output_raz_stat(unsigned long long t, unsigned long memory)
{
    printf("   Время умножения матрицы на вектор в разреженом виде: %llu тиков\n", t);
    printf("   Память умножения матрицы на вектор в разреженом виде: %lu байт\n", memory);
}

void output_welcome_info()
{
    printf("Программа умножения вектора-строки на матрицу, \nхранящихся в разреженной форме, с получением результата в той же форме.\n");
}

void output_sup_menu()
{
    printf("\n   Меню операций: ");
    printf("\n   1 - Умножение вектора-строки на матрицу, хранящихся в разреженной форме,"
    " с получением результата в той же форме\n   2 - Умножение стандартным алгоритмом "
    "работы с матрицами\n   3 - Сравнение времени выполнения операций, объема памяти при"
    " использовании этих алгоритмов при различной доли заполненности матриц\n"
    "   4 - Вывод в разреженной форме\n   5 - Вывод в простой форме\n   0 - Завершение программы\n\n"
    "   Укажите пункт меню (0-5): ");
}

