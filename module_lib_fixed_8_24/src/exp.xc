// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include <print.h>

/******************************************************************
 * Derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite. Can be improved for N>0, in that
 * the last few bits are always zero and oughtn't be. Seems to
 * in general have an error in the last three bits that needs addressing
 ******************************************************************/

#define ONE_OVER_LN2 24204406
#define C1  11632640
#define C2     -3560

#define p0a   67108864
#define p1a    1116769
#define q0a    (ONE*8)
#define q1a   13418331

/*
 * This function can be further improved by making C2 a constant in 3.29 format.
 * The current function will have an error in the 21st or 22nd bit of the fraction after
 * a modulo of a large number. However, this would require mulf3_29 functions adding code
 * size. I think it is better to stick to a slightly less accurate version for now.
 */
f8_24 expf8_24(f8_24 x) {
    f8_24  XN = froundf8_24(mulf8_24(x,ONE_OVER_LN2));
    int N = f8_24toint(XN);
    f8_24 g = (x - N*C1) - N*C2;
    f8_24 z = mulf8_24(g,g);
    f8_24 gP = mulf8_24(mulf8_24(p1a, z) + p0a, g);
    f8_24 Q = mulf8_24(q1a, z) + q0a;
    f8_24 r = (ONE<<1) + (divf8_24(gP<<1, (Q - gP)>>1));
//    N++;
    N--;
    return N > 0 ? (r<<N)+(1<<(N-1)) : (r+(1<<(-N-1))) >> -N;
}

#if 0

#define p0   4194304
#define p1     69798
#define q0   8388608
#define q1    838646

f8_24 expf8_24_orig(f8_24 x) {
    f8_24  XN = froundf8_24(mulf8_24(x,ONE_OVER_LN2));
    int N = f8_242int(XN);
    f8_24 g = (x - N*C1) - N*C2;
    f8_24 z = mulf8_24(g,g);
    f8_24 gP = mulf8_24(mulf8_24(p1, z) + p0, g);
    f8_24 Q = mulf8_24(q1, z) + q0;
    f8_24 r = HALF + divf8_24(gP, Q - gP);
    N++;
    return N > 0 ? (r<<N)+(1<<(N-1)) : (r+(1<<(-N-1))) >> -N;
}

#endif
