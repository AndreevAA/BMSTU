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

#define MIN_NUM_OF_ARGC 3
#define MAX_NUM_OF_ARGC 4
#define MAX_SIZE 256
#define MAX_NUMBER 256
#define SUCCESS_STATUS 0
#define ERROR_STATUS 1

typedef struct films 
{
	char title[MAX_SIZE];
	char name[MAX_SIZE];
	char year[MAX_SIZE];
} films;

#endif
