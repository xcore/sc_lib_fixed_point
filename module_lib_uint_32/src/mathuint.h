// Copyright (c) 2011, <insert copyright holder here>, All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

/* 
 * Function that computes the square root of an unsigned integer
 * \param x the integer
 * \returns the square root of x
 */
extern unsigned int sqrtuint(unsigned int x);

/* 
 * Function that computes the hypothenusa of of a straight triangle with
 * sides of length x and y, ie, sqrt(x*x+y*y). This function takes care of
 * potential overflows whilst squaring.
 *
 * \param x the width of a rectangle
 * \param x the height of a rectangle
 * \returns the length of the diagonal.
 */
extern unsigned hypot(int x, int y);
