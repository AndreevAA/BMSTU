#include "../inc/functions.h"

int rand_range(int min, int max)
{
	return (min + rand() % (max - min + 1));
}
