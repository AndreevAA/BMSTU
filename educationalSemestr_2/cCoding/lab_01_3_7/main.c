#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define EPS_LOCALE 0.000000001

void output(double s_ans, double f_ans, double ans_absolute, double ans_local);
int exception(void);
double s_func(double x, double eps);

int main()
{
    double x, eps;
    int code_err = 0;
    int rc = scanf("%lf %lf", &x, &eps);
    if (rc != 2 || (eps <= 0.0) || (eps > 1.0) || x > 1.0 || x < -1.0)
    {
        code_err = exception();
    }
    else
    {
        if (fabs(x) <= EPS_LOCALE)
        {
            output(x, x, x, x);
        }
        else
        {
            double s_ans = s_func(x, eps);
            double f_ans = atan(x);
            double ans_absolute = fabs(f_ans - s_ans);
            double ans_local = fabs(1.0 - (s_ans / f_ans));
            output(s_ans, f_ans, ans_absolute, ans_local);
        }
    }
    return code_err;
}

int exception(void)
{
    printf("ERR\n");
    return 1;
}

double s_func(double x, double eps)
{
    double sprev, snext, numerator, s;
    int i = 1;
    sprev = numerator = s = x; 
    while (fabs(sprev) > eps)
    {
        i += 2;
        numerator *= -1.0 * x * x;
        snext = numerator / i;
        s += snext;
        sprev = snext;
    }
    return s;
}

void output(double s_ans, double f_ans, double ans_absolute, double ans_local)
{
    printf("%lf\n%lf\n%lf %lf\n", s_ans, f_ans, ans_absolute, ans_local);
}
