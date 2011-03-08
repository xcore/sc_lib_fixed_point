#include "math_8_24.h"
#include "print.h"

static int lookup[8] = {
  0,
  11863283,
  0x1000000, // sqrt(1)
  20547809,
  23726566, // sqrt(2)
  26527108,
  29058991,// sqrt(3)
  31387297,
};

#pragma unsafe arrays
_8_24 sqrt_8_24(_8_24 x) {
    int exp;
    int zeroes;
    _8_24 approx;
    _8_24 corr;

    if (x <= 0) {
        return 0;
    }
        
    asm("clz %0,%1" : "=r" (zeroes) : "r" (x));
    zeroes &= ~1;
    approx = lookup[(x >> (29-zeroes))&7];
    if (zeroes >= 6) {
        approx >>= ((zeroes - 6) >> 1);
    } else {
        approx <<= ((6-zeroes) >> 1);
    }
    for(int i = 0; i < 3; i++) {
        corr = div_8_24(mul_8_24(approx,approx) - x, approx) >> 1;
        approx -= corr;
    }
    return approx;
}
