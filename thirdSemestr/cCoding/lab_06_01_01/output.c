#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "output.h"
#include "main.h"

void output_data(char * title, char * name, char * year)
{
	printf("%s\n%s\n%s\n", title, name, year);
}

void output_sorted_data(struct films* all_films, int number_of_films)
{
	for (int i = 0; i < number_of_films; i++)
		output_data((all_films)[i].title, (all_films)[i].name, (all_films)[i].year);
}
