"---------------------------------------------------------
" this code is the same as shift left deleting '0'
" shift num left deleting leading '0'.
"
" use PCRE in place of REGEX word.
" because PCRE is newer way to use REGEX.
"---------------------------------------------------------

DATA: num TYPE string VALUE '0000223123'.
  num = p_text.
  WRITE: / 'before:', num.
  REPLACE ALL OCCURRENCES OF PCRE `^0*` IN num WITH ``." Usar trocar REGEX por PRCE
  SKIP 1.
  WRITE: / 'after:', num.

"-------------------
" result:
" before: 0000223123
" after: 223123
"-------------------
