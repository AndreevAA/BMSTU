/*!
\file
\brief Файл со объявлением выводящих функций
\author    "Андреев Александр"
\version   2
\date      9 сентября 2020
 
Данный файл содержит в себе объявления функций,
производящих вывод функций. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "../inc/input.h"
#include "../inc/functions.h"

/*!
Модуль сравнения введенного KEY с существующими
\param[in] title Название фильма
\param[in] name Имя автора фильма
\param[in] year Дата выхода фильма
*/
void output_data(char *title, char *name, char *year);

/*!
Модуль сравнения введенного KEY с существующими
\param[in] all_films Структурный массив со всеми считанными из файла фильмами
\param[in] number_of_films Текущее количество вошедщих фильмов
*/
int output_sorted_data(struct films *all_films, int number_of_films);

/*!
Вывод данных на экран в случае ситуации Not found
*/
void output_not_found();

int check_data(struct films *all_films, int number_of_films);
