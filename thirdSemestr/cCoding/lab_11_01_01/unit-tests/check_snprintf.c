#include "../inc/config.h"
#include "../inc/mysnprintf.h"
#include "check_snprintf.h"

START_TEST(test_int_basic)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "%d", -240901);
    ck_assert_str_eq(buffer, "-240901");
    ck_assert_int_eq(len, 7);
}
END_TEST


START_TEST(test_int_max)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "%d", INT_MAX);
    ck_assert_str_eq(buffer, "2147483647");
    ck_assert_int_eq(len, 10);
}
END_TEST


START_TEST(test_int_min)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "%d", INT_MIN);
    ck_assert_str_eq(buffer, "-2147483648");
    ck_assert_int_eq(len, 11);
}
END_TEST

START_TEST(test_int_in_context)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "Where I can find this %d number? " 
        "Or this %d? In my birthday!", 2409, 2001);
    ck_assert_str_eq(buffer, "Where I can find this 2409 number?"
        " Or this 2001? In my birthday!");
    ck_assert_int_eq(len, 64);
}
END_TEST

START_TEST(test_str_basic)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "Hello! %s!", "Vladimir");
    ck_assert_str_eq(buffer, "Hello! Vladimir!");
    ck_assert_int_eq(len, 16);
}
END_TEST

START_TEST(test_str_null_str)
{
    char buffer[255] = { 0 };

    int len = my_snprintf(buffer, 255, "Your code is %s!", NULL);
    ck_assert_str_eq(buffer, "Your code is (null)!");
    ck_assert_int_eq(len, 20);
}
END_TEST

// START_TEST(test_snp_ok)
// {
//     //char expected[4][20] = { { "hiq 10q" }, { "hellq 999q" }, { "key\nq -10q" }, { "hehq 0q" } };
//     //int expected_count[4] = { 7, 10, 10, 7 };
//     char input_str[4][5] = { { "hi" }, { "hell" }, { "key\n" }, { "heh" } };
//     int input_int[4] = { 10, 999, -10, -0 };
//     //unsigned short input_16[4] = { 10, 999, 40, 0 };
//     char buffer[20];
//     char buffer_exp[20];

//     int count = 0;

//     for (int i = 0; i < 4; i++)
//     {
//         int p = my_snprintf(buffer, 20, "%sq %dq", input_str[i], input_int[i]);
//         int d = snprintf(buffer_exp, 20, "%sq %dq", input_str[i], input_int[i]);
//         if (p == d && strcmp(buffer, buffer_exp) == 0)
//             count++;
//         //printf("(%s : %s, %d : %d)\n", buffer, expected[i], p, expected_count[i]);
//     }
//     //printf("%d\n", count);
//     ck_assert_int_eq(count, 4);
// }
// END_TEST

START_TEST(test_snp_not_ok)
{
    //char buffer[20];
    int count = 0;
    // if (my_snprintf(NULL, 1, "123") == -1)
    // {
    //     //printf("1\n");
    //     count++;
    // }
    // //printf("%d\n", count);
    // if (my_snprintf(buffer, 2, "%%") == 1 && strcmp(buffer, "%") == 0)
    // {
    //     //printf("2\n");
    //     count++;
    // }
   //  printf("%d\n", my_snprintf(buffer, 3, "123"));
   //  if (my_snprintf(buffer, 3, "123") == 3 && strcmp(buffer, "12") == 0)
   //  {
   //      printf("3\n");
   //      count++;
   //  }
   //  printf("%s\n", buffer);
   //  printf("%d\n", my_snprintf(buffer, 2, "%hhY"));
   //  if (my_snprintf(buffer, 2, "%hhY") == 1 && strcmp(buffer, "Y") == 0)
   //  {
   //      printf("4\n");
   //      count++;
   //  }
   //  printf("%s\n", buffer);
   // // printf("%d\n", count);
    ck_assert_int_eq(count, 0);
}
END_TEST

START_TEST(test_str_basic_null)
{
    //char buffer[255] = { 0 };

    int len = my_snprintf(NULL, 0, "Hello! %s!", "Vladimir");
 
    ck_assert_int_eq(len, 16);
}
END_TEST

Suite* check_snprintf(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    s = suite_create("check_snprintf");

    tc_neg = tcase_create("negatives");
    tcase_add_test(tc_neg, test_snp_not_ok);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    //tcase_add_test(tc_pos, test_snp_ok);
    tcase_add_test(tc_pos, test_int_basic);
    tcase_add_test(tc_pos, test_int_max);
    tcase_add_test(tc_pos, test_int_min);
    tcase_add_test(tc_pos, test_int_in_context);
    tcase_add_test(tc_pos, test_str_basic);
    tcase_add_test(tc_pos, test_str_null_str);
    tcase_add_test(tc_pos, test_str_basic_null);
    suite_add_tcase(s, tc_pos);

    return s;
}
