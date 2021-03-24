#include "../inc/config.h"
#include "../inc/io.h"
#include "../inc/operations.h"
#include "check_operations.h"
#include <stdio.h>

int pow_comp(struct matrix *i, int degree)
{
    return pow_matrix(&i, degree);
}

START_TEST(test_different_size)
{
    struct matrix first_matrix, second_matrix;
    first_matrix.height = 100;
    first_matrix.width = 1000;
    second_matrix.height = 10;
    second_matrix.width = 200;
    int result = is_correct_new_size(&first_matrix, &second_matrix);
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_simmilar_size)
{
    struct matrix first_matrix, second_matrix;
    first_matrix.height = 10;
    first_matrix.width = 10;
    second_matrix.height = 10;
    second_matrix.width = 10;
    int result = is_correct_new_size(&first_matrix, &second_matrix);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

START_TEST(test_not_square)
{
    int height = 10, width = 20;
    int result = is_square_matrix(&height, &width);
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_square)
{
    int ro = 20, gamma = 20;
    int result = is_square_matrix(&ro, &gamma);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

START_TEST(test_not_vertical)
{
    int height = 10, width = 20;
    int result = !is_vertical_matrix(&height, &width);
    ck_assert_int_eq(result, ERROR_STATUS);
}
END_TEST

START_TEST(test_vertical)
{
    int ro = 20, gamma = 10;
    int result = !is_vertical_matrix(&ro, &gamma);
    ck_assert_int_eq(result, SUCCESS_STATUS);
}
END_TEST

// Deleting minimal string
START_TEST(delete_min_str)
{
    struct matrix temp;
    temp.width = 2;
    temp.height = 4;
    temp.indicators = (int **)malloc((temp.height) * sizeof(int *));
    temp.elements = (int *)malloc((temp.width * temp.height) * sizeof(int));
    int temp_elements[8] = {1, 2, 3, 4, 5, 6, 7, 8};

    for (int add = 0; add < temp.width * temp.height; add++)
    {
        temp.elements[add] = temp_elements[add];
        if (add % temp.width == 0)
            temp.indicators[add / temp.width] = temp.elements + add;
    }

    int right_size = 2;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[4] = {5, 6, 7, 8};
    right.width = 2;
    right.height = 2;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    int result = delete_min_string_or_table(&temp);

    // printf("%d, %d\n", temp.width, right.width);
    // //output_matrix(&temp);

    ck_assert_int_eq(result, SUCCESS_STATUS);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
        {
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);
        }

    free_matrix(&temp);
    free_matrix(&right);
}
END_TEST

// Deleting minimal row
START_TEST(delete_min_row)
{
    struct matrix temp;
    temp.width = 6;
    temp.height = 2;
    temp.indicators = (int **)malloc((temp.height) * sizeof(int *));
    temp.elements = (int *)malloc((temp.width * temp.height) * sizeof(int));
    int temp_elements[12] = {1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0};

    for (int add = 0; add < temp.width * temp.height; add++)
    {
        temp.elements[add] = temp_elements[add];
        if (add % temp.width == 0)
            temp.indicators[add / temp.width] = temp.elements + add;
    }

    int right_size = 2;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[4] = {4, 5, 4, 5};
    right.width = 2;
    right.height = 2;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    int result = delete_min_string_or_table(&temp);

    // printf("%d, %d\n", temp.width, right.width);
    // //output_matrix(&temp);

    ck_assert_int_eq(result, SUCCESS_STATUS);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
        {
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);
        }

    free_matrix(&temp);
    free_matrix(&right);
}
END_TEST

// Deleting minimal row
START_TEST(powing_matrix)
{
    struct matrix temp;
    temp.width = 2;
    temp.height = 2;
    temp.indicators = (int **)malloc((temp.height) * sizeof(int *));
    temp.elements = (int *)malloc((temp.width * temp.height) * sizeof(int));
    int temp_elements[4] = {4, 5, 4, 5};

    for (int add = 0; add < temp.width * temp.height; add++)
    {
        temp.elements[add] = temp_elements[add];
        if (add % temp.width == 0)
            temp.indicators[add / temp.width] = temp.elements + add;
    }

    int right_size = 2;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[4] = {2916, 3645, 2916, 3645};
    right.width = 2;
    right.height = 2;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    //struct matrix *p = temp;
    int result = pow_comp(&(temp), 4);

    // printf("%d, %d\n", temp.width, right.width);
    // //output_matrix(&temp);

    ck_assert_int_eq(result, SUCCESS_STATUS);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
        {
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);
        }

    free_matrix(&temp);
    free_matrix(&right);
}
END_TEST

// Deleting minimal row
START_TEST(updating_matrix)
{
    struct matrix temp;
    temp.width = 2;
    temp.height = 2;
    temp.indicators = (int **)malloc((temp.height) * sizeof(int *));
    temp.elements = (int *)malloc((temp.width * temp.height) * sizeof(int));
    int temp_elements[4] = {4, 7, 3, 2};

    for (int add = 0; add < temp.width * temp.height; add++)
    {
        temp.elements[add] = temp_elements[add];
        if (add % temp.width == 0)
            temp.indicators[add / temp.width] = temp.elements + add;
    }

    int right_size = 3;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[9] = {4, 7, 7, 3, 2, 3, 3, 4, 4};
    right.width = 3;
    right.height = 3;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    update_matrix(&temp, right.width);
    //output_matrix(&temp);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);

    free_matrix(&temp);
    free_matrix(&right);
}
END_TEST

