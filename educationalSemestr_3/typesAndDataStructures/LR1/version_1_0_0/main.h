/*!
\file
\brief Файл с объявлением define и глобальной структуры
\author    "Андреев Александр"
\version   2
\date      11 сентября 2020
 
Данный файл содержит в себе различные define и 
объявление глобальной структуры. 
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifndef MAINH
#define MAINH

#define MAX_NUMBERS 60
#define MAX_MANTISA_SIZE 30
#define MAX_ORDER_SIZE 5
#define ERROR_STATUS 1
#define SUCCESS_STATUS 0
#define NUMBER_OF_MULTIPLIERS 2

typedef struct number {
    char mantisa_sign;			// Знак мантиссы числа '-'/'+'
	char mantisa[MAX_NUMBERS];  // Мантисса числа

	char order_sign;            // Знак порядка числа '-'/'+'
	char order[MAX_NUMBERS];	// Порядок числа

	int order_int;
} number;

#endif
