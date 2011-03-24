// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"

/******************************************************************
 * Derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite, fixed point sin/cos chapter.
 ******************************************************************/

#define ONE_OVER_HALFPI 10680707
#define r0 -11184804
#define r1   2236879
#define r2   -212681
#define r3     11175

f8_24 sinf8_24(f8_24 rad) {
    int finalSign;
    int modulo;
    f8_24 sqr;

    // Now just compute a sine.
    if (rad < 0) {
        rad = -rad;
        finalSign = -1;
    } else /* rad >= 0 */ {
        finalSign = 1;
    }
    // Now rad >= 0.

    modulo = f8_242int(mulf8_24(rad, ONE_OVER_HALFPI));
    rad -= (modulo >> 2) * PI2;
    if (modulo & 2) {
        finalSign = -finalSign;
        rad -= PI2>>1;
    }
    if (modulo & 1) {
        rad = (PI2>>1) - rad;
    }
    sqr = mulf8_24(rad/2, rad/2);
    return (rad + mulf8_24(mulf8_24(mulf8_24(mulf8_24(mulf8_24(r3, sqr) + r2, sqr) + r1, sqr) + r0, sqr), rad)) * finalSign;
}