START_TEST(get_mult_pow_matrix)
{
    struct matrix temp;
    

    struct matrix first;
    first.width = 2;
    first.height = 2;
    first.indicators = (int **)malloc((first.height) * sizeof(int *));
    first.elements = (int *)malloc((first.width * first.height) * sizeof(int));
    int first_elements[4] = {5, 6, 7, 8};

    for (int add = 0; add < first.width * first.height; add++)
    {
        first.elements[add] = first_elements[add];
        if (add % first.width == 0)
            first.indicators[add / first.width] = first.elements + add;
    }

    struct matrix second;
    second.width = 2;
    second.height = 2;
    second.indicators = (int **)malloc((second.height) * sizeof(int *));
    second.elements = (int *)malloc((second.width * second.height) * sizeof(int));
    int second_elements[4] = {4, 5, 4, 5};

    for (int add = 0; add < second.width * second.height; add++)
    {
        second.elements[add] = second_elements[add];
        if (add % second.width == 0)
            second.indicators[add / second.width] = second.elements + add;
    }

    int right_size = 2;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[4] = {422820, 528525, 574452, 718065};
    right.width = 2;
    right.height = 2;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    int ro = 2, gamma = 4;

    //struct matrix *p = temp;
    int result = get_multiplicated_powed_matrix(&temp, &first, &second, &ro, &gamma);

    // printf("%d, %d\n", temp.width, right.width);
    //output_matrix(&temp);

    //printf("%d : %d, %d : %d\n", temp.width, right.width, temp.height, right.height);

    ck_assert_int_eq(result, ERROR_STATUS);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
        {
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);
        }

    free_matrix(&temp);
    free_matrix(&right);
}
END_TEST


START_TEST(multing_matrix)
{
    struct matrix temp;
    temp.width = 2;
    temp.height = 2;
    temp.indicators = (int **)malloc((temp.height) * sizeof(int *));
    temp.elements = (int *)malloc((temp.width * temp.height) * sizeof(int));
    int temp_elements[4] = {0, 0, 0, 0};

    for (int add = 0; add < temp.width * temp.height; add++)
    {
        temp.elements[add] = temp_elements[add];
        if (add % temp.width == 0)
            temp.indicators[add / temp.width] = temp.elements + add;
    }

    struct matrix first;
    first.width = 2;
    first.height = 2;
    first.indicators = (int **)malloc((first.height) * sizeof(int *));
    first.elements = (int *)malloc((first.width * first.height) * sizeof(int));
    int first_elements[4] = {1, 2, 3, 4};

    for (int add = 0; add < first.width * first.height; add++)
    {
        first.elements[add] = first_elements[add];
        if (add % first.width == 0)
            first.indicators[add / first.width] = first.elements + add;
    }

    struct matrix second;
    second.width = 2;
    second.height = 2;
    second.indicators = (int **)malloc((second.height) * sizeof(int *));
    second.elements = (int *)malloc((second.width * second.height) * sizeof(int));
    int second_elements[4] = {4, 5, 6, 7};

    for (int add = 0; add < second.width * second.height; add++)
    {
        second.elements[add] = second_elements[add];
        if (add % second.width == 0)
            second.indicators[add / second.width] = second.elements + add;
    }

    int right_size = 2;
    struct matrix right;
    right.indicators = (int **)malloc((right_size) * sizeof(int *));
    right.elements = (int *)malloc((right_size * right_size) * sizeof(int));
    int right_elements[4] = {16, 19, 36, 43};
    right.width = 2;
    right.height = 2;

    for (int add = 0; add < right_size * right_size; add++)
    {
        right.elements[add] = right_elements[add];
        if (add % right.width == 0)
            right.indicators[add / right_size] = right.elements + add;
    }

    //struct matrix *p = temp;
    int result = mult_matrix(&temp, &first, &second);

    // printf("%d, %d\n", temp.width, right.width);
    //output_matrix(&temp);

    //printf("%d : %d, %d : %d\n", temp.width, right.width, temp.height, right.height);

    ck_assert_int_eq(result, SUCCESS_STATUS);
    ck_assert_int_eq(temp.width == right.width, ERROR_STATUS);
    ck_assert_int_eq(temp.height == right.width, ERROR_STATUS);

    for (int check_string_number = 0; check_string_number < right.height; check_string_number++)
        for (int check_row_number = 0; check_row_number < right.width; check_row_number++)
        {
            ck_assert_int_eq(*(temp.indicators[check_string_number] + check_row_number) == *(right.indicators[check_string_number] + check_row_number), ERROR_STATUS);
        }

    free_matrix(&temp);
    free_matrix(&right);
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
    tcase_add_test(tc_neg, test_not_square);
    tcase_add_test(tc_neg, test_not_vertical);
    suite_add_tcase(s, tc_neg);

    tc_pos = tcase_create("positives");
    tcase_add_test(tc_pos, test_simmilar_size);
    tcase_add_test(tc_pos, test_square);
    tcase_add_test(tc_pos, test_vertical);
    tcase_add_test(tc_pos, delete_min_str);
    tcase_add_test(tc_pos, delete_min_row);
    tcase_add_test(tc_pos, powing_matrix);
    tcase_add_test(tc_pos, updating_matrix);
    tcase_add_test(tc_pos, multing_matrix);
    tcase_add_test(tc_pos, get_mult_pow_matrix);
    suite_add_tcase(s, tc_pos);
    

    return s;
}
