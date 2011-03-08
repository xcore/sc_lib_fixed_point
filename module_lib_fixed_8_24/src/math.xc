#include "stdio.h"
#include "math_8_24.h"
#include "print.h"
#include "xs1.h"

_8_24 fabs_8_24(_8_24 x) {
    if (x < 0) {
        return -x;
    } else {
        return x;
    }
}

_8_24 mul_8_24(_8_24 a, _8_24 b) {
    int h;
    unsigned l;
    {h, l} = macs(a, b, 0, 1<<((32-MATH_8_24_BITS)*2-1));
    return (h << (32-MATH_8_24_BITS)) | (l >> MATH_8_24_BITS);
}

#define  ldivu(a,b,c,d,e) asm("ldivu %0,%1,%2,%3,%4" : "=r" (a), "=r" (b): "r" (c), "r" (d), "r" (e))

_8_24 div_8_24(_8_24 a, _8_24 b) {
    int sgn = 1;
    unsigned int d, d2, r;
    if (a < 0) {
        sgn = -1;
        a = -a;
    }
    if (b < 0) {
        sgn = -sgn;
        b = -b;
    }
    ldivu(d, r, 0, a, b);
    ldivu(d2, r, r, 0, b);
    
    r = d << MATH_8_24_BITS |
        (d2 + (1<<(31-MATH_8_24_BITS))) >> (32-MATH_8_24_BITS);
    return r * sgn;
}

_8_24 ldexp_8_24(_8_24 a, int exp) {
    if (exp > 0) {
        return a << exp;
    } else if (exp < 0) {
        exp = -exp;
        return (a+(1<<(exp-1))) >> exp;
    } else {
        return a;
    }
}

{_8_24,int} frexp_8_24 (_8_24 d) {
    _8_24 absVal;
    int exp;

    absVal = fabs_8_24(d);
    
    asm("clz %0,%1" : "=r" (exp) : "r" (absVal));
    exp = (32 - MATH_8_24_BITS) - exp;
    
    return {exp < 0 ? d << (-exp) : d >> exp, exp};
}
