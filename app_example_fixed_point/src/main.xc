#include "mathf8_24.h"
#include "print.h"

int main(void) {
    for(int k = -64; k <= 64; k++) {
        int i = k * PIHALF / 8;
        printf8_24(i);
        printstr(" ");
        printf8_24(sinf8_24(i));
        printstr(" ");
        printf8_24(cosf8_24(i));
        printstr(" ");
        printf8_24(sqrtf8_24(i));
        printstr("\n");
    }
    return 0;
}
