/*!
\file
\brief Заголовочный файл сортировки элементов
\author    "Андреев Александр"
\version   4
\date      25 мая 2020
 
Данный файл содержит в себе определения функций, используемых в сортировке
*/

void sortnumbers(char *argv[], int *errorflag);

int get_number_by_pos(FILE *file, int *number, int pos);
int put_number_by_pos(FILE *file, int *number, int pos);
