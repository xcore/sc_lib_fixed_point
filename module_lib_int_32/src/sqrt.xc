// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "print.h"

unsigned int sqrtuint(unsigned int x) {
    int zeroes;
    unsigned int approx;
    unsigned int corr;
        
    asm("clz %0,%1" : "=r" (zeroes) : "r" (x));
    
    zeroes = zeroes & ~1;
    zeroes = (32-zeroes) >> 1;
    approx = x >> zeroes;
    for(int i = 0; i < 4; i++) {
        corr = (((approx*approx) - x) / approx) >> 1;
        approx -= corr;
    }
    return approx;
}
