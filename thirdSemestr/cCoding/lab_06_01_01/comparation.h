/*!
\file
\brief Файл со объявлением сравнительных функций
\author    "Андреев Александр"
\version   2
\date      9 сентября 2020
 
Данный файл содержит в себе объявления функций,
производящих сравнение сроковых данных и 
вынесенные декомпозировнные модули из бин-поиска
для оптимизации прочтения. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "main.h"
#include "output.h"

/*!
Модуль сравнения введенного KEY с существующими
\param[in] one_film Структура первого фильма
\param[in] second_film Структура второго фильма
\param[in] key_to_compare Содержание ключа к сравнению
*/
int compare_elems(films one_film, films second_film, char *key_to_compare);

/*!
Вынесенный декомпозированный модуль из бин-поиска по сравнению с серидиной и переназначением границ для <title>
\param[in] key Содержание ключа к сравнению
\param[in] all_films Структурный массив со всеми считанными из файла фильмами
\param[in] middle_position Середина массива
\param[in] left_border Левая граница массива
\param[in] right_border Правая граница массива
\param[in] search_index Показывает, нашлось ли равное значение в массиве
*/
int strcmp_title(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index);

/*!
Вынесенный декомпозированный модуль из бин-поиска по сравнению с серидиной и переназначением границ для <name>
\param[in] key Содержание ключа к сравнению
\param[in] all_films Структурный массив со всеми считанными из файла фильмами
\param[in] middle_position Середина массива
\param[in] left_border Левая граница массива
\param[in] right_border Правая граница массива
\param[in] search_index Показывает, нашлось ли равное значение в массиве
*/
int strcmp_name(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index);

/*!
Вынесенный декомпозированный модуль из бин-поиска по сравнению с серидиной и переназначением границ для <year>
\param[in] key Содержание ключа к сравнению
\param[in] all_films Структурный массив со всеми считанными из файла фильмами
\param[in] middle_position Середина массива
\param[in] left_border Левая граница массива
\param[in] right_border Правая граница массива
\param[in] search_index Показывает, нашлось ли равное значение в массиве
*/
int strcmp_year(char *key, films *all_films, int middle_position, int *left_border, int *right_border, int *search_index);
