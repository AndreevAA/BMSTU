struct ja
{
    int num;
    struct ja *next;
};

void free_ja(struct ja * JA);

void add_elem(struct ja **JA);

void clean_stdin(void);

void free_mtr(int **mtr, int size);

int ** manual_input(int *size_rows, int *size_cols, int *count);

void input_matrix(int **mtr, int size_rows, int size_cols, int count, int *A, int *IA, int *JA);

int **input_from_file(int *size_cols, int *size_rows, int *count);

void print_std_matrix(int **mtr, int size_rows, int size_cols);

void print_matrix(int *A, int *IA, int*JA, int count, int size_cols);

int * get_vector(int size, int c);