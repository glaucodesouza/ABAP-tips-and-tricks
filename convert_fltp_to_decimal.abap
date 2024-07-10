*Convert FLTP to decimal
*l1 is 1.2700000000000000E+03 (in the beginning)
*l3 is 1270.000 (in the end)
DATA:
  l1 TYPE atflv VALUE '1.2700000000000000E+03',
  l2 TYPE p DECIMALS 3,
  l3 TYPE cha_class_view-sollwert.

WRITE l1.

CALL FUNCTION 'QSS0_FLTP_TO_CHAR_CONVERSION'
  EXPORTING
    i_number_of_digits = 3
    i_fltp_value       = l1
  IMPORTING
    e_char_field       = l3.

WRITE l3.

REPLACE ALL OCCURRENCES OF ',' IN l3 WITH '.'.
CONDENSE l3 NO-GAPS.
WRITE: `valor final: ` ,l3.
