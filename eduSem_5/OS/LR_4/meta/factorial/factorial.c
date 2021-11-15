#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int result_factorial_number = 1;

	for (int i = 0; i < 10; i++) 
	{
		result_factorial_number *= (result_factorial_number + 1);
	}
}
