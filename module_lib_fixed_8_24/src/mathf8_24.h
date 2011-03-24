// Copyright (c) 2011, <insert copyright holder here>, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

#define MATHF8_24_BITS 24
#define MATHF8_24_IBITS (32-MATHF8_24_BITS)
#define HALF    (1<<(MATHF8_24_BITS-1))
#define ONE     (HALF * 2)
#define PI2     105414357
#define PIHALF   26353589

#define MINF8_24 0x80000000   // -128.000000000000000000000000
#define MAXF8_24 0x7FFFFFFF   //  127.999999940395355224609375

/*
 * Basic fixed point type is an integer.
 */
typedef int f8_24;


/** fabsf8_24
 *
 * Returns the absolute value of a fixed point number
 *
 * \param x input value
 * \returns |x|
 **/
extern f8_24 fabsf8_24(f8_24 x);

/** mulf8_24
 *
 * Returns product of two fixed point numbers, both in two's complement 8.24 format
 *
 * \param x first input value in 8_24
 * \param y second input value in 8_24
 * \returns x*y
 **/
extern f8_24 mulf8_24(f8_24 x, f8_24 y);

/** divf8_24
 *
 * Returns the division of two fixed point numbers, both in two's complement 8.24 format
 *
 * \param x first input value in 8_24
 * \param y second input value in 8_24
 * \returns x/y
 **/
extern f8_24 divf8_24(f8_24 x, f8_24 y);

/** ldexpf8_24
 *
 * replacement of floating point ldexp: computes mant * 2 ^ exp
 *
 * \param mant mantissa input value in 8_24
 * \param exp exponent input value, signed integer
 * \returns math * 2 ^ exp
 **/
extern f8_24 ldexpf8_24(f8_24 mant, int exp);

/** frexpf8_24
 *
 * replacement of floating point frexp: computes a mantissa (0.5 <= m < 1)
 * and an exponent of a fixed point number.
 *
 * \param d input value in 8_24
 * \returns a mantissa as an f8_24 number
 * \returns an exponent as an integer. d = m << exp
 **/
{f8_24,int} frexpf8_24 (f8_24 d);

/** reducef8_24
 *
 * Returns the "middle" 8.24 bits form a 16.48 word. Useful for picking an
 * answer out of a series of multiply accumulates. If an overflow has
 * happened, the result is saturated to MINF8_24 or MAXF8_24
 *
 * \param h high input word twos complement 16.16 number
 * \param l low input word to be concatenated with h to form 16.48 number
 * \returns saturated (h:l)[bits 8..40]
 **/
f8_24 reducef8_24(int ynh, unsigned ynl);



/** sinf8_24
 *
 * Returns the sine of a fixed poiont number in radians.
 *
 * \param x input value in radians
 * \returns sine(x)
 **/
extern f8_24 sinf8_24(f8_24 x);

/** cosf8_24
 *
 * Returns the cosine of a fixed poiont number in radians.
 *
 * \param x input value in radians
 * \returns cosine(x)
 **/
#define cosf8_24(x) sinf8_24(x+PIHALF)

/** expf8_24
 *
 * Returns the exponent of a number
 *
 * \param x input value
 * \returns e^x
 **/
extern f8_24 expf8_24(f8_24 x);

/** logf8_24
 *
 * Returns the natural logarithm of a positive number.
 *
 * \param x input value
 * \returns ln(x).
 **/
extern f8_24 logf8_24(f8_24 x);




extern f8_24 sinehf8_24(f8_24 x, int cosine);

#define sinhf8_24(x) sinehf8_24(x, 0)
#define coshf8_24(x) sinehf8_24(x, 1)

extern f8_24 sqrtf8_24(f8_24 x);
extern f8_24 log10f8_24(f8_24 x);





/** printf8_24
 *
 * prints a number using a decimal point, with an optional newline.
 *
 * \param x input value
 **/
extern void printf8_24(f8_24 x);
extern void printf8_24ln(f8_24 x);

#define f8_242int(a) (a >> MATHF8_24_BITS)

#define int2f8_24(a) (a << MATHF8_24_BITS)

f8_24 froundf8_24(f8_24 x);
