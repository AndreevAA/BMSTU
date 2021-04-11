#include "../inc/config.h"
#include "../inc/io.h"
#include "check_io.h"
#include <stdio.h>

START_TEST(test_is_args_not_ok)
{
    char *argv_data[NUM_OF_ARGS] = {"word\0", "word\0", "word\0"};
    int result = is_args_ok(NUM_OF_ARGS, argv_data);

    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

// START_TEST(test_is_args_ok_find)
// {
//     char *argv_data[NUM_OF_ARGS_FIND] = {"one", "two", "find", "smth"};
    
//     int result = is_args_ok(NUM_OF_ARGS_FIND, argv_data);

//     ck_assert_int_eq(result, SUCCESS_STATUS);
// }
// END_TEST

START_TEST(test_is_args_ok_reverse)
{
    char *argv_data[NUM_OF_ARGS] = {"one\0", "two\0", "reverse\0"};
    
    int result = is_args_ok(NUM_OF_ARGS, argv_data);

    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

START_TEST(test_is_args_ok_sort)
{
    char *argv_data[NUM_OF_ARGS] = {"one\0", "two\0", "sort\0"};
    
    int result = is_args_ok(NUM_OF_ARGS, argv_data);

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
    tcase_add_test(tc_neg, test_is_args_not_ok);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    //tcase_add_test(tc_pos, test_is_args_ok_find);
    tcase_add_test(tc_pos, test_is_args_ok_reverse);
    tcase_add_test(tc_pos, test_is_args_ok_sort);
    suite_add_tcase(s, tc_pos);

    return s;
}
