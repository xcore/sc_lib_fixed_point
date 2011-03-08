#define MATH_8_24_BITS 24
#define HALF    (1<<(MATH_8_24_BITS-1))
#define ONE     (HALF * 2)
#define PI2     105414357
#define PIHALF   26353589

/*
 * Basic fixed point type is an integer.
 */
typedef int _8_24;


/** fabs_8_24
 *
 * Returns the absolute value of a fixed point number
 *
 * \param x input value
 * \returns |x|
 **/
extern _8_24 fabs_8_24(_8_24 x);

/** mul_8_24
 *
 * Returns product of two fixed point numbers, both in two's complement 8.24 format
 *
 * \param x first input value in 8_24
 * \param y second input value in 8_24
 * \returns x*y
 **/
extern _8_24 mul_8_24(_8_24 x, _8_24 y);

/** div_8_24
 *
 * Returns the division of two fixed point numbers, both in two's complement 8.24 format
 *
 * \param x first input value in 8_24
 * \param y second input value in 8_24
 * \returns x/y
 **/
extern _8_24 div_8_24(_8_24 x, _8_24 y);

/** ldexp_8_24
 *
 * replacement of floating point ldexp: computes mant * 2 ^ exp
 *
 * \param mant mantissa input value in 8_24
 * \param exp exponent input value, signed integer
 * \returns math * 2 ^ exp
 **/
extern _8_24 ldexp_8_24(_8_24 mant, int exp);

{_8_24,int} frexp_8_24 (_8_24 d);



/** sin_8_24
 *
 * Returns the sine of a fixed poiont number in radians.
 *
 * \param x input value in radians
 * \returns sine(x)
 **/
extern _8_24 sin_8_24(_8_24 x);

/** cos_8_24
 *
 * Returns the cosine of a fixed poiont number in radians.
 *
 * \param x input value in radians
 * \returns cosine(x)
 **/
#define cos_8_24(x) sin_8_24(x+PIHALF)

extern _8_24 sineh_8_24(_8_24 x, int cosine);

#define sinh_8_24(x) sineh_8_24(x, 0)
#define cosh_8_24(x) sineh_8_24(x, 1)

/** abss_8_24
 *
 * Returns the magnitude of a number
 *
 * \param x input value
 * \returns |x|
 **/
extern _8_24 exp_8_24(_8_24 x);
extern _8_24 sqrt_8_24(_8_24 x);
extern _8_24 log_8_24(_8_24 x);
extern _8_24 log10_8_24(_8_24 x);




extern void print_8_24(_8_24 x);
extern void print_8_24ln(_8_24 x);

#define _8_242int(a) (a >> MATH_8_24_BITS)

#define int2_8_24(a) (a << MATH_8_24_BITS)

