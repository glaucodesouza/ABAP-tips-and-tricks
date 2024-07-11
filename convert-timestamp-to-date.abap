  CONSTANTS:
    cl_tz_brasil TYPE tzonref-tzone VALUE 'BRAZIL',
    cl_tz_utc TYPE tzonref-tzone VALUE 'UTC'.
DATA: 
    lv_confirmed_at type /SCWM/DE_CONFIRMED_DT value '20.131.205.093.047',
    lv_date          type sy-datum,
    lv_uzeit         type sy-uzeit.

    " Example 1
    CONVERT TIME STAMP lv_confirmed_at
            TIME ZONE cl_tz_brasil
            INTO DATE lv_date.

    " Examle 2
    CONVERT TIME STAMP lv_confirmed_at
            TIME ZONE 'BRAZIL'
            INTO DATE lv_date
                 TIME lv_uzeit.

    " Example 3
    CONVERT TIME STAMP lv_confirmed_at TIME ZONE sy-zonlo(3) "e.g. when sy-zonlo=UTC-3
            INTO DATE DATA(lv_erdat) TIME DATA(lv_erzet). " lv_erdat ends with e.g.30.05.2024
