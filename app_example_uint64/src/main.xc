#include <stdio.h>
#include <mathuint64.h>

int main(void) {
    printf("sqrtuint2(100000000) = %d\n", sqrtuint2(     0,100000000));
    printf("sqrtuint2(10000000000) = %d\n", sqrtuint2(   0x2,0x540BE400));
    printf("sqrtuint2(1000000000000) = %d\n", sqrtuint2(  0xE8,0xD4A51000));
    printf("sqrtuint2(100000000000000) = %d\n", sqrtuint2(0x5AF3,0x107A4000));
}
