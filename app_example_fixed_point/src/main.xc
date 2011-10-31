// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include "print.h"
#include "mathuint.h"


int main(void) {
    printuintln(sqrtuint(4));
    printuintln(sqrtuint(10));
    printuintln(sqrtuint(100));
    printuintln(sqrtuint(1000));
    printuintln(sqrtuint(10000));
    printuintln(sqrtuint(100000));
    printuintln(sqrtuint(1000000));
    printuintln(sqrtuint(10000000));
    printuintln(sqrtuint(100000000));
    printuintln(sqrtuint(1000000000));
    for(int k = -8; k <= 23; k++) {
        int i = k * PIHALF / 8;
        printf8_24(i);
        printstr(" ");
        printf8_24(expf8_24(i));
        printstr("\n");
    }
    return 0;
}
