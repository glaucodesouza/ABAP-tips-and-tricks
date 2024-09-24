  "TESTE 1
  " replacing _ by x.
  DATA : var TYPE string VALUE 'a_b_c_'.
  REPLACE ALL OCCURRENCES OF REGEX   '_'  IN var WITH 'x'.
  WRITE : / var .

  "TESTE 2
  FINAL(text) = `oooababboo`.
  FIND PCRE 'a.|[ab]+|b.*' IN text
       MATCH OFFSET FINAL(moff)
       MATCH LENGTH FINAL(mlen).
  IF sy-subrc = 0.
    cl_demo_output=>write( substring( val = text off = moff
                                                 len = mlen ) ).
    WRITE:/ moff, mlen.
  ENDIF.

  "teste 3
  " replacing m, p, s for @
  DATA: lv_string TYPE string.
  lv_string = 'Replace all m, p and s in this string by @'.
  REPLACE ALL OCCURRENCES OF REGEX '(m|p|s)' IN lv_string WITH '@'.
  WRITE :/ lv_string.

  "teste 4
  " delete left zeros
  DATA: num TYPE string VALUE '0000223123'.
  num = p_text.
  WRITE: / 'antes:', num.
  REPLACE ALL OCCURRENCES OF PCRE `^0*` IN num WITH ``." Usar palavra PRCE ao inv[es de REGEX, porque e mais nova a sintaxe.
  SKIP 1.
  WRITE: / 'depois:', num.

  shift num left deleting leading '0'.
