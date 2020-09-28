#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#ifndef MAINH
#define MAINH

#define MAX_NUMBERS 60
#define MAX_MANTISA_SIZE 30
#define MAX_ORDER_SIZE 99999
#define ERROR_STATUS 1
#define SUCCESS_STATUS 0
#define NUMBER_OF_MULTIPLIERS 2

typedef struct number {
    char mantisa_sign;			// Знак мантиссы числа '-'/'+'
	char mantisa[MAX_NUMBERS];  // Мантисса числа

	char order_sign;            // Знак порядка числа '-'/'+'
	int order;				// Порядок числа в виде int
} number;

#endif

int is_right_order(number *answer_number);
int char_to_int(char symbol);
int int_to_char(int digit);

void free_mass(char *temp_mass);

