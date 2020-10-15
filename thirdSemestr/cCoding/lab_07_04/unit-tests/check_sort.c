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

#include "../inc/sort.h"
#include <stdio.h>


// Это функция-тест (test function), которая реализует один конкретный тест.
//
// Описание функции-теста всегда начинается с макроса START_TEST, а заканчивается 
// макросом END_TEST. У макроса START_TEST есть параметр - это имя теста. Имя теста - это
// имя функции, поэтому оно должно быть корректным идентификатором языка Си. Имя теста
// должно быть информативным и описывать суть теста.
// START_TEST(test_calc_all_in_is_not_sorted)
// {
//     int integer_vector[] = {3, 1, 2}, size_of_integer_vector = 3;
//     int good_vector[] = {1, 2, 3};

//     int *start_integer_vector_cursor = integer_vector;
//     int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

//     mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);

//     for (int check_cursor = 0; check_cursor < size_of_integer_vector; check_cursor++)
//         ck_assert_int_eq(good_vector[check_cursor], integer_vector[check_cursor]);
// }
// END_TEST


// START_TEST(test_calc_all_in_is_sorted)
// {
//     int integer_vector[] = {1, 2, 3}, size_of_integer_vector = 3;
//     int good_vector[] = {1, 2, 3};

//     int *start_integer_vector_cursor = integer_vector;
//     int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

//     mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);

//     for (int check_cursor = 0; check_cursor < size_of_integer_vector; check_cursor++)
//         ck_assert_int_eq(good_vector[check_cursor], integer_vector[check_cursor]);
// }
// END_TEST

// START_TEST(test_calc_all_in_not_uniq)
// {
//     int integer_vector[] = {1, 1, 3, 3, 0, 0}, size_of_integer_vector = 6;
//     int good_vector[] = {0, 0, 1, 1, 3, 3};

//     int *start_integer_vector_cursor = integer_vector;
//     int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

//     mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);

//     for (int check_cursor = 0; check_cursor < size_of_integer_vector; check_cursor++)
//         ck_assert_int_eq(good_vector[check_cursor], integer_vector[check_cursor]);
// }
// END_TEST

// START_TEST(test_calc_all_in_simmilar_filter)
// {
//     int integer_vector[] = {1, 1, 1, 1, 1}, size_of_integer_vector = 5;

//     int *start_integer_vector_cursor = integer_vector;
//     int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

//     //int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);
//     mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
// }
// END_TEST

// START_TEST(test_calc_all_in_not_simmilar_filter)
// {
//     int integer_vector[] = {1, 2, 5, 100, 10}, size_of_integer_vector = 5;

//     int *start_integer_vector_cursor = integer_vector;
//     int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

//     //int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);
//     mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
// }
// END_TEST

// START_TEST(test_sort_standart)
// {
//     int array[5] = {497, 674, -148, -45, 2347};
//     int copy[5] = {-148, -45, 497, 674, 2347};

//     mysort((void *) array, 5, sizeof(int), compare);

//     for (int i = 0; i < 5; i++)
//         ck_assert_int_eq(copy[i], array[i]);
// }
// END_TEST

// START_TEST(test_sort_equal_ints)
// {
//     int array[5] = {4, 4, 4, 4, 4};
//     int copy[5] = {4, 4, 4, 4, 4};

//     mysort((void *) array, 5, sizeof(int), compare);

//     for (int i = 0; i < 5; i++)
//         ck_assert_int_eq(copy[i], array[i]);
// }
// END_TEST


// // Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// // тестовых случаев образуют тестовый набор (test suite, Suite).
// Suite* sort_test_suite(void)
// {
//     Suite *s;
//     TCase *tc_neg;
//     TCase *tc_pos;

//     // Создадим тестовый набор для тестирования функции calc_avg
//     s = suite_create("sort_test_suite");
    
//     // Создадим тестовый случай из функций-тестов, которые проверяют разного
//     // рода ошибочные ситуации при вызове calc_avg
//     // tc_neg = tcase_create("negatives");
//     // // Добавим в tc_neg соответствующие функции-тесты
//     // tcase_add_test(tc_neg, test_calc_avg_bad_array);
//     // tcase_add_test(tc_neg, test_calc_avg_bad_array_size);
//     // tcase_add_test(tc_neg, test_calc_avg_bad_avg_ptr);
//     // tcase_add_test(tc_neg, test_calc_avg_empty_array);
//     tc_neg = tcase_create("negatives");
//     // Добавим в tc_neg соответствующие функции-тесты
//     tcase_add_test(tc_neg, test_sort_equal_ints);

