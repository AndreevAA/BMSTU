/*!
\file
\brief Сортировка элементов файла
\author    "Андреев Александр"
\version   4
\date      25 мая 2020
 
Данный файл содержит в себе тело функций, используемых в демонстрационной программе
*/

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "sortdata.h"
#include "globalfunctions.h"

#define ERROR_OK 0

// Получение числа на определенной позиции в *.bin файле
int get_number_by_pos(FILE *file, int *tempnumber, int temppositionofthepoint)
{
    int answer = 0;

    // Установка позиции в потоке данных файла и возврат данных чтения
    if (fseek(file, temppositionofthepoint * (sizeof(int)), SEEK_SET) == 0)
        answer = (int)fread(tempnumber, sizeof(int), 1, file);
        
    return answer;
}

// Вставка числа на определенную позицию в *.bin файл
int put_number_by_pos(FILE *file, int *tempnumber, int temppositionofthepoint)
{
    int answer = 0;

    // Установка позиции в потоке данных файла и возврат данных для записи
    if (fseek(file, temppositionofthepoint * (sizeof(int)), SEEK_SET) == 0)
        answer = (int)fwrite(tempnumber, sizeof(int), 1, file);

    return answer;
}

//Сотировка чисел в файле
void sortnumbers(char *argv[], int *errorflag)
{
    // Статус по ошибке, позиция текущей, текущий параметр
    int temperrorflag = 0, temppositionofthepoint = 0, tempparametr = 0;

    // Открытие *.bin файла на чтение и запись
    FILE *file_in = fopen(argv[2], "r+b");
    
    if (file_in != NULL)
    {
    	// Размер файла в объеме памяти
        size_t filesize;
        
        // Следущий элемент
        int nextsymbol = 0;

        // Проверка размера файла
        if (getfilesize(file_in, &filesize) == 0 && filesize > 0 && filesize % 4 == 0)
        {
            int *nextconnection = &nextsymbol;
            int *parametrconnection = &tempparametr;
            
            // Установка позиции индексации на первый
            int positionofthepoint = 1;

            // Проверка до момента получения ошибки и не истекания размера файла
            while (positionofthepoint < (int)(filesize / sizeof(int)) && !temperrorflag)
            {
            	  // Получение позиций
                temperrorflag = !get_number_by_pos(file_in, nextconnection, positionofthepoint);
                temperrorflag = !get_number_by_pos(file_in, parametrconnection, positionofthepoint - 1);

                temppositionofthepoint = positionofthepoint - 1;

                while (temppositionofthepoint >= 0 && tempparametr > nextsymbol && !temperrorflag)
                {
                	// Получение позиций
                    temperrorflag = !put_number_by_pos(file_in, parametrconnection, temppositionofthepoint + 1);
                    temperrorflag = !get_number_by_pos(file_in, parametrconnection, temppositionofthepoint - 1);

                    temppositionofthepoint -= 1;
                }

                // Получение позиций по следущему
                temperrorflag = !put_number_by_pos(file_in, nextconnection, temppositionofthepoint + 1);

                positionofthepoint += 1;
            }

            // Закрытие файла
            fclose(file_in);
                
            *errorflag = ERROR_OK;
        }
    }
}
