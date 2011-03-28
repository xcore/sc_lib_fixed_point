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
extern int sinC(int x);
extern int cosC(int x);
extern int sqrtC(int x);

#define STEPS 10

int tester(int func, int data) {
    switch(func) {
    case  0: return expf8_24(data);
    case  1: return expC(data);
    case  2: return logf8_24(data);
    case  3: return logC(data);
    case  4: return sinhf8_24(data);
    case  5: return sinhC(data);
    case  6: return coshf8_24(data);
    case  7: return coshC(data);
    case  8: return sinf8_24(data);
    case  9: return sinC(data);
    case 10: return cosf8_24(data);
    case 11: return cosC(data);
    case 12: return sqrtf8_24(data);
    case 13: return sqrtC(data);
    }
    return MINF8_24;
}

int test(int func, char name[], int min, int max, int minerror, int maxerror, int permille) {    
    int hist[31];
    int fail = 0;
    int oneBit;

    printstr("Testing ");
    printstrln(name);
    for(int k = 0; k < 31; k++) {
        hist[k] = 0;
    }
    for(int k = 0; k <= (1<<STEPS); k++) {
        timer t;
        int t0, t1, t2, t3, z, err, zc;
        int i = min + (((unsigned)(max - min))>>STEPS) * k;
        zc = tester(func|1,i);
        if (zc == MINF8_24) {
            continue;
        }
        z = tester(func,i);
        err = z - zc;
        
        if (err > 15 || err < -15) { // histogram error in last 4 bits only
            if (err < minerror || err > maxerror) {
                printstr("FAIL ");
                fail = 1;
            }
            printstr("Error more than 4 bits: ");
            printf8_24(i);
            printstr(" ");
            printf8_24(z);
            printstr(" ");
            printf8_24(zc);
            printstr(" ");
            printf8_24ln(err);
        } else {
            hist[err+15]++;
        }
    }
    printstr("Histogram of errors\n");
    for(int k = 0; k < 31; k++) {
        if (hist[k] != 0) {
            int v = k-15;
            if (v < minerror || v > maxerror) {
                printstr("FAIL ");
                fail = 1;
            }
            printint(v);
            printstr(" ");
            printf8_24(v);
            printstr(" ");
            printintln(hist[k]);
        }
    }
    oneBit = hist[14] + hist[15] + hist[16];
    oneBit = (oneBit * 1000) >> STEPS;
    if (oneBit < permille) {
        printstr("FAIL ");
        fail = 1;
    }
    printint(oneBit);
    printstr(" per thousand in one bit error\n");
    return fail;
}

int main(void) {
    int fail;
    printstr("Testing will take approx ");
    printint(10 << (STEPS-8));
    printstr(" minutes\n");
    fail = test(0,"exp", MINF8_24, 4*ONE, -12, 5, 990);
    fail += test(2,"log", 1, MAXF8_24, -2, 2, 906);
    fail += test(4,"sinh", -11*ONE>>1, 11*ONE>>1, -40, 40, 600);  // Should aim for -4 4 800
    fail += test(6,"cosh", -11*ONE>>1, 11*ONE>>1, -40, 40, 600);  // Should aim for -4 4, 800
    fail += test(8,"sin", -2*PI2, MAXF8_24, -3, 3, 955);
    fail += test(10,"cos", -2*PI2, MAXF8_24-2*PI2, -3, 3, 960);
    fail += test(12,"sqrt", 0, MAXF8_24, -1, 1, 1000);
    if (fail != 0) {
        printint(fail);
        printstr(" failures\n");
    }
    return fail;
}
