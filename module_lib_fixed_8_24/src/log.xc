#include "mathf8_24.h"
#include <print.h>

/******************************************************************
 * Derived from "Software Manual for the Elementary
 * Functions" by Cody and Waite. Needs systematic testing.
 ******************************************************************/

#define ONE_OVER_LN2 24204406

#define C0   3474675
#define C     228186

#define a0    815851
#define b0  11699746
#define b1  -2097152

#define C1  11632640
#define C2     -3560



f8_24 logf8_24(f8_24 x) {
    f8_24 f, znum, zden, y, Bw, Aw, rz2, v, qz, rz, z, w;
    int N;
    {f, N} = frexpf8_24 (x);

    y = f - HALF;
    znum = y;
    zden = (znum >> 1) + HALF;

    if (znum < C0) {
        N--;
    } else {
        y = y - HALF;
        znum = znum - HALF;
        zden = zden + (HALF>>1);
    }
    z = divf8_24(znum, zden);
    w = mulf8_24(z, z);
    Bw = mulf8_24(b1, w) + b0;
    Aw = a0;
    rz2 = mulf8_24(w, C + divf8_24(Aw, Bw));
    v = divf8_24(HALF>>1, zden);
    qz = v + mulf8_24(rz2, v);
    rz = mulf8_24(4*y, qz);
    return (N*C2+rz)+N*C1;
}
