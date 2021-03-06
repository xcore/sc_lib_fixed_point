module_lib_fixed_8_24 API
=========================

The funcionality is exported in the include file ``mathf8_24.h``. THis file
should be included in all XC and C files that use this library.

Type definition
---------------

.. doxygentypedef:: f8_24

Constants
---------

.. doxygendefine:: MINF8_24

.. doxygendefine:: MAXF8_24

.. doxygendefine:: HALF

.. doxygendefine:: ONE

.. doxygendefine:: PI2

.. doxygendefine:: PIHALF

Basic operations
----------------

The addition and subtraction operators ``+`` and ``-`` can be used on fixed
point numbers as normal. Make sure that constants are shifted up 24 places,
ie, for a fixed point number ``f``, the statement ``f++`` adds
0.000000059604644775390625 not one.

.. doxygenfunction:: mulf8_24

.. doxygenfunction:: divf8_24

.. doxygenfunction:: ldexpf8_24

.. doxygenfunction:: frexpf8_24

.. doxygenfunction:: reducef8_24

.. doxygenfunction:: f8_24toint

.. doxygenfunction:: inttof8_24

.. doxygenfunction:: fabsf8_24

.. doxygenfunction:: froundf8_24

Mathematical functions
----------------------

.. doxygenfunction:: sinf8_24

.. doxygenfunction:: cosf8_24

.. doxygenfunction:: sinhf8_24

.. doxygenfunction:: coshf8_24

.. doxygenfunction:: sqrtf8_24

.. doxygenfunction:: expf8_24

.. doxygenfunction:: logf8_24

.. doxygenfunction:: log10f8_24

Input/Output functions
----------------------

.. doxygenfunction:: printf8_24

.. doxygenfunction:: printf8_24ln

Example program
---------------

Below is an example function that prints out the values of a sine wave:

.. literalinclude:: app_example_fixed_point/src/main.xc
  :start-after: //:: Example code to print a sine wave
  :end-before: //::

