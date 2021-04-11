#include <stdio.h>
#include <stdlib.h>

struct ja
{
    int num;
    struct ja *next;
};

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
        //elem -> num = 1;
        
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
            //printf("%p| ",p);
            //printf("%p |",elem);
            //printf("%p |",elem->next);
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

void free_mtr(int **mtr, int size) // очистка матрицы
{
    if (mtr !=NULL)
    {
        for (int i = 0; i < size ;i++)
        {
            if (mtr[i] != NULL)
                free(mtr[i]);
        }
        free(mtr);
    }
} 

int menu_1(void) // пункты меню
{
    printf("\n1 - Ввести матрицу вручную\n2 - Считать матрицу из файла\n\nПункт: ");
    int choice;
    if (scanf("%d",&choice))
    {
        if (choice < 3 && choice > 0)
        {
            clean_stdin();
            return choice;
        }
        else
        {
            printf("\nНет такого пункта\n");
            clean_stdin();
            return -1;
        }
    }
    else
    {
        clean_stdin();
        printf("\nНет такого пункта\n");
        return -1;
    }
}


int menu_2(void) // пункты меню
{
    printf("\n1 - Умножение вектора-строки на матрицу,хранящихся в разреженной форме,"
    " с получением результата в той же форме.\n2 - Умножение стандартным алгоритмом "
    "работы с матрицами.\n3 - Сравние времени выполнения операций и объем памяти при"
    " использовании этих 2-х алгоритмов при различном проценте заполнения матриц.\n"
    "4 - Вывести матрицу в разреженной форме.\n5 - Вывести матрицу в простой форме.\n0 - Выход\n\n"
    "Пункт: ");
    int choice;
    if (scanf("%d",&choice))
    {
        if (choice < 6 && choice >= 0)
        {
            clean_stdin();
            return choice;
        }
        else
        {
            printf("\nНет такого пункта\n");
            clean_stdin();
            return -1;
        }
    }
    else
    {
        clean_stdin();
        printf("\nНет такого пункта\n");
        return -1;
    }
}

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
    if (f == NULL)
        printf("NULL\n");
    if (f != NULL)
        printf("!NULL\n");
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


int mult_mtr(int **matrix, int size_rows, int size_cols)
{
    int *string=get_string(size_rows);
    if (string!=NULL)
    {
        int *result = (int*)calloc(size_cols,sizeof(int));
        if (result !=NULL)
        {
            for (int i=0;i<size_cols;i++)
                for (int j=0;j<size_rows;j++)
                {
                    result[i] = result[i]+string[j]*matrix[j][i];
                }
            printf("\nРезультат вектор-строка: \n");
            for (int j=0;j<size_cols;j++)
                    printf("%d ",result[j]);
            printf("\n");
        free(result);
        }
        free(string);
        return 0;
    }
    else
        return 1;
}

int mult_mtr_raz(int *A, int *IA, int*JA, int count, int size)
{
    int *string=get_string(size);
    int error=0;
    int count_s=0;
    for(int m = 0; m < size; m++)
    {
        if(string[m]!=0)
            count_s++;
    }
    int * AS = (int*)malloc(count_s*sizeof(int));
    if (AS == NULL)
        error = 1;
    int * JAS = (int*)malloc((size+1)*sizeof(int));
    if (JAS == NULL)
        error = 1;
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
            if (string[i] != 0)
            {
                AS[s] = string[i];
                JAS[i] = s;
                s--;
                flag=1;
            }
            if (flag == 0)
                JAS[i]=JAS[i+1];
        }
    }
    else
    {
        if (!JAS)
            free(JAS);
        if (!AS)
            free(AS);
        printf("\nВ векторе-строке нет ненулевых элементов\n");
        return 0;
    }
    if (string!=NULL)
    {        
        int * AR = (int*)calloc(size, sizeof(int));
        if (AR == NULL)
            error = 1;
        int * JAR = (int*)malloc((size+1)*sizeof(int));
        if (JAR == NULL)
        error = 1;
        JAR[size] = size-1;
        if (JAR!=NULL && AR!=NULL)
        {
            int r=0;
            int k=0;
            int count_r=0;
            for (int i=0;i<size;i++)
            {
                for(int z=0, j=JA[i]; j<=JA[i+1]-1;z++)
                {
                    if (IA[k]==z)
                    {
                        if (JAS[z]!=JAS[z+1])
                        {
                            AR[r] += AS[JAS[z]]*A[k];
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

            for (int i = size-1;i>=0;i--)
                if(JAR[i] == -1)
                    JAR[i] = JAR[i+1];

            printf("\nРезультат: \nА: ");
            for (int i=0;i<count_r;i++)
                printf("%d ",AR[i]);
            printf("\nJA: ");
            for (int i=0;i<size+1;i++)
                printf("%d ",JAR[i]);
            printf("\n");
        }
            if (!JAR)
                free(JAR);
            if (!AR)
                free(AR);
        free(string);
        return 0;
    }
    else
        return 1;
    if (!JAS)
        free(JAS);
    if (!AS)
        free(AS);
}

void efficient()
{
    FILE *f = fopen("efficient.txt","r");
    char s[70];
    while(!feof(f))
    {
        fgets(s,70,f);
        printf("%s",s);
    }
    fclose(f);
}
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
        
    /*struct ja *JA=NULL;
    for (int i = 0; i<size+1;i++)
    {
        add_elem(&JA);
    }
    
    struct ja *p =JA;
    
    for (;p->next;p++)
        printf("%d |",p->num);
    printf("%d ",JA->num);
    
    */
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
