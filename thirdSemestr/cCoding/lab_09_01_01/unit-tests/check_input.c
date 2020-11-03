#include "check_input.h"

START_TEST(test_right_data)
{
    char new[] = "1234";
    int result = is_data_right(new);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

START_TEST(test_not_num_data)
{
    char new[] = "not_num_data";
    int result = is_data_right(new);
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* check_input(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("check_input");

    tc_neg = tcase_create("negatives");
    tcase_add_test(tc_neg, test_not_num_data);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    tcase_add_test(tc_pos, test_right_data);
    suite_add_tcase(s, tc_pos);

    return s;
}
