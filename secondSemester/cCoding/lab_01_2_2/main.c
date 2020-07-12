#include <stdio.h>
#include <math.h>

float distance(float ax, float ay, float bx, float by);
float perimeter(float ax, float ay, float bx, float by, float cx, float cy);
void output(float perimeter_data);

int main()
{
	float ax, ay, bx, by, cx, cy;
	scanf("%f%f%f%f%f%f", &ax, &ay, &bx, &by, &cx, &cy);
	output(perimeter(ax, ay, bx, by, cx, cy));
}

float distance(float ax, float ay, float bx, float by)
{
	return sqrt((ax - bx) * (ax - bx) + (ay - by) * (ay - by));
}

float perimeter(float ax, float ay, float bx, float by, float cx, float cy)
{
	float side_ab, side_bc, side_ca;
	side_ab = distance(ax, ay, bx, by);
	side_bc = distance(bx, by, cx, cy);
	side_ca = distance(cx, cy, ax, ay);
	return side_ab + side_bc + side_ca;;
}

void output(float perimeter_data)
{
	printf("%f\n", perimeter_data);
}
