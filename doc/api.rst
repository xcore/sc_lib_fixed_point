module_lib_fixed_8_24 API
=========================

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

.. doxygendefine:: f8_242int

.. doxygendefine:: int2f8_24

.. doxygenfunction:: fasbsf8_24

.. doxygenfunction:: froundf8_24

Mathematical functions
----------------------

.. doxygenfunction:: sinf8_24

.. doxygendefine:: cosf8_24

.. doxygendefine:: sinhf8_24

.. doxygendefine:: coshf8_24

.. doxygenfunction:: sqrtf8_24

.. doxygenfunction:: expf8_24

.. doxygenfunction:: logf8_24

.. doxygenfunction:: log10f8_24

Input/Output functions
----------------------

.. doxygenfunction:: printf8_24

.. doxygenfunction:: printf8_24ln
