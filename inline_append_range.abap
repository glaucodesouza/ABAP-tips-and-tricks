	RANGES r_swenr FOR vibdro-swenr.

  SELECT *
  FROM VIBDAO
  INTO TABLE @t_vibdao
  WHERE snunr IN @r_swenr.

  IF sy-subrc EQ 0.
    LOOP AT t_vibdro INTO w_vibdro.

      APPEND VALUE #( sign   = 'I'
                      option = 'EQ'
                      low    = w_vibdro-swenr  ) TO r_swenr.
    ENDLOOP.

    SORT r_swenr BY low.
    DELETE ADJACENT DUPLICATES FROM r_swenr.
  ENDIF.
