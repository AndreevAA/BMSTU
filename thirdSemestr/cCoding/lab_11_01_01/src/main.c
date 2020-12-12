#include "../inc/config.h"
#include "../inc/mysnprintf.h"

int main()
{
    // char *str1 = NULL;
    // my_snprintf(str1, 80, "%d\n", 3);
    // printf("%s\n", str1);
    // char str2[80];
    // my_snprintf(str2, 80, "f%d,%d\n", 34567, 5);
    // printf("%s\n", str2);
    // char str3[80];
    // my_snprintf(str3, 80, "%s number = %d, %d\n", "Your word is ", 3234, 5);
    // printf("%s\n", str3);
    // char str4[80];
    // my_snprintf(str4, 80, "number = %d, %d\n", 3234, 5);
    // printf("%s\n", str4);
    char input_str[4][5] = { { "hi" }, { "hell" }, { "key\n" }, { "heh" } };
    int input_int[4] = { 10, 999, -10, -0 };
    char buffer[20];
    int expected_count[4] = { 10, 15, 14, 10 };
    for (int i = 0; i < 4; i++)
    {
        printf("(res = %d : exp_res = %d)", my_snprintf(buffer, 20, "%sq %dq", input_str[i], input_int[i]), expected_count[i]);
        printf("%s\n", buffer);
    }

    char buffer1[20];
    printf("%d\n", my_snprintf(buffer1, 20, "%", 1));
    printf("%s\n", buffer1);
    
    char buffer2[20];
    printf("%d\n", my_snprintf(buffer2, 1, "%s", "Hello"));
    printf("%s\n", buffer2);

    char *buffer3 = (char *)malloc(sizeof(char) * 1);
    char temp_h[6] = "Hello";
    char *word = (char *)malloc(sizeof(char) * 6);
    for (int i = 0; i < 6; i++)
        word[i] = temp_h[i];
    printf("%d\n", snprintf(buffer3, 1, "%s", word));
    printf("%s\n", buffer3);
    free(buffer3);
    free(word);

    char buffer4[20];
    printf("%d\n", my_snprintf(buffer4, 20, "Hello = %lx", 12354396232012));
    printf("%s\n", buffer4);

    char buffer5[20];
    printf("%d\n", snprintf(buffer5, 20, "Hello = %lx", 12354396232012));
    printf("%s\n", buffer5);
    //p

    return SUCCESS_STATUS;
}
