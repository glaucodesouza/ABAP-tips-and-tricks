  METHOD get_last_tuesday_curr_month.

    CLEAR rv_date.

    DATA: lv_today                  TYPE sy-datum,
          lv_weekday                TYPE char1,
          lv_last_tue_current_month TYPE sy-datum.

* 1. Obter a data atual
    lv_today = sy-datum.

* 2. Encontrar últ. terça-feira do mês corrent
*    Terça-feira tem o código de dia da semana 2 (de acordo com o padrão SAP, onde Segunda = 1, Domingo = 7).
*    Você pode usar a função WEEKDAY_GET ou SY-DATUM para isso.
*    Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_today
      IMPORTING
        day  = lv_weekday.

*    Ajuste a data para a última terça-feira
*    Se hoje já for terça-feira (lv_weekday = 2), então essa é a data.
*    Caso contrário, calcule a diferença para chegar à terça-feira anterior.

    lv_last_tue_current_month = lv_today.
    WHILE lv_weekday <> 2.
      lv_last_tue_current_month = lv_last_tue_current_month - 1.
      CALL FUNCTION 'DATE_COMPUTE_DAY'
        EXPORTING
          date = lv_last_tue_current_month
        IMPORTING
          day  = lv_weekday.
    ENDWHILE.

* Exibir o resultado
    rv_date = lv_last_tue_current_month.

  ENDMETHOD.
