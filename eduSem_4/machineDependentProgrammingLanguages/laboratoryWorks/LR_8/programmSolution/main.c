#include <stdio.h>
#include <string.h>

#define BUF_LEN 100

// принимает 1 параметр - указатель на строку
// определяет и возвращает длину строки
// выполнена в виде ассемблерной вставки;

int asm_strlen(const char *str)
{
    int len = 0;
/*
    asm (
         текст_вставки :
         список_выходных_параметров :
         список_входных_параметров :    /обращение к описанному операнду осуществляется по номеру с префиксом %
                                        /ограничение_типа (имя_переменной)
                                        /r=рон 64, m=память
         список_разрушаемых_регистров
    )
*/

    //scasb сравнивает регистр AL с байтом в ячейке памяти по адресу ES:DI и устанавливает флаги аналогично команде CMP.
    //После выполнения команды, регистр DI увеличивается на 1, тк DF = 0, (или уменьшается на 1, если DF = 1).

    __asm__ (
        ".intel_syntax noprefix\n\t" //требуется ли префикс % для названий регистров.

        "xor al, al\n\t"              // символ==конец строки
        "lea rdi, [%1]\n\t"          // сама строка в di
        "mov ecx, 0xffffffff\n\t"    // чтобы цикл не прекратился из-за cx
        "repne scasb\n\t"            // продолжаем, пока не встретим конец строки

        "mov eax, 0xffffffff\n\t"    // вычисляем разность-1 (выполгится первый раз всегда)
        "sub eax, ecx\n\t"
        "dec eax\n\t"

        "mov %0, eax\n\t"           // возвращаем результат - через eax.

        //".att_syntax prefix"        //включить at&t синтаксис обратно
        : "=r" (len)
        : "r" (str)
        : "ecx", "eax", "al", "rdi");

    return len;
}

void test_asm_strlen(void)
{
    printf("\nTest asm_strlen\n\n");

    const char *string = "123456789";
    printf("1) String: '%s'\n", string);

    if (asm_strlen(string) == strlen(string))
        printf("    Passed\n");
    else
        printf("    ERROR!!!!!!\n");

    string = "1";
    printf("2) String: '%s'\n", string);

    if (asm_strlen(string) == strlen(string))
        printf("    Passed\n");
    else
        printf("    ERROR!!!!!!\n");

    string = "";
    printf("2) String: '%s'\n", string);

    if (asm_strlen(string) == strlen(string))
        printf("    Passed\n");
    else
        printf("    ERROR!!!!!!\n");

}

void asm_strncpy(char *dest, char *src, int len);

void test_asm_strncopy()
{
    printf("\nTest asm_strncpy\n\n");

    char src[] = "123456789";
    char dest[BUF_LEN] = "987654321";
    int len;

    printf("Test1: src and dst are in different places.\n"
           "src = '%s'\n"
           "dest - '%s'\n\n"
           "asm_strncpy(dest, src, 2)\n", src, dest);

    len = 2;
    asm_strncpy(dest, src, len);
    printf("Result: %s\n\n", dest);

    printf("Test2: src and dst are in one place.\n"
           "dest = '%s'\n\n"
           "asm_strncpy(dest, dest+5, 3)", src);
    asm_strncpy(dest, dest+5, 3);
    printf("Result: %s\n\n", dest);

    printf("asm_strncpy(dest+5, dest, 3)\n");
    asm_strncpy(dest+5, dest, 3);
    printf("Result: %s\n\n", dest);

}

int main()
{
    setbuf(stdout, NULL);
    test_asm_strlen();
    test_asm_strncopy();

    return 0;
}
