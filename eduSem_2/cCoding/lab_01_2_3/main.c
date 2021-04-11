#include <stdio.h>

float rparall(float r1, float r2, float r3);
void output(float data);

int main()
{
	float r1, r2, r3;
	scanf("%f%f%f", &r1, &r2, &r3);
	output(rparall(r1, r2, r3));
}

float rparall(float r1, float r2, float r3)
{
	return ((r1 * r2 * r3) / (r2 * r3 + r1 * r3 + r1 * r2));
}

void output(float data)
{
	printf("%f\n", data);
}
