#include <stdio.h>
#include <stdlib.h>
#include "../inc/io.h"
#include "../inc/operations.h"
#include "../inc/menu.h"
#include "../inc/multiplication.h"
#include <time.h>
#define OK 0
#define ERROR 1

void ch_out(int s_r)
{
    printf("   Размер матрицы: %d х %d\n", s_r, s_r);
    printf("       Размер |     Размер |     Раз-ть |       Вр.Ст. |     Па.Ст. |       Вр.Ра. |     Па.H.\n");
    for (int temp_count = 100; temp_count >= 5; temp_count-= 5)
    {
        int col = s_r;
        int row = s_r;
        int ** temp_matrix;
        printf("   %10.0d | %10.0d | %10.1d | ", col, row, 100 - temp_count);

        int **res = malloc(row * sizeof(int*));
        for (int i = 0; i < row; i++)
            res[i] = calloc(col, sizeof(int));
        int count = (row * col * temp_count) / 100;
        for (int j = 0; j < count; j++)
        {
            int x = 0, y = 0;
            while (res[x][y])
            {
                x = (abs(rand()) % row); 
                y = (abs(rand()) % col);
            }
            res[x][y] = rand()%1000 + 1;
        }

        //temp_matrix = rand_matrix(&size_cols, &size_rows, &temp_count);
        int *A = malloc((count) * sizeof(int));
        int *IA = malloc((count) * sizeof(int));
        struct ja JA;
        // error = (A == NULL) ? ERROR : OK;
        // error = (IA == NULL) ? ERROR : OK;
        int *ARRJ = malloc((col + 1) * sizeof(int));
        //printf("fdsf\n");
        
        input_matrix(res, row, col, count, A, IA, ARRJ);

        clock_t start_1 = clock();
        mult_std_matrix(res, row, col, temp_count);
        clock_t end_1 = clock();
        
        printf("%10.10f | %10.0lu | ", (double)(end_1 - start_1) / CLOCKS_PER_SEC, col * row * sizeof(int));
        //output_stand_stat((double)(end_1 - start_1) / CLOCKS_PER_SEC, col * row * sizeof(int));
        //output_stand_stat(second_time, size_cols * size_rows * sizeof(int));
        
        clock_t start_2 = clock();
        mult_matrix(A, IA, ARRJ, count, row, temp_count);
        clock_t end_2 = clock();
        printf("%10.10f | %10.0lu\n", (double)(end_2 - start_2) / CLOCKS_PER_SEC, (count + count + row) * sizeof(int));
        //output_raz_stat((double)(end_2 - start_2) / CLOCKS_PER_SEC, (count + count + row) * sizeof(int));
        
        //statistic(res, row, col, A, IA, ARRJ, count);

    }

    int temp_count = 1;

    int col = s_r;
    int row = s_r;
    int ** temp_matrix;
    printf("   %10.0d | %10.0d | %10.1d | ", col, row, 100 - temp_count + 1);

    int **res = malloc(row * sizeof(int*));
    for (int i = 0; i < row; i++)
        res[i] = calloc(col, sizeof(int));
    int count = (row * col * temp_count) / 100;
    for (int j = 0; j < count; j++)
    {
        int x = 0, y = 0;
        while (res[x][y])
        {
            x = (abs(rand()) % row); 
            y = (abs(rand()) % col);
        }
        res[x][y] = rand()%1000 + 1;
    }

    //temp_matrix = rand_matrix(&size_cols, &size_rows, &temp_count);
    int *A = malloc((count) * sizeof(int));
    int *IA = malloc((count) * sizeof(int));
    struct ja JA;
    // error = (A == NULL) ? ERROR : OK;
    // error = (IA == NULL) ? ERROR : OK;
    int *ARRJ = malloc((col + 1) * sizeof(int));
    //printf("fdsf\n");
    
    input_matrix(res, row, col, count, A, IA, ARRJ);

    clock_t start_1 = clock();
    mult_std_matrix(res, row, col, temp_count);
    clock_t end_1 = clock();
    
    printf("%10.10f | %10.0lu | ", (double)(end_1 - start_1) / CLOCKS_PER_SEC, col * row * sizeof(int));
    //output_stand_stat((double)(end_1 - start_1) / CLOCKS_PER_SEC, col * row * sizeof(int));
    //output_stand_stat(second_time, size_cols * size_rows * sizeof(int));
    
    clock_t start_2 = clock();
    mult_matrix(A, IA, ARRJ, count, row, temp_count);
    clock_t end_2 = clock();
    printf("%10.10f | %10.0lu\n", (double)(end_2 - start_2) / CLOCKS_PER_SEC, (count + count + row) * sizeof(int));

    printf("\n");
}

int main(void)
{
    output_welcome_info();
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
    else if (choice == 4)
    {
        ch_out(200);
        ch_out(300);
        ch_out(500);
        ch_out(800);
        ch_out(1000);
        ch_out(2000);
        ch_out(3000);
        return 0;
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
                        printf("\n   В матрице все элементы нулевые\n");
                    else
                    {
                        
                        error = mult_matrix(A, IA, ARRJ, count,size_rows, 0);
                    }
                    break;
            case 2:
                    if (count ==  0)
                        printf("\n   Нулевая строка\n");
                    else
                        error = mult_std_matrix(matrix,size_rows, size_cols, 0);
                    break;
            case 3:
                    statistic(matrix, size_rows, size_cols, A, IA, ARRJ, count);
                    break;
            case 4:
                    if (count == 0)
                        printf("\n   В матрице все элементы нулевые\n");
                    else
                        print_matrix(A, IA, ARRJ,count,size_cols);
                    break;
            case 5:
                print_std_matrix(matrix, size_rows, size_cols);
                    break;
        }
    }
    if (error)
        printf("\nОшибка памяти");
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
