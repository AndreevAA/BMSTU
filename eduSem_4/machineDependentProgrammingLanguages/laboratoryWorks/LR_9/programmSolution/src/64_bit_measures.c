#include "common.h"

#include "64_bit_measures.h"

void get_64_bit_sum(double a, double b, size_t count)
{
    double c;
    for (size_t i = 0; i < repeats; ++i)
        c = a + b;
}

#ifdef ASM
void get_64_bit_sum_asm(double a, double b, size_t count)
{
    double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void get_64_bit_prod(double a, double b, size_t count)
{
    double c;
    for (size_t i = 0; i < repeats; ++i)
        c = a * b;
}

#ifdef ASM
void get_64_bit_prod_asm(double a, double b, size_t count)
{
    double c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b)
            :);
}
#endif

void print_64_bit_measures()
{
    printf("double type size: %zu bites\n", sizeof(double) * CHAR_BIT);

    double a = 2e43, b = 11e53;

    clock_t begin = clock();
    get_64_bit_sum(a, b, repeats);
    clock_t end = clock();

    printf(SUM_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);

#ifdef ASM
    begin = clock();
    get_64_bit_sum_asm(a, b, repeats);
    end = clock();

    printf(ASM_SUM_FMT, (double)(end - begin) / CLOCKS_PER_SEC  / repeats);
#endif

    begin = clock();
    get_64_bit_prod(a, b, repeats);
    end = clock();

    printf(PROD_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);

#ifdef ASM
    begin = clock();
    get_64_bit_prod_asm(a, b, repeats);
    end = clock();

    printf(ASM_PROD_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);
#endif

    printf("\n");
}
