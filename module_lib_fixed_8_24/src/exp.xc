#include "mathf8_24.h"
#include <print.h>

/******************************************************************
 * Derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite. Can be improved for N>0, in that
 * the last few bits are always zero and oughtn't be.
 ******************************************************************/

#define ONE_OVER_LN2 24204406
#define C1  11632640
#define C2     -3560
#define p0   4194304
#define p1     69798
#define q0   8388608
#define q1    838646



f8_24 expf8_24(f8_24 x) {
    f8_24  XN = froundf8_24(mulf8_24(x,ONE_OVER_LN2));
    int N = f8_242int(XN);
    f8_24 g = (x - mulf8_24(XN, C1)) - mulf8_24(XN, C2);
    f8_24 z = mulf8_24(g,g);
    f8_24 gP = mulf8_24(mulf8_24(p1, z) + p0, g);
    f8_24 Q = mulf8_24(q1, z) + q0;
    f8_24 r = HALF + divf8_24(gP, Q -gP);
    N++;
    return N > 0 ? (r<<N)+(1<<(N-1)) : (r+(1<<(-N-1))) >> -N;
}
