/*!
\file
\brief Заголовочный файл с описанием функций
\author    "Андреев Александр"
\version   1
\date      21 мая 2020
 
Данный файл содержит в себе определения функций, используемых в демонстрационной программе
*/

/*!
Находит наболее часто встречающийся элемент
\param list_of_numbers Массив количества встреч цифр среди элементов матрицы
\return Позицию числа в массиве с наибольшим значением
 
Код функции выглядит следующим образом:
\code
int findmaxelement(int *list_of_numbers)
{
    int numberofelement = 0, element = 0;
    for (int i = 0; i < 10; i++)
    {
        if (*(list_of_numbers + i) > numberofelement)
        {
            numberofelement = *(list_of_numbers + i);
            element = i;
        }
    }
    return element;
}

\endcode
*/
int findmaxelement(int *list_of_numbers);

/*!
Обновляет цифры числа элементов матрицы
\param[in] number Текущая цифра числа матрицы
\param[in] errorflag Флаг об ошибке
\param[out] errorflag Измененный флаг об ошибке
\param[in] list_of_numbers Массив количества встреч цифр среди элементов матрицы
\param[out] list_of_numbers  Измененный массив количества встреч цифр среди элементов матрицы
*/
void refreshfrequent(long int number, int *list_of_numbers, int *errorflag);

/*!
Получает цифры чисел матрицы
\param[in] tempnumber Текущее число матрицы
\param[in] errorflag Флаг об ошибке
\param[out] errorflag Измененный флаг об ошибке
\param[in] list_of_numbers Массив количества встреч цифр среди элементов матрицы
\param[out] list_of_numbers  Измененный массив количества встреч цифр среди элементов матрицы
*/
void getnumbers(long int *tempnumber, int *list_of_numbers, int *errorflag);

/*!
Получает следущее число матрицы
\param[in] file Ресурсный файл, откуда считывается матрицы
\param[in] errorflag Флаг об ошибке
\param[out] errorflag Измененный флаг об ошибке
\param[in] list_of_numbers Массив количества встреч цифр среди элементов матрицы
\param[out] list_of_numbers  Измененный массив количества встреч цифр среди элементов матрицы
*/
void getnextelement(FILE *file, int *list_of_numbers, int *errorflag, char *argv[]);

/*!
Проверяет матрицу в файле на предмет размерности
\param[in] hight Высота матрицы
\param[in] width Ширина матрицы
\param[in] errorflag Флаг об ошибке
\param[out] errorflag Измененный флаг об ошибке
\param[int] argv Массив с названием открываемого файла для проверки
*/
void checkstrings(int *errorflag, int hight, int width, char *argv[]);

/*!
Удаляет пробелы и табуляцию в начале и конце строки
\param[in] s Строка
\param[out] errorflag Измененная строка
*/
void trim(char *s);
