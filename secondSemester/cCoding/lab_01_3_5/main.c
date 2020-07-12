#include <stdio.h>
#include <math.h>

int gcd(int a, int b);
void output(int data);
int abs(int a);
int exception(void);

int main()
{
    int a, b, code_err = 0;
    int res = scanf("%d %d", &a, &b);
    if (res != 2 || a <= 0)
    {
        code_err = exception();
    }
    else
    {
        if (b <= 0)
        {
            code_err = exception();
        }
        else
        {
            output(gcd(abs(a), abs(b)));
        }
    }
    return code_err;
}

int exception(void)
{
    printf("ERR");
    return 1;
}

int gcd(int a, int b)
{
    if (a == b) 
        return a;
    if (a > b) 
    {
        int temp = a;
        a = b;
        b = temp;
    }
    return gcd(a, b - a);
}

int abs(int a)
{
    if (a > 0)
        return a;
    else
    {
        return -1 * a;
    }
}

void output(int data)
{
    printf("%d\n", data);
}