//     // Добавим сформированный тестовый случай в тестовый набор
//     suite_add_tcase(s, tc_neg);

//     // // Добавим сформированный тестовый случай в тестовый набор
//     // suite_add_tcase(s, tc_neg);
    
//     // Создадим тестовый случай из функций-тестов, которые проверяют работу
//     // calc_avg для корректных параметров
//     tc_pos = tcase_create("positives");
//     // Добавим в tc_pos соответствующие функции-тесты
//     tcase_add_test(tc_pos, test_sort_standart);
//     // tcase_add_test(tc_pos, test_calc_all_in_is_sorted);
//     // tcase_add_test(tc_pos, test_calc_all_in_not_uniq);
//     // tcase_add_test(tc_pos, test_calc_all_in_simmilar_filter);
//     // tcase_add_test(tc_pos, test_calc_all_in_not_simmilar_filter);
//     // Добавим сформированный тестовый случай в тестовый набор
//     suite_add_tcase(s, tc_pos);

//     return s;
// }

int comparec(void *first, void *second)
{
    return *((char *)first) - *((char *)second);
}

int compared(void *first, void *second)
{
    return *((double *)first) - *((double *)second) > 0 ? 1 : *((double *)first) - *((double *)second) < 0 ? -1 : 0;
}

START_TEST(test_sort_standart)
{
    int array[5] = {497, 674, -148, -45, 2347};
    int copy[5] = {-148, -45, 497, 674, 2347};

    mysort((void *) array, 5, sizeof(int), compare);

    for (int i = 0; i < 5; i++)
        ck_assert_int_eq(copy[i], array[i]);
}
END_TEST

START_TEST(test_sort_standart_char)
{
    char array[5] = {'a', 'k', 'c', 'z', 'b'};
    char copy[5] = {'a', 'b', 'c', 'k', 'z'};

    mysort((void *) array, 5, sizeof(char), comparec);


    for (int i = 0; i < 5; i++)
        ck_assert_int_eq((int)copy[i], (int)array[i]);
}
END_TEST

START_TEST(test_sort_standart_double)
{
    double array[5] = {4.1, 6.3, 8.13, 8.12, 7};
    double copy[5] = {4.1, 6.3, 7, 8.12, 8.13};

    mysort((void *) array, 5, sizeof(double), compared);

    for (int i = 0; i < 5; i++)
        ck_assert_double_eq(copy[i], array[i]);
}
END_TEST

START_TEST(test_sort_sorted)
{
    int array[5] = {4, 5, 6, 7, 8};
    int copy[5] = {4, 5, 6, 7, 8};

    mysort((void *) array, 5, sizeof(int), compare);

    for (int i = 0; i < 5; i++)
        ck_assert_int_eq(copy[i], array[i]);
}
END_TEST


START_TEST(test_sort_nullpointer)
{
    int *array = NULL;

    mysort((void *) array, 5, sizeof(int), compare);

    ck_assert_ptr_eq(array, NULL);
}
END_TEST


START_TEST(test_sort_zero_len)
{
    int array[1];

    mysort((void *) array, 0, sizeof(int), compare);

    ck_assert_ptr_eq(array, array);
}
END_TEST


START_TEST(test_sort_equal_ints)
{
    int array[5] = {4, 4, 4, 4, 4};
    int copy[5] = {4, 4, 4, 4, 4};

    mysort((void *) array, 5, sizeof(int), compare);

    for (int i = 0; i < 5; i++)
        ck_assert_int_eq(copy[i], array[i]);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* sort_test_suite(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    // Создадим тестовый набор для тестирования функции calc_avg
    s = suite_create("sort-tests");

    // Создадим тестовый случай из функций-тестов, которые проверяют разного
    // рода ошибочные ситуации при вызове calc_avg
    tc_neg = tcase_create("negatives");
    // Добавим в tc_neg соответствующие функции-тесты
    tcase_add_test(tc_neg, test_sort_nullpointer);
    tcase_add_test(tc_neg, test_sort_zero_len);
    tcase_add_test(tc_neg, test_sort_equal_ints);

    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_neg);

    // Создадим тестовый случай из функций-тестов, которые проверяют работу
    // calc_avg для корректных параметров
    tc_pos = tcase_create("positives");
    // Добавим в tc_pos соответствующие функции-тесты
    tcase_add_test(tc_pos, test_sort_standart);
    tcase_add_test(tc_pos, test_sort_standart_char);
    tcase_add_test(tc_pos, test_sort_standart_double);
    tcase_add_test(tc_pos, test_sort_sorted);

    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_pos);

    return s;
}
