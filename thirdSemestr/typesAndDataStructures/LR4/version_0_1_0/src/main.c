#include "../inc/config.h"
#include "../inc/menu.h"
#include "../inc/io.h"

int main()
{
	print_welcome();
	while (menu() != EXIT_STATUS);
	return OK;
}
