#include <stdio.h>
#include <math.h>

int check_position(double x1, double y1, double x2, double y2, double xa, double ya, double eps);
void output(int data);
int error(void);

int main()
{
    int error_flag = 0;
    double x1, y1, x2, y2, xa, ya, eps = 0.000000001;
    int rc = scanf("%lf %lf %lf %lf %lf %lf", &x1, &y1, &x2, &y2, &xa, &ya);
    if (rc != 6 || (x1 - eps <= x2 && x1 + eps >= x2 && y1 - eps <= y2 && y1 + eps >= y2))
    {
        error_flag = error();
    }
    else
    {
        output(check_position(x1, y1, x2, y2, xa, ya, eps));
    }
    return error_flag;
}

int error(void)
{
    printf("ERR\n");
    return 1;
}

int check_position(double x1, double y1, double x2, double y2, double xa, double ya, double eps)
{   
    if ((ya - y1) * (x2 - x1) - eps < (xa - x1) * (y2 - y1) && (ya - y1) * (x2 - x1) + eps > (xa - x1) * (y2 - y1))
        return 1;
    else
    {
        if (((ya - y1) * (x2 - x1) - (xa - x1) * (y2 - y1)) > 0)
            return 0;
        else
            return 2;
    } 
}

void output(int data)
{
    printf("%d\n", data);
}