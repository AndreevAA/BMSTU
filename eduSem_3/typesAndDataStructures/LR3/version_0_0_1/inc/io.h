#include "../inc/config.h"

int ** hand_input(int *size_rows, int *size_cols, int *count);
int ** file_input(int *size, int *count);
void inputing(int **mtr, int size_rows, int size_cols, int count, int *A, int *IA, int *JA);
void print_mtr(int **mtr, int size_rows, int size_cols);
void print_mtr_raz(int *A, int *IA, int*JA, int count, int size_cols);
int * get_string(int size);
