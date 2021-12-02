#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int result_factorial_number = 1;
	int number = 1;

	for (int i = 0; i < 10; i++) 
	{
		result_factorial_number *= number;
		number++;
	}

	printf("result_factorial_number of 10 = %d\n", result_factorial_number);
}
