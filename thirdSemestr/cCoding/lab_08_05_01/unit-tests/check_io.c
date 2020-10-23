#include "../inc/config.h"
#include "../inc/io.h"
#include "check_io.h"
#include <stdio.h>

START_TEST(test_big_size)
{
    int width = 1000, height = 2000, result = ERROR_STATUS;
    if ((width) >= MIN_SIZE && (width) <= MAX_SIZE && (height) >= MIN_SIZE && (height) <= MAX_SIZE)
        result = SUCCESS_STATUS;

    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_normal_size)
{
    int width = 10, height = 20, result = ERROR_STATUS;
    if ((width) >= MIN_SIZE && (width) <= MAX_SIZE && (height) >= MIN_SIZE && (height) <= MAX_SIZE)
        result = SUCCESS_STATUS;
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* check_is_correct_matrix_size(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("is_correct_matrix_size");

    tc_neg = tcase_create("negatives");
    tcase_add_test(tc_neg, test_big_size);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    tcase_add_test(tc_pos, test_normal_size);
    suite_add_tcase(s, tc_pos);

    return s;
}
