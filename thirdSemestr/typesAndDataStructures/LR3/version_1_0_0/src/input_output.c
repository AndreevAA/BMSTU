#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "input_output.h"
#include "matrix.h"
#include "menu.h"
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
    printf("\n\nВведите размерность матрицы: ");
    while(error == 1)
    {
        while(scanf("%d %d", size_rows, size_cols) != 2)
        {
            printf("\nОшибка ввода\nВведите размерность матрицы: ");
            clean_stdin();
        }
        if (*size_rows < 1 || *size_cols < 1)
            printf("\nНеверный размер\nВведите размерность матрицы: ");
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
    printf("\nВведите количество ненулевых элементов: ");
    while(error == 1)
    {
        while(scanf("%d", count) == 0)
        {
            printf("\nОшибка ввода\nВведите количество ненулевых элементов: ");
            clean_stdin();
        }
        if (*count < 0)
            printf("\nНеверное количество\nВведите количество ненулевых элементов: ");
        else
            error = 0;
    }
    for (int i = 0; i<*count;i++)
    {
        error = 1;
        printf("\nВведите номер строки: ");
        while(error == 1)
        {
            while(scanf("%d", &str) == 0)
            {
                printf("\nОшибка ввода\nВведите номер строки: ");
                clean_stdin();
            }
            if (str < 0 || str > *size_rows-1)
                printf("\nНеверный размер\nВведите номер строки: ");
            else
                error = 0;
        }
        error = 1;
        printf("\nВведите номер столбца: ");
        while(error == 1)
        {
            while(scanf("%d", &col) == 0)
            {
                printf("\nОшибка ввода\nВведите номер столбца: ");
                clean_stdin();
            }
            if (col < 0 || col > *size_cols-1)
                printf("\nНеверный размер\nВведите номер столбца: ");
            else
                error = 0;
        }
        error = 1;
        printf("\nВведите число: ");
        while(scanf("%d", &num) == 0 || num == 0)
        {
            printf("\nОшибка ввода\nВведите число: ");
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
	    printf("\nВведите имя файла не более 50 символов:\n");
	    fgets(fname, 50, stdin);
		int j = 0;
		while (fname[j])
			j++;
		if (j)
			fname[j - 1] = 0;
        f = fopen(fname, "r");
		if (!f)
			printf("\nОшибка открытия файла.\n");
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
    printf("A: ");    
    for (int i =0; i<count;i++)
        printf("%d ",A[i]);
    printf("\n");
    printf("IA: ");    
    for (int i =0; i<count;i++)
        printf("%d ",IA[i]);
    printf("\n");
    printf("JA: ");    
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
            printf("\nВведите процент ненулевых элементов: \n");
            scanf("%d", &count);
            clean_stdin();
		}
	}
        /*if (count == size)
        {
            for (int i =0;i<size;i++)
            {
                printf("\nВведите %d элемент: ",i);
                while(scanf("%d", &num) == 0)
                {
                    printf("\nОшибка ввода\nВведите %d элемент: ",i);
                    clean_stdin();
                }
                vector[i] = num;
            }
        }
        else
        {
            for (int i =0; i < count; i++)
            {
                printf("\nВведите позицию: ");
                scanf("%d", &pos);
                clean_stdin();
                printf("\nВведите %d элемент: ",pos);
                scanf("%d", &num);
                vector[pos] = num;
            }
        }
        return vector;
    }
    else
        return NULL;
	*/
	for (int i = 0; i < size * count / 100; i++)
	    vector[(size) * rand() / RAND_MAX] = rand() / 1000;
	return vector;
}