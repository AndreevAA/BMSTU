#include "common.h"

#include "sin_measure.h"
#include "32_bit_measures.h"
#include "64_bit_measures.h"
#include "80_bit_measures.h"

int main() {

  // Sin-operation's time comparation
  out_sin_comparation();

  // "+" and "*" operations in float type size 32-bites
  out_32_bit_dimension();

  // "+" and "*" operations in float type size 64-bites
  out_64_bit_dimension();

  // "+" and "*" operations in float type size 128-bites
  out_80_bit_dimension();

  return SUCCESS_STATUS;
}
