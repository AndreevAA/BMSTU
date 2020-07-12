/*!
\file
\brief Основной файл с запуском процессов
\author    "Андреев Александр"
\version   1
\date      30 мая 2020
Данный файл содержит в себе объявление переменной об ошибки,
массива встреч слов в текстовом файле, первичную операцию
по открытию файла и последовательный вызов вычислительных
функций программы.
*/
#include <stdio.h>
#include <string.h>
#include "functions.h"
#define MAXSIZE 1000

/*!
Основная функция демонстрационной программы
\param[in] argc Количество введенных парметров
\param[in] argv[] Массив параметров запуска программы (файл для чтения, файл для вывода)
*/
int main(int argc, char *argv[]) 
{
  int errorflag = 1;

  if (argc == 3)
  {
    // Открытие файла для чтения
    FILE *file_in = fopen(argv[1], "r");

    // Открытие файла для записи
    FILE *file_out = fopen(argv[2], "w");

    // Переменная количества слов в текстовом файле
    int numberofwords = 0;

    // Переменная количества строк в текстовом файле
    int numberofstrings = 0;

    // Массив количества слов в строках
    int listofnumbersofwords[MAXSIZE];

    // Проверка на то, что файл удалось открыть
    if (file_in != NULL)
    {
      numberofstrings += getnextstring(file_in, listofnumbersofwords, &numberofwords);

      if (numberofwords == 0)
        errorflag = 1;

      //printf("%d, %d", numberofwords, numberofstrings);

      formanswerfile(file_out, listofnumbersofwords, numberofwords, numberofstrings);
    }
    else
    {
      fprintf(file_out, "%s", "Файл не существует");
    }
    
    // Закрытие файла ввода
    fclose(file_in);

    // Закрытие файла вывода
    fclose(file_out);
  }

  // Возвращение флага об ошибке
  return errorflag;
}
