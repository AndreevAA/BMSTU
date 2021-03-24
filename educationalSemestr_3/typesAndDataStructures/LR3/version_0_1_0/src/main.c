#include "../inc/menu.h"
#include "../inc/config.h"
#include "../inc/operations.h"
#include "../inc/io.h"
#include "../inc/comparation.h"

int main(void)
{
    setbuf(stdout, NULL);
    int error = 0;
    int choice;
    int ** matrix;
    int size_rows = 0, size_cols = 0, count = 0;
    while ((choice = menu_1()) == -1);
    switch(choice)
    {
        case 1:
            matrix = hand_input(&size_rows, &size_cols, &count);
            if (matrix == NULL)
                error = 1;
            break;
        case 2:
            matrix = file_input(&size_rows,&count);
            if (matrix == NULL)
                error = 1;
            break;
    }
    int *A = (int*)malloc(count*sizeof(int));
    if (A == NULL)
        error = 1;
        
    int *IA = (int*)malloc(count*sizeof(int));
    if (IA == NULL)
        error = 1;
    
    int *JA = (int*)malloc((size_cols+1)*sizeof(int));
    if (JA == NULL)
        error = 1;
    
    if (count!= 0)
        inputing(matrix, size_rows, size_cols, count, A, IA, JA);
        
    while ((choice = menu_2()) != 0 && error == 0)
    {
        switch(choice)
        {
            case 1:
                    if (count ==  0)
                        printf("\nВ матрице нет ненулевых элементов\n");
                    else
                        error = mult_mtr_raz(A, IA, JA, count,size_rows);
                    break;
            case 2:
                    if (count ==  0)
                        printf("\nНулевая строка\n");
                    else
                        error = mult_mtr(matrix,size_rows, size_cols);
                    break;
            case 3:
                    efficient();
                    break;
            case 4:
                    if (count ==  0)
                        printf("\nВ матрице нет ненулевых элементов\n");
                    else
                        print_mtr_raz(A,IA,JA,count,size_cols);
                    break;
            case 5:
                print_mtr(matrix, size_rows, size_cols);
                    break;
        }
    }
    if (error)
        printf("\nОшибка выделения памяти\n");
    free_mtr(matrix,size_rows);
    
    if (count !=  0)
    {
        if (!A)
            free(A);
        if (!IA)
            free(IA);
        if (!JA)
            free(JA);
    }
    return error;
}
