// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include "print.h"

#define A (12466528/2) // 7143403
#define B 10920575 // 9633812

f8_24 sqrtf8_24(f8_24 x) {
    int zeroes;
    f8_24 approx;
    f8_24 corr;
        
    if (x <= 0) return 0;

    asm("clz %0,%1" : "=r" (zeroes) : "r" (x));
    
    zeroes = zeroes & ~1;
    zeroes = (zeroes - 8) >> 1;
    if (zeroes >= 0) {
        approx = (A >> zeroes) + mulf8_24(x << zeroes, B);
    } else {
        zeroes = -zeroes;
        approx = (A << zeroes) + mulf8_24(x >> zeroes, B);
    }
    for(int i = 0; i < 3; i++) {
        corr = divf8_24(mulf8_24(approx,approx) - x, approx) >> 1;
        approx -= corr;
    }
    return approx;
}

#if 0

static int lookup[8] = {
    8388608,
    14529495,
    18757498,
    22194171,
    25165824,
    27821865,
    30245556,
    32488939,
};
        
#pragma unsafe arrays
f8_24 sqrt2f8_24(f8_24 x) {
    int zeroes;
    f8_24 approx;
    f8_24 corr;

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
        corr = divf8_24(mulf8_24(approx,approx) - x, approx) >> 1;
        approx -= corr;
    }
    return approx;
}

#endif
