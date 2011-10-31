// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include <xclib.h>

unsigned int sqrtuint(unsigned int x) {
    int zeroes;
    int approx;
    int corr;

    if (x < 2) {
        return x;
    }
    zeroes = clz(x);
    
    zeroes = zeroes & ~1;
    zeroes = (32-zeroes) >> 1;
    approx = x >> zeroes;
    for(int i = 0; i < 4; i++) {
        corr = ((((approx*approx) - (int)x) / approx)+1) >> 1;
        approx -= corr;
    }
    return approx;
}
