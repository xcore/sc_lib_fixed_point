Constraints
...........

All *f8_24 functions nominally operate on numbers between MINF8_24 and
MAXF8_24 (-128 and 127.99999994). Not all functions perform checks on
whether the arguments are in range in order to save memory and execution
time. Also note that there are no representations for *not-a-number* or
*infinite*.

sinf8_24
--------

Only use on arguments that are between -MAXF8_24 + PI and MAXF8_24 - PI.

cosf8_24
--------

Only use on arguments that are between -MAXF8_24 + PI and MAXF8_24 - PI.

sinhf8_24
---------

Overflows for arguments larger than 5.5 or less than -5.5, do not use on
values outside that range.

Moderately large errors for values outside [-4..4], with an observed
relative error of +/- 3E-8.

coshf8_24
---------

Overflows for arguments larger than 5.5 or less than -5.5, do not use on
values outside that range.

Moderately large errors for values outside [-4..4], with an observed
relative error of +/- 3E-8.

expf8_24
--------

Overflows for arguments larger than 4.8

Error in last three bits for arguments between 3 and 4.8.

logf8_24
--------

Do not use on values <= 0.

sqrtf8_24
---------

Correct to within one bit.
