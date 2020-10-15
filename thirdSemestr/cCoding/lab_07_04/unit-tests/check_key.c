// Сборка примера в MSYS2
//
// gcc -std=c99 -Wall -Werror -c avc.c
// gcc -std=c99 -Wall -Werror -c check_unit_tests.c
// gcc -o app.exe avg.o check_unit_tests.o -lcheck
//
// Сборка примера в Linux
//
// gcc -std=c99 -Wall -Werror -c avc.c
// gcc -std=c99 -Wall -Werror -c check_unit_tests.c
// gcc -o app.exe avg.o check_unit_tests.o -lcheck -lpthread -lrt


#include "check_sort.h"

#include "../inc/key.h"
#include <stdio.h>


START_TEST(test_calc_all_in_simmilar_filter)
{
    int integer_vector[5] = {1, 1, 1, 1, 1}, size_of_integer_vector = 5;

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);
    
    ck_assert_int_eq(filter_status, 1);
    ck_assert_ptr_eq(start_integer_vector_cursor, NULL);
}
END_TEST

START_TEST(test_calc_all_in_not_simmilar_filter)
{
    // int integer_vector[5] = {1, 2, 5, 100, 10}, size_of_integer_vector = 5;
    // int good_vector[1] = {100};

    // int *start_integer_vector_cursor = integer_vector;
    // int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    // int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);

    // ck_assert_int_eq(filter_status, 0);
    // for (int check_cursor = 0; check_cursor < 1; check_cursor++)
    //     ck_assert_int_eq(good_vector[check_cursor], start_integer_vector_cursor[check_cursor]);

    // if (!filter_status)
    //     free (start_integer_vector_cursor);

    int array[5] = {4, 6, 8, 0, 7};
    int copy[3] = {6, 7, 8};
    int *start = NULL, *end = NULL;

    int result = key(array, array + 5, &start, &end);

    ck_assert_int_eq(result, 0);
    for (int i = 0; i < 3; i++)
        ck_assert_int_eq(copy[i], start[i]);

    if (!result)
        free (start);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* key_test_suite(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("key_test_suite");

    tc_neg = tcase_create("negatives");
    // Добавим в tc_neg соответствующие функции-тесты
    tcase_add_test(tc_neg, test_calc_all_in_simmilar_filter);

    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");

   // tcase_add_test(tc_pos, test_calc_all_in_simmilar_filter);
    tcase_add_test(tc_pos, test_calc_all_in_not_simmilar_filter);
    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_pos);

    return s;
}
