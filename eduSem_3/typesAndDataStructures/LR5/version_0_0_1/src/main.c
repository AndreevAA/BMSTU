#include "../inc/config.h"
#include "../inc/menu.h"
#include "../inc/io.h"
#include "../inc/vector/vector_operations.h"
#include "../inc/list/list_operations.h"

int main()
{
	printf("Программа моделирования работы автомата и двух очередей с относительным приоритетом.\n");
	out_menu();
	int par = get_par();
	if (par == 1)
	{
		vec_comparator();
	}
	else if (par == 2)
	{
		int par_memory = get_par_memory();
		list_comparator(par_memory);
	}
	return 0;
}
