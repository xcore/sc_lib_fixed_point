Fixed point library
...................

:Version: 
  unreleased

:Status:
  Preliminary functionality with 32-bit arithmetic only. Trig to follow soon.

:Description:
  Fixed point library

:Maintainer:
  https://github.com/henkmuller


This is a library of functions that implement standard mathematical
functions in fixed point. All functions use a "8.24" fixed point format
with 24 bits behind the binary point, and 8 bits before the binary point.
Numbers are represented in 2's complement.

More details to follow in the doc directory.


Key Features
============

* basic functions: mulsf, divsf, sqrt
* emulation of manipulation of exponent and mantissa: ldexp, frexp

To Do
=====

* trigonometric functions: sin, cos, sinh, cosh
* exponential functions: exp, log
* Make 64 bit version, probably 16.48 (blocked by lack of long long in XC)
* Improve constants to minimise error
* Add other mathematical functions (errf etc)
* Add optional check on overflows (with a compile time flag for code that has size constraints)
* Add optional check on domain errors, eg. sqrt(-1)

Firmware Overview
=================

A collection of functions, all stored in a single module. The function
names are suffixed with ``sf`` to denote that these are single precision
fixed point functions. There are some obvious dependencies, mostly on ldexp
and frexp.

Two extra functions, mulsf and divsf perform multiplication and division on
fixed point numbers.

Known Issues
============

none

Required Repositories
=====================

* xcommon git\@github.com:xmos/xcommon.git

Support
=======

Issues may be submitted via the Issues tab in this github repo. Response to any issues submitted as at the discretion of the maintainer for this line.
