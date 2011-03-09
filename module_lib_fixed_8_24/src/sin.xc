#include "mathf8_24.h"

/******************************************************************
 * The coefficients were derived from the floating point code in newlib,
 * which in turn were derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite
 ******************************************************************/

#define ONE_OVER_HALFPI 10680707
#define r0 -2796201
#define r1   139805
#define r2    -3323
#define r3       44

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
    sqr = mulf8_24(rad, rad);
    return (rad + mulf8_24(mulf8_24(mulf8_24(mulf8_24(mulf8_24(r3, sqr) + r2, sqr) + r1, sqr) + r0, sqr), rad)) * finalSign;
}
