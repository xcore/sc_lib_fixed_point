#include "math_8_24.h"
#include "print.h"

int main(void) {
    for(int k = -64; k <= 64; k++) {
        int i = k * PIHALF / 8;
        print_8_24(i);
        printstr(" ");
        print_8_24(sin_8_24(i));
        printstr(" ");
        print_8_24(cos_8_24(i));
        printstr(" ");
        print_8_24(sqrt_8_24(i));
        printstr("\n");
    }
    return 0;
}
