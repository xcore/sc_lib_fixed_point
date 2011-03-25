// Copyright (c) 2011, XMOS Ltd, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#include "mathf8_24.h"
#include "print.h"

extern int logC(int x);
extern int expC(int x);
extern int sinhC(int x);
extern int coshC(int x);

int tester(int func, int data) {
    switch(func) {
    case 0: return expf8_24(data);
    case 1: return expC(data);
    case 2: return logf8_24(data);
    case 3: return logC(data);
    case 4: return sinhf8_24(data);
    case 5: return sinhC(data);
    case 6: return coshf8_24(data);
    case 7: return coshC(data);
    }
    return MINF8_24
}

void test(int func, char name[]) {    
    int hist[31];
    for(int k = 0; k < 31; k++) {
        hist[k] = 0;
    }
    for(int k = 0; k <= 4096; k+=64) {
        timer t;
        int t0, t1, t2, t3, z, err, zc;
        int i = HALF + (k * (HALF >> 12));
        zc = tester(func|1,i);
        if (zc == MINF8_24) {
            continue;
        }
        z = tester(func,i);
        err = z - zc;
        
        if (err > 15 || err < -15) { // accept error in last bit
            printf8_24(i);
            printstr(" ");
            printf8_24(z);
            printstr(" ");
            printf8_24(zc);
            printstr(" ");
            printf8_24(err);
            printstr(" error more than 4 bit\n");
        } else {
            hist[err+15]++;
        }
    }
    for(int k = 0; k < 31; k++) {
        if (hist[k] != 0) {
            printf8_24(k-15);
            printstr(" ");
            printintln(hist[k]);
        }
    }
}


int main(void) {
//        printf8_24(expf8_24(1<<24));
//        return 0;
//    test(0,"");
    test(4, "");
    for(int k = -64; k <= 64; k++) {
        int i = k * PIHALF / 8;
        printf8_24(i);
        printstr(" ");
        printf8_24(sinf8_24(i));
        printstr(" ");
        printf8_24(cosf8_24(i));
        printstr(" ");
        printf8_24(sqrtf8_24(i));
        printstr(" ");
        printf8_24(expf8_24(i));
        printstr(" ");
        printf8_24(sinhf8_24(i));
        printstr(" ");
        printf8_24(coshf8_24(i));
        printstr("\n");
    }
    return 0;
}
