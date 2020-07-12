#include <stdio.h>
#include <math.h>

int count_hours(int seconds);
int count_minutes(int seconds);
int count_seconds(int seconds, int minutes, int hours);

void input(int *seconds);
void output(int ans_hour, int ans_minutes, int ans_seconds);

int main()
{
	int seconds, minutes, hours;
	input(&seconds);

	hours = count_hours(seconds);
	minutes = count_minutes(seconds);
	seconds = count_seconds(seconds, minutes, hours);

	output(hours, minutes, seconds);
}

void input(int *seconds)
{
	scanf("%d", seconds);
}

int count_hours(int seconds)
{
	return seconds / 3600;
}

int count_minutes(int seconds)
{
	return (seconds % 3600) / 60;
}

int count_seconds(int seconds, int minutes, int hours)
{
	return (seconds - hours * 3600 - minutes * 60);
}

void output(int ans_hour, int ans_minutes, int ans_seconds)
{
	printf("%d %d %d", ans_hour, ans_minutes, ans_seconds);
}
