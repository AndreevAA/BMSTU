/*!
\file
\brief Файл с объявлением выполнительных функций
\author    "Андреев Александр"
\version   2
\date      11 сентября 2020
 
Данный файл содержит в себе объявления функций,
производящих сортировку вставками, добавление
новой структуры в массив, поиск элемента 
в структуре, заполнение структуры. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "output.h"
#include "comparation.h"

/*!
Модуль сортировки вставками
\param[in] all_films Массив структур со всеми фильмами
\param[in] number_of_films Текущее количество вошедщих фильмов
\param[in] key_to_compare Содержание ключа к сравнению
*/
void insertionsort(struct films *all_films, int number_of_films, char *key_to_compare);

/*!
Модуль добавления нового фильма в массив структур
\param[in] all_films Массив структур со всеми фильмами
\param[in] number_of_films Текущее количество вошедщих фильмов
\param[in] temp_title Текущее название считанного фильма из файла
\param[in] temp_name Текущее имя автора считанного фильма из файла
\param[in] temp_year Текущий год считанного фильма из файла
*/
void add_temp_film(struct films *all_films, int *number_of_films, char *temp_title, char *temp_name, char *temp_year);

/*!
Модуль поиска фильма в массиве структур 
\param[in] all_films Массив структур со всеми фильмами
\param[in] number_of_films Текущее количество вошедщих фильмов
\param[in] key_to_compare Содержание ключа к сравнению
\param[in] field Поле поиска
\param[in] key Ключ поиска
*/
int search_field(struct films *all_films, int number_of_films, char *field, char *key, int *errorflag);

/*!
Модуль заполения структуры
param[in] all_films Массив структур со всеми фильмами
*/
void fill_struct(struct films *all_films);

