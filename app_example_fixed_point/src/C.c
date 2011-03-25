#include <math.h>

int roundTrunc(double x) {
    if (x > 0x7FFFFFFF || x < -0x7fffffff) return -0x80000000;
    return x;
}

int logC(int x) {
    double z = (double) x / (double) (1<<24);
    return roundTrunc((1<<24)*log(z));
}

int expC(int x) {
    double z = (double) x / (double) (1<<24);
    return roundTrunc((1<<24)*exp(z));
}

int sinhC(int x) {
    double z = (double) x / (double) (1<<24);
    return roundTrunc((1<<24)*sinh(z));
}

int coshC(int x) {
    double z = (double) x / (double) (1<<24);
    return roundTrunc((1<<24)*cosh(z));
}
