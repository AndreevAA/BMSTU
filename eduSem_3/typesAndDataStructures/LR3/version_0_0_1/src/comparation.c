#include "../inc/menu.h"
#include "../inc/config.h"
#include "../inc/operations.h"
#include "../inc/io.h"
#include "../inc/comparation.h"

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
