#include "common.h"

#include "80_bit_measures.h"

#ifdef X87
void get_80_bit_sum(__float80 a, __float80 b, size_t count)
{
    __float80 c;
    for (size_t i = 0; i < count; ++i)
        c = a + b;
}

#ifdef ASM
void get_80_bit_sum_asm(__float80 a, __float80 b, size_t count)
{
    __float80 c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "faddp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif

void get_80_bit_prod(__float80 a, __float80 b, size_t count)
{
    __float80 c;
    for (size_t i = 0; i < count; ++i)
        c = a * b;
}

#ifdef ASM
void get_80_bit_prod_asm(__float80 a, __float80 b, size_t count)
{
    __float80 c;

    for (size_t i = 0; i < count; ++i)
        asm("fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            : "=m"(c)
            : "m"(a), "m"(b));
}
#endif
#endif

void print_80_bit_measures()
{
#ifdef X87
    printf("__float80 type size: %zu bites\n", sizeof(__float80) * CHAR_BIT);

    __float80 a = 2e43, b = 11e53;

    clock_t begin = clock();
    get_80_bit_sum(a, b, repeats);
    clock_t end = clock();

    printf(SUM_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);

#ifdef ASM
    begin = clock();
    get_80_bit_sum_asm(a, b, repeats);
    end = clock();

    printf(ASM_SUM_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);
#endif

    begin = clock();
    get_80_bit_prod(a, b, repeats);
    end = clock();

    printf(PROD_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);

#ifdef ASM
    begin = clock();
    get_80_bit_prod_asm(a, b, repeats);
    end = clock();

    printf(ASM_PROD_FMT, (double)(end - begin) / CLOCKS_PER_SEC / repeats);
#endif

    printf("\n");
#endif
}
