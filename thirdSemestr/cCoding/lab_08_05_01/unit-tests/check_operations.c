#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/operations.h"
#include "check_operations.h"
#include <stdio.h>

START_TEST(test_different_size)
{
    int result = ERROR_STATUS;
    struct matrix first_matrix, second_matrix;
    first_matrix.height = 100;
    first_matrix.width = 1000;
    second_matrix.height = 10;
    second_matrix.width = 200;
    if (is_correct_new_size(&first_matrix, &second_matrix) == SUCCESS_STATUS)
        result = SUCCESS_STATUS;
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_simmilar_size)
{
    int result = ERROR_STATUS;
    struct matrix first_matrix, second_matrix;
    first_matrix.height = 10;
    first_matrix.width = 10;
    second_matrix.height = 10;
    second_matrix.width = 10;
    if (is_correct_new_size(&first_matrix, &second_matrix) == SUCCESS_STATUS)
        result = SUCCESS_STATUS;
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* check_operations(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("is_correct_new_matrix_size");

    tc_neg = tcase_create("negatives");
    tcase_add_test(tc_neg, test_different_size);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    tcase_add_test(tc_pos, test_simmilar_size);
    suite_add_tcase(s, tc_pos);

    return s;
}
