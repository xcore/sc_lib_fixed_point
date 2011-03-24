#include "mathf8_24.h"
#include "print.h"

int main(void) {
//        printf8_24(expf8_24(1<<24));
//        return 0;
    printf8_24ln(reducef8_24(0xA0000001,0));
    printf8_24ln(reducef8_24(0xF8000001,0));
    printf8_24ln(reducef8_24(0xFF800001,0));
    printf8_24ln(reducef8_24(0x70000001,0));
    printf8_24ln(reducef8_24(0x01000001,0));
    printf8_24ln(reducef8_24(0x00700001,0));
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
        printstr("\n");
    }
    return 0;
}
