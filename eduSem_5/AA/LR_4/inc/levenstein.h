#include "../inc/config.h"
#include "string.h"
#include "../inc/io.h"

// Получение расстояния между словами
void out_levenstein_distance(char *target, char *source);

typedef struct Args_words {
    char *target;
    int target_length;

    char *source;
    int source_length;
} Args_words;

typedef struct Args_rows {
    int *current_row;
    int target_length;
    int i;
    int *previous_row;
} Args_rows;

typedef struct Args_values {
	char *target;
	char *source;
    int *current_row;
    int target_cur;
    int source_cur;
    int *previous_row;
    int add_c;
    int delete_c;
    int change_c;
} Args_values;
