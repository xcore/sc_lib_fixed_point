// Copyright (c) 2011, <insert copyright holder here>, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#define MATHF8_24_BITS (24)
#define MATHF8_24_IBITS (32-MATHF8_24_BITS)


/** This type describes the fixed point numbers used in this library.
 * Values are stored in 32 bits comprising a sign bit (bit 31), 7 mantissa
 * bits (bits 30..24), and 24 fractional bits (bits 23..0). The value of a
 * fixed point number is defined as the the signed integer value multiplied
 * by 2^-24. There are no representations for *not-a-number* or *infinite*.
 */
typedef int f8_24;


/** This constant defines the smallest number that is defined in the fixed
 * point range, which is -128.
 */
#define MINF8_24 (0x80000000)

/** This constant defines the biggest number that is defined in the fixed
 * point range, which is 127.999999940395355224609375
 */
#define MAXF8_24 (0x7FFFFFFF)

/** This constant is the fixed point representation of the number 0.5
 */
#define HALF    (1<<(MATHF8_24_BITS-1))

/** This constant is the fixed point representation of the number 1.0
 */
#define ONE     (HALF * 2)

/** This constant is the closest fixed point representation of 2 PI.
 */
#define PI2     (105414357)

/** This constant is the fixed point representation of PI/2
 */
#define PIHALF   (26353589)


/** This function returns the absolute value of a fixed point number. The
 * input value has to be in the range [-MAXF8_24..MAXF8_24]; the absolute
 * value of MINF8_24 cannot be represented as a fixed point number.
 *
 * \param x input value
 * \returns |x|
 **/
extern f8_24 fabsf8_24(f8_24 x);

/** This function returns the product of two fixed point numbers. If the
 * product does not fit in a fixed point number, a modulo answer is
 * returned.
 *
 * \param x First number to be multiplied
 * \param y Second number to be multiplied
 * \returns x*y
 **/
extern f8_24 mulf8_24(f8_24 x, f8_24 y);

/** This function returns the division of two fixed point numbers. If the
 * product does not fit in a fixed point number, higher bits will be lost.
 *
 * \param x the divisor
 * \param y the dividend
 * \returns x / y
 **/
extern f8_24 divf8_24(f8_24 x, f8_24 y);

/** This function is the fixed point equivalent of ldexp(): given a
 * mantissa and an exponent it computes the fixed point number with the
 * value mant * 2 ^ exp. The reverse operation is implemented by frexp8_24().
 *
 * \param mant mantissa input value represented as a fixed point number
 * \param exp exponent input value, represented as a signed integer
 * \returns math * 2 ^ exp
 * \sa frexpf8_24
 **/
extern f8_24 ldexpf8_24(f8_24 mant, int exp);

/** This functions splits a fixed point number into a mantissa and
 * exponent. The mantissa is either zero or in the range [0.5..1). The
 * exponent is in the range [-32..32]. and an exponent of a fixed point
 * number. The reverse operation is implemented by ldexp8_24().
 *
 * \param d input fixed point number
 * \returns a mantissa as an fixed point number
 * \returns an exponent as an integer.
 * \sa ldexpf8_24
 **/
{f8_24,int} frexpf8_24 (f8_24 d);

/** This function clips and rounds a 16.48 fixed point number into an 8.24
 * fixed point number. It is used for finalising the answer out of a series
 * of multiply accumulates. If an overflow has happened, the result is
 * saturated to MINF8_24 or MAXF8_24. The number is rounded towards minus
 * infinity; if rounding is required half should be added to the number,
 * typically before the multiply accumulate
 *
 * \param h high input word (two's complement 16.16 number)
 * \param l low input word to be concatenated with h to form 16.48 number
 * \returns saturated (h:l)[bits 8..40]
 **/
f8_24 reducef8_24(int h, unsigned l);



/** This function returns the sine of a fixed point number in radians. The
 * input number has to be in the range -MAXF8_24 + PI and MAXF8_24 - PI.
 *
 * \param x input value in radians
 * \returns sine(x)
 **/
extern f8_24 sinf8_24(f8_24 x);

/** This function returns the cosine of a fixed point number in radians. The
 * input number has to be in the range -MAXF8_24 + PI and MAXF8_24 - PI.
 *
 * \param x input value in radians
 * \returns cosine(x)
 **/
inline f8_24 cosf8_24(f8_24 x) {
    return sinf8_24(x+PIHALF);
}

/** This function returns the natural exponent of a fixed point number. The
 * input number has to be less than 4.8, otherwise the answer cannot be
 * represented as a fixed point number. For input values larger than 3
 * there is a relatively large error in the last three bits of the answer.
 *
 * \param x input value
 * \returns e^x
 **/
extern f8_24 expf8_24(f8_24 x);

/** This function returns the natural logarithm (ln) of a fixed point number. The
 * input number has to be positive.
 *
 * \param x input value
 * \returns ln(x).
 **/
extern f8_24 logf8_24(f8_24 x);




extern f8_24 sinehf8_24(f8_24 x, int cosine);

/** This function returns the hyperbolic sine (sinh) of a fixed point
 * number. The input number has to be in the range [-5.5..5.5] in order to
 * avoid overflow, and for values outside the [-4..4] range there are
 * relatively large errors in the result.
 *
 * \param x input value
 * \returns sinh(x)
 **/
inline f8_24 sinhf8_24(f8_24 x) {
    return sinehf8_24(x, 0);
}

/** This function returns the hyperbolic cosine (cosh) of a fixed point
 * number. The input number has to be in the range [-5.5..5.5] in order to
 * avoid overflow, and for values outside the [-4..4] range there are
 * relatively large errors in the result.
 *
 * \param x input value
 * \returns sinh(x)
 **/
inline f8_24 coshf8_24(f8_24 x) {
    return sinehf8_24(x, 1);
}

/** This function returns the square root of a fixed point number.
 * The input number has to be positive.
 *
 * \param x input value in radians
 * \returns sqrt(x)
 **/
extern f8_24 sqrtf8_24(f8_24 x);

/** This function returns the logarithm base 10 of a fixed point number. The
 * input number has to be positive.
 *
 * \param x input value
 * \returns ln(x)/ln(10).
 **/
extern f8_24 log10f8_24(f8_24 x);





/** This function prints a number using a decimal point.
 *
 * \param x value to be printed
 **/
extern void printf8_24(f8_24 x);

/** This function prints a number using a decimal point and adds a newline.
 *
 * \param x value to be printed
 **/
extern void printf8_24ln(f8_24 x);


/** This function converts a fixed point number to an integer, discarding
 * the fractional part.
 *
 * \param x fixed point input value
 * \returns integer equivalent
 **/
inline f8_24 f8_24toint(f8_24 x) {
    return x >> MATHF8_24_BITS;
}

/** This function converts an integer to a fixed point number. The input
 * to int2f8_24() has to be in the range [-128..127].
 *
 * \param x integer input value
 * \returns fixed point equivalent
 **/
inline f8_24 inttof8_24(f8_24 x) {
    return x << MATHF8_24_BITS;
}


/** This function rounds a fixed point number to its nearest integral
 * number and returns a fixed point number. The input to froundf8_24()
 * should be less than 127.5.
 *
 * \param x input value
 * \returns nearest integer.
 **/
f8_24 froundf8_24(f8_24 x);
