#include "../inc/config.h"
#include "../inc/io.h"
#include "check_io.h"
#include <stdio.h>

START_TEST(test_big_size)
{
    int width = 1000, height = 2000;
    int result = is_correct_matrix_size(&height, &width);

    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_normal_size)
{
    int width = 10, height = 20;
    int result = !is_correct_matrix_size(&height, &width);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

START_TEST(test_minus_degree)
{
    int ro = -10, gamma = -15;
    int result = !is_correct_degree(&ro, &gamma);
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_normal_degree)
{
    int ro = 10, gamma = 20;
    int result = !is_correct_degree(&ro, &gamma);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* check_io(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("check_io");

    tc_neg = tcase_create("negatives");
    tcase_add_test(tc_neg, test_big_size);
    tcase_add_test(tc_neg, test_minus_degree);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    tcase_add_test(tc_pos, test_normal_size);
    tcase_add_test(tc_pos, test_normal_degree);
    suite_add_tcase(s, tc_pos);

    return s;
}
