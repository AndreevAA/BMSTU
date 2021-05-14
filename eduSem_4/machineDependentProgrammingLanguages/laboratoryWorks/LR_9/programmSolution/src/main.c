#include <stdio.h>
#include <math.h>

#include "common.h"

#include "32_bit_measures.h"
#include "64_bit_measures.h"
#include "80_bit_measures.h"

void sin_cmp() {
  double res = 0.0;

  printf("sin(pi)\n");
  printf("3.14 : %g\n", sin(3.14));
  printf("3.141596 : %g\n", sin(3.141596));

#ifdef X87
  asm("fldpi\n"
      "fsin\n"
      "fstp %0\n" ::"m"(res));
  printf("fpu : %g\n", res);
#endif

  printf("\n");

  printf("sin(pi / 2)\n");
  printf("3.14 / 2 : %g\n", sin(3.14 / 2));
  printf("3.141596 / 2: %g\n", sin(3.141596 / 2));

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
  printf("fpu : %g\n", res);
#endif

  printf("\n");
}

int main() {
  sin_cmp();

  print_32_bit_measures();

  print_64_bit_measures();

  print_80_bit_measures();

  return 0;
}
