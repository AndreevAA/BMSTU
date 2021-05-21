#include "sin_measure.h"

void out_sin_comparation() {
  double res = 0.0;

  printf("Operation sin(pi)'s time comparation:\n");
  printf("pi       | sin(pi)\n");
  printf("---------|-----------\n");
  printf("3.14     | %-15.3g\n", sin(3.14));
  printf("3.141596 | %-15.3g\n", sin(3.141596));

  #ifdef X87
  asm("fldpi\n"
      "fsin\n"
      "fstp %0\n" ::"m"(res));
  printf("fpu      | %g\n", res);
  printf("---------------------\n");
  #endif

  printf("\n");

  printf("Operation sin(pi / 2)'s time comparation:\n");
  printf("pi       | sin(pi / 2)\n");
  printf("---------|-----------\n");
  printf("3.14     | %-15.3g\n", sin(3.14 / 2));
  printf("3.141596 | %-15.3g\n", sin(3.141596 / 2));

  #ifdef X87
  res = 2.0;
  asm("fldpi\n"
      "fld1\n"
      "fld1\n"
      "faddp\n"
      "fdiv\n"
      "fsin\n"
      "fstp %0\n"
      : "=m"(res));
  printf("fpu      | %g\n", res);
  printf("---------------------\n");
  #endif

  printf("\n");
}
