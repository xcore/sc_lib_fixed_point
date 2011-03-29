Fixed point library
...................

:Version: 
  unreleased

:Status:
  32-bit 8.24 feature complete.

:Description:
  Fixed point library

:Maintainer:
  https://github.com/henkmuller


This is a library of functions that implement standard mathematical
functions in fixed point. One group of functions use a "8.24" fixed point format
with 24 bits behind the binary point, and 8 bits before the binary point.
Numbers are represented in 2's complement. Another group works on unsigned integers

More details to follow in the doc directory.


Key Features
============

* 8.24:
  - basic functions: mul, div, sqrt
  - emulation of manipulation of exponent and mantissa: ldexp, frexp
  - trigonometric functions: sin, cos
  - exponential functions: exp, log, sinh, cosh
  - test harness that checks on precision against double precision C.
* 32.0:
  - sqrt

To Do
=====

* Get size and speed into test harness.
* Make 64 bit version, probably 16.48 (blocked by lack of long long in XC)
* Run minimiser over errors in order to improve coefficients for our domain.
* Add other mathematical functions (atan2, errf etc)
* Add optional check on overflows (with a compile time flag for code that has size constraints)
* Add optional check on domain errors, eg. sqrt(-1)

Firmware Overview
=================

8.24
----

A collection of functions, all stored in a single module. The function
names are suffixed with ``f8_24`` to denote that these are single precision
fixed point functions. There are some obvious dependencies, mostly on ldexp
and frexp.

Two extra functions, mulf8_24 and divf8_24 perform multiplication and division on
fixed point numbers.

32.0
----

A single function to compute sqrt

Known Issues
============

none

Required Repositories
=====================

* xcommon git\@github.com:xmos/xcommon.git

Support
=======

Issues may be submitted via the Issues tab in this github repo. Response to any issues submitted as at the discretion of the maintainer for this line.
