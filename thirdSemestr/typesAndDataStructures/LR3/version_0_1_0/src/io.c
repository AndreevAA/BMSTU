#include "../inc/menu.h"
#include "../inc/config.h"
#include "../inc/operations.h"
#include "../inc/io.h"

int ** hand_input(int *size_rows, int *size_cols, int *count)
{
    int error = 1;
    int str, col, num;
    printf("\n\nВведите размерность матрицы: ");
    while(error == 1)
    {
        while(scanf("%d %d", size_rows, size_cols) == 0)
        {
            printf("\nОшибка ввода\nВведите размерность матрицы: ");
            clean_stdin();
        }
        if (*size_rows < 1 || *size_cols < 1)
            printf("\nНеверный размер\nВведите размерность матрицы: ");
        else
            error = 0;
    }
    int ** matrix = (int**)calloc((*size_rows),sizeof(int*));
    if (matrix != NULL)
    {
        int i = 0;
        for (; i < *size_rows; i++)
        {
            matrix[i] = (int*)calloc((*size_cols), sizeof(int));
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
        while(scanf("%d", &num) == 0)
        {
            printf("\nОшибка ввода\nВведите число: ");
            clean_stdin();
        }
        matrix[str][col] = num;
    }
    return matrix;
}

int ** file_input(int *size, int *count)
{
    FILE *f = fopen("matrix.txt","r");
    int str, col, num;
    fscanf(f,"%d %d\n", size, count);
    int ** matrix = (int**)calloc((*size),sizeof(int*));
    if (matrix != NULL)
    {
        int i = 0;
        for (; i < *size; i++)
        {
            matrix[i] = (int*)calloc((*size), sizeof(int));
            if (matrix[i] == NULL)
            {
                free_mtr(matrix, *size);
            }
        }
    }
    for (int i=0;i<*count;i++)
    {
        fscanf(f,"%d %d %d\n", &str, &col, &num);
        matrix[str][col] = num;
    }
    fclose(f);
    return matrix;
}

void inputing(int **mtr, int size_rows, int size_cols, int count, int *A, int *IA, int *JA)
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
void print_mtr(int **mtr, int size_rows, int size_cols)
{
    for (int i = 0;i<size_rows;i++)
        {
            for (int j = 0;j<size_cols;j++)
                printf("%6d ", mtr[i][j]);
            printf("\n");
        }
}

void print_mtr_raz(int *A, int *IA, int*JA, int count, int size_cols)
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

int * get_string(int size)
{
    int num;
    int *string = (int*)malloc(size*sizeof(int));
    int count, pos;
    if (string!=NULL)
    {
        for (int i = 0; i < size; i++)
        {
            string[i] = 0;
        }
        printf("\nВведите кол-во ненулевых элементов: \n");
        scanf("%d", &count);
        clean_stdin();
        if (count == size)
        {
            for (int i =0;i<size;i++)
            {
                printf("\nВведите %d элемент: ",i);
                while(scanf("%d", &num) == 0)
                {
                    printf("\nОшибка ввода\nВведите %d элемент: ",i);
                    clean_stdin();
                }
                string[i] = num;
            }
        }
        else
        {
            for (int i =0;i<count;i++)
            {
                printf("\nВведите позицию: ");
                scanf("%d", &pos);
                clean_stdin();
                printf("\nВведите %d элемент: ",pos);
                scanf("%d", &num);
                string[pos] = num;
            }
        }
        return string;
    }
    else
        return NULL;
}
