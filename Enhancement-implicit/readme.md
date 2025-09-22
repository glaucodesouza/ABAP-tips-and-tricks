# Tips for implicit enhancement points
It is good to return original sy-subrc value in the end of enhancement  
Maybe even also in EXITs...
## SY-SUBRC
- at start, Store original SY-SUBRC of your enhancement
- at end, give sy-subrc original value in the end

      data(lv_original_subrc) = sy-subrc.
      (your code)
      sy-subrc = lv_original_subrc. "return original subrc, to not get error in IF getting off of this rotine.
