// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include <print.h>

/******************************************************************
 * Derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite.
 * Present version has a rather large error (last 5 bits) for large
 * values. Likely cause is an error in the last 2-3 bits of
 * the expf8_24 function. Replacing the calls to expf8_24() with a
 * a call to a perfect exp() drops the error to 1-2 bits.
 ******************************************************************/

#define LN2  11629080 
#define YBAR 80530637
#define p0    2796214
#define p1     139753
#define p2       3422

f8_24 sinehf8_24(f8_24 X, int cosine) {
    f8_24 Y, R, W, Z;
    int negative = 1;

    Y = fabsf8_24(X);
    if (!cosine && X < 0) {
        negative = -1;
    }

    if(cosine || Y > ONE) {
        if (Y > YBAR) {
            W = Y - LN2;
            Z = expf8_24(W);
            R = Z + (cosine?1:-1) * divf8_24(ONE/4, Z) ;
        } else {
            Z = expf8_24(Y);
            R = (Z + (cosine?1:-1) * divf8_24(ONE, Z)) >> 1;
        }
        R = R * negative;
    } else {
        f8_24 g = mulf8_24(X,X);
        f8_24 gP = mulf8_24(mulf8_24(mulf8_24(p2, g) + p1, g) + p0, g);
        R = X + mulf8_24(X, gP);
    }
    return R;
}
