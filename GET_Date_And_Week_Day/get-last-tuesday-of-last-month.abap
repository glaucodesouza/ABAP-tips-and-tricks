METHOD get_last_tuesday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_first_day_prev TYPE sy-datum,
          lv_last_day_prev  TYPE sy-datum,
          lv_last_tue_prev  TYPE sy-datum,
          lv_weekday        TYPE char1.

* 1. Obter a data atual
    lv_today = sy-datum.

* 2. Obter o primeiro dia do mês atual
*    Isso pode ser feito manipulando a data diretamente
    lv_first_day_curr = lv_today.
    lv_first_day_curr+6(2) = '01'.

* 3. Obter o último dia do mês anterior
*    Subtraia um dia do primeiro dia do mês atual. O SAP lida automaticamente com anos bissextos e meses diferentes.
    lv_last_day_prev = lv_first_day_curr - 1.

* 4. Encontrar a primeira terça-feira do mês anterior
*    Terça-feira tem o código de dia da semana 2 (de acordo com o padrão SAP, onde Segunda = 1, Domingo = 7).
*    Você pode usar a função WEEKDAY_GET ou SY-DATUM para isso.

*    Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_first_day_prev
      IMPORTING
        day  = lv_weekday.

*    Ajuste a data para a última terça-feira
*    Se o último dia já for terça-feira (lv_weekday = 2), então essa é a data.
*    Caso contrário, calcule a diferença para chegar à terça-feira anterior.
    IF lv_weekday < 2.
*      Se o dia da semana for Dom (7), Sáb (6), etc., calcule a diferença de dias.
*      (lv_weekday MOD 7) retorna 0 para Domingo, 1 para Segunda, etc.
*      (ex: 1=Seg, ..., 7=Dom).
*      Vamos usar uma abordagem mais direta: subtrair dias até encontrar a terça-feira.

      lv_last_tue_prev = lv_last_day_prev.
      WHILE lv_weekday <> 2.
        lv_last_tue_prev = lv_last_tue_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_last_day_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSEIF lv_weekday > 2.
*   Se o dia da semana for Quarta (3), Quinta (4), etc., subtraia a diferença
      lv_last_tue_prev = lv_last_day_prev - ( lv_weekday - 2 ).

    ELSE.
*   Se já for terça-feira (2)
      lv_last_tue_prev = lv_last_day_prev.
    ENDIF.

* Exibir o resultado
    rv_date = lv_last_tue_prev.


  ENDMETHOD.
