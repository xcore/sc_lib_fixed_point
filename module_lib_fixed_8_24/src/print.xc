// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include <print.h>

void printf8_24(f8_24 x) {
    int N;
    if (x < 0) {
        printchar('-');
        x = -x;
    }
    N = f8_242int(x);
    printint(N);
    printstr(".");
    for(int i = 0; i < 8; i++) {
        x = x - int2f8_24(N);
        x = x * 10;
        N = f8_242int(x);
        printchar(N+'0');
    }
}

void printf8_24ln(f8_24 x) {
    printf8_24(x);
    printchar('\n');
}
