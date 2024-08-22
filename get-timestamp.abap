    METHOD if_badi_fincs_cust_datamon~execute.
*This is an Example Implementation of Simple Custom Task. It returns OK (status code 9) when the Fiscal year is the same as the current year. If it's not, it sets status to error (8).

      DATA gv_timestamp TYPE timestamp.
      DATA gv_timestamp_n(15) TYPE n.

      GET TIME STAMP FIELD gv_timestamp.
      gv_timestamp_n = gv_timestamp.

      IF fiscalyear = gv_timestamp_n(4).
        consolidationtaskstatus = '9'.
      ELSE.
        consolidationtaskstatus = '8'.
      ENDIF.

    ENDMETHOD.
