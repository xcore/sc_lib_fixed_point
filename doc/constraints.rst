Constraints
-----------


sin
---

Only use on arguments that are between -MAXF8_24 and MAXF8_24.

cos
---

Only works on arguments that are between -MAXF8_24 + PI and MAXF8_24 - PI


sinh
----

Overflows for arguments larger than 5.5 or less than -5.5, do not use on
values outside that range.

Moderately large errors for values outside [-4..4], relative error of 3E-8

cosh
----

Overflows for arguments larger than 5.5 or less than -5.5, do not use on
values outside that range.

Moderately large errors for values outside [-4..4], relative error of 3E-8

exp
---

Overflows for arguments larger than 4.8

Error in last three bits for arguments larger than 3.

log
---

Do not use on values <= 0.

sqrt
----

Correct to within one bit.
