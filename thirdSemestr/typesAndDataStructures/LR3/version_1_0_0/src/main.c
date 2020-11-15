#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#define OK 0
#define ERROR 1

int main(void)
{
    setbuf(stdout, NULL);
    int error = OK;
    int ** matrix;
    int size_rows = 0, size_cols = 0, count = 0;
	int choice = menu_1();
    if (choice == 1)
    {
        matrix = manual_input(&size_rows, &size_cols, &count);
        error = (matrix == NULL) ? ERROR : OK;
    }
    else if (choice == 2)
	{
        matrix = input_from_file(&size_cols, &size_rows, &count);
        error = (matrix == NULL) ? ERROR : OK;
    }
	else if (choice == 3)
	{
        matrix = rand_matrix(&size_cols, &size_rows, &count);
        error = (matrix == NULL) ? ERROR : OK;
    }
	
    int *A = malloc((count) * sizeof(int));
	int *IA = malloc((count) * sizeof(int));
	struct ja JA;
    error = (A == NULL) ? ERROR : OK;
    error = (IA == NULL) ? ERROR : OK;
    int *ARRJ = malloc((size_cols + 1) * sizeof(int));
	error = (ARRJ == NULL) ? ERROR : OK; 
    if (count!= 0)
        input_matrix(matrix, size_rows, size_cols, count, A, IA, ARRJ);
    
    while ((choice = menu_2()) != 0 && error == OK)
    {
        switch(choice)
        {
            case 1:
                    if (count ==  0)
                        printf("\nВ матрице все элементы нулевые\n");
                    else
                        error = mult_matrix(A, IA, ARRJ, count,size_rows, 0);
                    break;
            case 2:
                    if (count ==  0)
                        printf("\nНулевая строка\n");
                    else
                        error = mult_std_matrix(matrix,size_rows, size_cols, 0);
                    break;
            case 3:
                    statistic(matrix, size_rows, size_cols, A, IA, ARRJ, count);
                    break;
            case 4:
                    if (count == 0)
                        printf("\nВ матрице все элементы нулевые\n");
                    else
                        print_matrix(A, IA, ARRJ,count,size_cols);
                    break;
            case 5:
                print_std_matrix(matrix, size_rows, size_cols);
                    break;
        }
    }
    if (error)
        printf("\nОшибка при выделении памяти\n (программа завершена)");
    free_mtr(matrix,size_rows);
    
    if (count != 0)
    {
        if (!A)
            free(A);
        if (!IA)
            free(IA);
        if (!ARRJ)
            free(ARRJ);
    }
    return error;
}
