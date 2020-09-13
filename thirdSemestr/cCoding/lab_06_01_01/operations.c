#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "main.h"
#include "operations.h"

//сортировка вставками
void insertionsort(struct films* all_films, int number_of_films, char * key_to_compare)
{
	int location;
	films newElement;
 
    for (int i = 1; i < number_of_films; i++)
    {
        newElement = (all_films)[i];
        
        location = i - 1;
        
        while(location >= 0 && compare_elems((all_films)[location], newElement, key_to_compare) > 0)
        {
            (all_films)[location+1] = (all_films)[location];
            location = location - 1;
        }
        (all_films)[location+1] = newElement;
    }
}


void add_temp_film(struct films* all_films, int *number_of_films, char* temp_title, char* temp_name, char* temp_year)
{

	for (int i = 0; i < MAX_SIZE; i++)
	{
		all_films[*number_of_films].title[i] = temp_title[i];
		all_films[*number_of_films].name[i] = temp_name[i];
		all_films[*number_of_films].year[i] = temp_year[i];
	}

	*number_of_films += 1;
	
}

int search_field(struct films* all_films, int number_of_films, char* field, char* key)
{	
	int errorflag = SUCCESS_STATUS;

	int left_border = 0, right_border = number_of_films - 1;
	int search_index = -1;

	while (left_border <= right_border)
	{
		int middle_position = (left_border + right_border) / 2;


		if (strcmp(field, "title") == 0)
		{
			if (strcmp_title(key, all_films, middle_position, &left_border, &right_border, &search_index) == SUCCESS_STATUS)
				break;
		}
		else if (strcmp(field, "name") == 0)
		{
			if (strcmp_name(key, all_films, middle_position, &left_border, &right_border, &search_index) == SUCCESS_STATUS)
				break;
		}
		else if (strcmp(field, "year") == 0)
		{
			if (strcmp_year(key, all_films, middle_position, &left_border, &right_border, &search_index) == SUCCESS_STATUS)
				break;
		}

	}
	
	if (search_index == -1)
		printf("Not found\n");

	return errorflag;
}

void fill_struct(struct films* all_films)
{
	for (int i = 0; i < MAX_NUMBER; i++)
	{
		*all_films[i].title = '\0';
		*all_films[i].name = '\0';
		*all_films[i].year = '\0';
	}
}
