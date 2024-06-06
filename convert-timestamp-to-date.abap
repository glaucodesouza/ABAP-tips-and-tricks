  CONSTANTS:
    cl_tz_brasil TYPE tzonref-tzone VALUE 'BRAZIL',
    cl_tz_utc TYPE tzonref-tzone VALUE 'UTC'.

DATA: 
    lv_confirmed_at type /SCWM/DE_CONFIRMED_DT value '20.131.205.093.047',
    lv_date         type sy-datum.
    
    CONVERT TIME STAMP confirmed_at
            TIME ZONE cl_tz_brasil
            INTO DATE lv_date.
