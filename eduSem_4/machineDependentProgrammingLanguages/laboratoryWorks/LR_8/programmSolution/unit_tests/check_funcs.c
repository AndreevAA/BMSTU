#include "check_funcs.h"

#define BUFSIZE 100

START_TEST(length)
{
    const char *str = "Hello, world!";

    ck_assert_int_eq(asmstrlen(str), strlen(str));
}
END_TEST

START_TEST(copy)
{
    char src[] = "abcdefghijklmnopqrstuvwxyz";
    char dest[BUFSIZE] = "1234567890";
    int len = 2;

    strcopy(dest, src, len);

    ck_assert_str_eq(dest, "ab34567890");
}
END_TEST

START_TEST(copy2)
{
    char src[] = "abcdefghijklmnopqrstuvwxyz";
    char dest[BUFSIZE] = "1234567890";
    int len = 8;

    strcopy(src + 4, src, len);

    ck_assert_str_eq(src, "abcdabcdefghmnopqrstuvwxyz");
}
END_TEST

START_TEST(copy3)
{
    char src[] = "abcdefghijklmnopqrstuvwxyz";
    char dest[BUFSIZE] = "1234567890";
    int len = 8;

    strcopy(src, src + 4, len);

    ck_assert_str_eq(src, "efghijklijklmnopqrstuvwxyz");
}
END_TEST

Suite *check_suite(void)
{
    Suite *s;

    s = suite_create("suite");

    TCase *tc = tcase_create("length");
    tcase_add_test(tc, length);
    suite_add_tcase(s, tc);

    TCase *tc2 = tcase_create("copy");
    tcase_add_test(tc2, copy);
    tcase_add_test(tc2, copy2);
    tcase_add_test(tc2, copy3);
    suite_add_tcase(s, tc2);

    return s;
}
