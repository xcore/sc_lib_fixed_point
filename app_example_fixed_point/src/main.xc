// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "print.h"
#include "mathuint.h"

//:: Example code to print a sine wave
#include "mathf8_24.h"

void printsine(void) {
    for(f8_24 rad = 0; rad <= PI2; rad += PI2/20) {
        printstr("sin ");
        printf8_24(rad);
        printstr(" = ");
        printf8_24ln(cosf8_24(rad));
    }
}
//::


//:: Example code on how to use unsigned int sqrt
void printsqrtuint(void) {
    for(int k = 1; k < 1000000000; k *= 10) {
        printstr("sqrt ");
        printuint(k);
        printstr(" ");
        printuintln(sqrtuint(k));
    }
}
//::

int main(void) {
    printsine();
    printsqrtuint();
    for(int k = -8; k <= 23; k++) {
        int i = k * PIHALF / 8;
        printf8_24(i);
        printstr(" ");
        printf8_24(expf8_24(i));
        printstr(" ");
        printf8_24(sinhf8_24(i));
        printstr("\n");
    }
    return 0;
}
