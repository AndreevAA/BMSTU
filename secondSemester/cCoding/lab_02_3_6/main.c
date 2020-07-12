#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <sys/time.h>
#define N 100

int min(int a, int b);
int input(int *pa1, int *pa2);
int process_1(int *arr, int n);
int process_2(int *arr, int n, int *pa1, int *pa2);

void output_process_1();
void output_process_2();

int main()
{
    output_process_1();
    output_process_2();
    return 0;
}

void output_process_1()
{
    struct timeval start, end;
    int64_t elapsed_time, sum = 0, time;
    int n = 1000;
    int arr[n];
    int *pa1, *pa2;
    pa1 = &arr[0];
    pa2 = &arr[n - 1];
    input(pa1, pa2);
    for (int i = 1; i <= N; i++)
    {
        gettimeofday(&start, NULL);
        process_1(arr, n);
        pa1 = &arr[0];
        pa2 = &arr[n - 1];
        gettimeofday(&end, NULL);
        elapsed_time = (end.tv_sec - start.tv_sec) * 1000000LL + (end.tv_usec - start.tv_usec);
        sum += elapsed_time;
    }
    time = (float)sum / N;
    printf("Время в микросекундах: %" PRId64 " µs\n", time);
}

void output_process_2()
{
    struct timeval start, end;
    int64_t elapsed_time, sum = 0, time;
    int n = 1000;
    int arr[n];
    int *pa1, *pa2;
    pa1 = &arr[0];
    pa2 = &arr[n - 1];
    input(pa1, pa2);
    for (int i = 1; i <= N; i++)
    {
        gettimeofday(&start, NULL);
        pa1 = &arr[0];
        pa2 = &arr[n - 1];
        process_2(arr, n, pa1, pa2);
        gettimeofday(&end, NULL);
        elapsed_time = (end.tv_sec - start.tv_sec) * 1000000LL + (end.tv_usec - start.tv_usec);
        sum += elapsed_time;
    }
    time = (float)sum / N;
    printf("Время в микросекундах: %" PRId64 " µs\n", time);
}

int min(int a, int b)
{
    if (a > b){
    	return a;
    }
    else{
    	return b;
    }
}

int input(int *pa1, int *pa2)
{
    int *pa;
    for (pa = pa1; pa != (pa2 + 1); pa++)
        *pa = rand() % 10 - 5;
    return 0;
}

int process_2(int *arr, int n, int *pa1, int *pa2)
{
	int answer;
	int *number;
	answer = arr[0] * arr[1];
	for (number = (pa1 + 1); number != (pa2); number++)
		answer = min(answer, *(number) * *(number + 1));
	return 0;
}

int process_1(int *arr, int n)
{
    int answer;
    for (int i = 0; i < n - 1; i++)
    {
        if (i == 1)
        {
        	answer = arr[0] * arr[1];
        }
        else
        {	
        	answer = min(arr[i] * arr[i + 1], answer);
        }
    }

    return 0;
}
