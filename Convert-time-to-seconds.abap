IMPORTING
IV_HORA_INICIO	  TYPE STRING
IV_HORA_FIM	      TYPE STRING
IV_DUR_INTERVALO	TYPE STRING

EXPORTING
EV_BEGZT	TYPE KAPA-BEGZT
EV_ENDZT	TYPE KAPA-ENDZT
EV_PAUSE	TYPE KAPA-PAUSE

METHOD convert_time_into_seconds.
      SPLIT iv_hora_inicio AT ':' INTO DATA(lv_hh) DATA(lv_mm) DATA(lv_ss).
      ev_begzt  = ( lv_hh * 3600 ) + ( lv_mm * 60 ) + lv_ss." hora inicio
      SPLIT iv_hora_fim AT ':' INTO DATA(lv_hh2) DATA(lv_mm2) DATA(lv_ss2).
      ev_endzt = ( lv_hh2 * 3600 ) + ( lv_mm2 * 60 ) + lv_ss2. "hora fim
      SPLIT iv_dur_intervalo AT ':' INTO DATA(lv_hh3) DATA(lv_mm3) DATA(lv_ss3).
      ev_pause = ( lv_hh3 * 3600 ) + ( lv_mm3 * 60 ) + lv_ss3. " interv
ENDMETHOD.
