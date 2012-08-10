// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include <xclib.h>
#include <xs1.h>
#include <stdio.h>
#include <mathuint.h>
#include <mathuint64.h>

unsigned int sqrtuint2(unsigned int xh, unsigned int xl) {
    unsigned int approx;
    int corr;

    if (xh == 0) {
        return sqrtuint(xl);
    }
    
    approx = sqrtuint(xh);
    if (approx > 0xffff) {
        return ~0;
    }
    approx = approx << 16;
    xl = -xl;
    xh = -xh - 1;
    for(int i = 0; i < 4; i++) {
        int h = xh;
        unsigned int l = xl;
        int q, r;
        {h,l} = macs(approx, approx, h, l);
        if (h >= 0) {
            asm("ldivu %0,%1,%2,%3,%4" : "=r"(q), "=r"(r):"r" (h), "r"(l),"r"(approx));
        } else {
            l = -l;
            h = -h - 1;
            asm("ldivu %0,%1,%2,%3,%4" : "=r"(q), "=r"(r):"r" (h), "r"(l),"r"(approx));
            q = -q;
        }
        corr = (q+1) >> 1;
        approx -= corr;
    }
    return approx;

}
