  DATA:
    cl_pi_documents TYPE REF TO /scwm/cl_mon_pi,
    rl_post_date TYPE /lime/pi_r_post_date.


  IF i_date_from IS NOT INITIAL
  OR i_date_to IS NOT INITIAL.
    CALL METHOD cl_pi_documents->convert_date_2_timestamp
      EXPORTING
        iv_post_date_start = i_date_from
        iv_post_date_end   = i_date_to
      IMPORTING
        er_post_date       = rl_post_date.
  ENDIF.
