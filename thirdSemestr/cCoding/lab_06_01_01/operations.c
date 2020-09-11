#include <stdio.h>
#include <string.h>
#include <stdlib.h>
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


void add_temp_film(films** all_films, int *number_of_films, char* temp_title, char* temp_name, char* temp_year)
{

	(*all_films)[*number_of_films].title = (char*) malloc(strlen(temp_title) + 1);
	strcpy((*all_films)[*number_of_films].title, temp_title);

	(*all_films)[*number_of_films].name = (char*) malloc(strlen(temp_name) + 1);
	strcpy((*all_films)[*number_of_films].name, temp_name);

	(*all_films)[*number_of_films].year = (char*) malloc(strlen(temp_year) + 1);
	strcpy((*all_films)[*number_of_films].year, temp_year);

	*number_of_films += 1;
	
}

int search_field(struct films* all_films, int number_of_films, char* field, char* key)
{	
	int errorflag = 0;

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
	{
		errorflag = 1;
		printf("Not found\n");
	}

	return errorflag;
}
