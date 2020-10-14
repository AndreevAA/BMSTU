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


#include <stdlib.h>
#include <check.h>
#include "../inc/io.h"


// Это функция-тест (test function), которая реализует один конкретный тест.
//
// Описание функции-теста всегда начинается с макроса START_TEST, а заканчивается 
// макросом END_TEST. У макроса START_TEST есть параметр - это имя теста. Имя теста - это
// имя функции, поэтому оно должно быть корректным идентификатором языка Си. Имя теста
// должно быть информативным и описывать суть теста.
START_TEST(test_calc_all_in_is_not_sorted)
{
    int integer_vector[] = {3, 1, 2};

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
}
END_TEST


START_TEST(test_calc_all_in_is_sorted)
{
    int integer_vector[] = {1, 2, 3};

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
}
END_TEST

START_TEST(test_calc_all_in_not_uniq)
{
    int integer_vector[] = {1, 1, 3, 3, 0, 0};

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
}
END_TEST

START_TEST(test_calc_all_in_simmilar_filter)
{
    int integer_vector[] = {1, 1, 1, 1, 1};

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);
    mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
}
END_TEST

START_TEST(test_calc_all_in_not_simmilar_filter)
{
    int integer_vector[] = {1, 2, 5, 100, 10};

    int *start_integer_vector_cursor = integer_vector;
    int *end_integer_vector_cursor = integer_vector + size_of_integer_vector;

    int filter_status = key(integer_vector, integer_vector + size_of_integer_vector, &start_integer_vector_cursor, &end_integer_vector_cursor);
    mysort(start_integer_vector_cursor, end_integer_vector_cursor - start_integer_vector_cursor, sizeof(int),  compare);
}
END_TEST


// Функции-тесты группируются в тестовые случаи (test case, TCase), а несколько
// тестовых случаев образуют тестовый набор (test suite, Suite).
Suite* calc_avg_suite(void)
{
    Suite *s;
    TCase *tc_neg;
    TCase *tc_pos;

    // Создадим тестовый набор для тестирования функции calc_avg
    s = suite_create("calc_avg");
    
    // Создадим тестовый случай из функций-тестов, которые проверяют разного
    // рода ошибочные ситуации при вызове calc_avg
    tc_neg = tcase_create("negatives");
    // Добавим в tc_neg соответствующие функции-тесты
    tcase_add_test(tc_neg, test_calc_avg_bad_array);
    tcase_add_test(tc_neg, test_calc_avg_bad_array_size);
    tcase_add_test(tc_neg, test_calc_avg_bad_avg_ptr);
    tcase_add_test(tc_neg, test_calc_avg_empty_array);

    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_neg);
    
    // Создадим тестовый случай из функций-тестов, которые проверяют работу
    // calc_avg для корректных параметров
    tc_pos = tcase_create("positives");
    // Добавим в tc_pos соответствующие функции-тесты
    tcase_add_test(tc_pos, test_calc_avg_zero_avg);
    tcase_add_test(tc_pos, test_calc_avg_usual_array);
    tcase_add_test(tc_pos, test_calc_avg_array_with_one_element);

    // Добавим сформированный тестовый случай в тестовый набор
    suite_add_tcase(s, tc_pos);

    return s;
}


int main(void)
{
    int no_failed = 0;
    Suite *s;
    SRunner *runner;

    s = calc_avg_suite();
    // Для запуска тестов, всходящих в тестовый набор, нужно создать так называемый
    // "runner".
    runner = srunner_create(s);

    // Вот таким образом запускаются все тесты. С помощью второго параметра (в данном случаев
    // CK_VERBOSE) можно детализировать вывод.
    srunner_run_all(runner, CK_VERBOSE);
    // После того, как все тесты будут выполнены, можно получить по ним дополнительную информацию,
    // например, вот так.
    no_failed = srunner_ntests_failed(runner);
    // Перед завершением main "runner" нужно обязательно освободить.
    srunner_free(runner);

    return (no_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
