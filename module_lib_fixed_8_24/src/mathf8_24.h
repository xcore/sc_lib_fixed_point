#define MATHF8_24_BITS 24
#define HALF    (1<<(MATHF8_24_BITS-1))
#define ONE     (HALF * 2)
#define PI2     105414357
#define PIHALF   26353589

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

{f8_24,int} frexpf8_24 (f8_24 d);



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

extern f8_24 sinehf8_24(f8_24 x, int cosine);

#define sinhf8_24(x) sinehf8_24(x, 0)
#define coshf8_24(x) sinehf8_24(x, 1)

/** abssf8_24
 *
 * Returns the magnitude of a number
 *
 * \param x input value
 * \returns |x|
 **/
extern f8_24 expf8_24(f8_24 x);
extern f8_24 sqrtf8_24(f8_24 x);
extern f8_24 logf8_24(f8_24 x);
extern f8_24 log10f8_24(f8_24 x);




extern void printf8_24(f8_24 x);
extern void printf8_24ln(f8_24 x);

#define f8_242int(a) (a >> MATHF8_24_BITS)

#define int2f8_24(a) (a << MATHF8_24_BITS)

