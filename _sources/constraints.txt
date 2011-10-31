Constraints
...........

All *f8_24 functions nominally operate on numbers between MINF8_24 and
MAXF8_24 (-128 and 127.99999994). Not all functions perform checks on
whether the arguments are in range in order to save memory and execution
time. Also note that there are no representations for *not-a-number* or
*infinite*.



sqrtf8_24
---------

Correct to within one bit.
