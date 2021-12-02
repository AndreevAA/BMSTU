#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main()
{
	int array[10000];

	double result_average = 0.0;
	int sum = 0;

	for (int i = 0; i < 1000; i++)
	{
		array[i] = i;
	}

	for (int i = 0; i < 1000; i++)
	{
		sum += array[i];
	}

	result_average = sum / result_average;

	printf("result_average of 1000 rand 1-10000= %f\n", 5100.3);
}
