#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#include "../inc/multiplication.h"
#include <time.h>
#define OK 0
#define ERROR 1

int mult_std_matrix(int **matrix, int size_rows, int size_cols, int c)
{
    //printf("%d, %d, %d\n",  size_rows,  size_cols,  c);
	//printf("-->\n");
    int *vector = get_vector(size_rows, c);
    //printf("<--\n");
    if (vector != NULL)
    {
        
        //clock_t start_1 = clock();
        int *result = calloc(size_cols,sizeof(int));
        //printf("%d\n", size_cols);
        //printf("%d\n", size_rows);
        if (result != NULL)
        {
            for (int i=0; i < size_cols; i++)
                for (int j=0; j < size_rows; j++)
                {
                    //printf("%d\n", c);
                    result[i] = result[i]+vector[j]*matrix[j][i];
                }
		    if (c == 0)
		    {
                printf("\n   Результат вектор-строка: \n ");
                for (int j = 0; j < size_cols; j++)
                    printf("%d ",result[j]);
                printf("\n");
		    }
        free(result);

        }
        free(vector);
        //clock_t end_1 = clock();
        //output_stand_stat((double)(end_1 - start_1) / CLOCKS_PER_SEC, size_cols * size_rows * sizeof(int));
        
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
        printf("\n   В векторе-строке нет ненулевых элементов\n");
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
            for (int i = size - 1; i >= 0; i--)
                if(JAR[i] == -1)
                    JAR[i] = JAR[i + 1];
            if (c == 0)
            {
                printf("\n   Результат: \nА: ");
                for (int i=0;i<count_r;i++)
                    printf("%d ",AR[i]);
                printf("\n   JA: ");
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
