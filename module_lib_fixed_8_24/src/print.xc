#include "math_8_24.h"
#include <print.h>

void print_8_24(_8_24 x) {
    int N;
    if (x < 0) {
        printchar('-');
        x = -x;
    }
    N = _8_242int(x);
    printint(N);
    printstr(".");
    for(int i = 0; i < 8; i++) {
        x = x - int2_8_24(N);
        x = x * 10;
        N = _8_242int(x);
        printchar(N+'0');
    }
}

void print_8_24ln(_8_24 x) {
    print_8_24(x);
    printchar('\n');
}
