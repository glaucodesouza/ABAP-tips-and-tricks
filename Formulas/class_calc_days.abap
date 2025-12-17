class ZCL_EXIT_COND_PRECO_COMPOSTO definition
  public
  inheriting from ZCL_EXIT
  final
  create public .

public section.

  types:
    begin of ty_ukurs,
          ukurs type tcurr-ukurs,
         end   of ty_ukurs .
  types:
    tt_ukurs type standard table of ty_ukurs .

  constants CC_COND_PIX_CHINA type STRING value 'Z3P8' ##NO_TEXT.
  constants CC_COND_PIX_EUROPE type STRING value 'Z3P1' ##NO_TEXT.
  constants CC_VTWEG_MI type STRING value 'MC' ##NO_TEXT.

  class-methods GET_LAST_TUESDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_FIRST_TUESDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_PENULT_TUESDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_LAST_TUESDAY_CURR_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_FIRST_TUESDAY_CURR_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_LAST_FRIDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_FIRST_FRIDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_PENULT_FRIDAY_LAST_MONTH
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_26_FROM_2MONTHS_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_26_FROM_4MONTHS_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_25_FROM_1MONTHS_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_1_FROM_1MONTH_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_LAST_FROM_1MONTH_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_DAY_LAST_FROM_2MONTH_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods GET_PENULT_WORKDAY_1MONTH_AGO
    returning
      value(RV_DATE) type SY-DATUM .
  class-methods CALC_PIX_EUR_300
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_EUR_301
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_EUR_302
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_EUR_303
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_EUR_316
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_CHINA_304
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_CHINA_305
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      value(IV_SPART) type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CALC_PIX_CHINA_306
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_KBETR) type KONP-KBETR .
  class-methods CHECK_COND_PIX_EUROPE
    importing
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_RET) type SAP_BOOL .
  class-methods CHECK_COND_PIX_CHINA
    importing
      !IV_KSCHL type KOMV-KSCHL
    returning
      value(RV_RET) type SAP_BOOL .
  class-methods SEL_KNVV_PIX_EUROPA
    importing
      !IV_KUNNR type KNVV-KUNNR
      !IV_VKORG type KNVV-VKORG
      !IV_VTWEG type KNVV-VTWEG
      !IV_SPART type KNVV-SPART
    exporting
      value(EV_KVGR2) type KNVV-KVGR2
      !EV_KONDA type KNVV-KONDA .
  class-methods SEL_KNVV_PIX_CHINA
    importing
      !IV_KUNNR type KNVV-KUNNR
      !IV_VKORG type KNVV-VKORG
      !IV_VTWEG type KNVV-VTWEG
      !IV_SPART type KNVV-SPART
    exporting
      !EV_KVGR3 type KNVV-KVGR3
      !EV_KONDA type KNVV-KONDA .
  class-methods SEL_AVERAGE_TCURR_BY_GDATU
    importing
      !IV_GDATU_FROM type SY-DATUM
      !IV_GDATU_TO type SY-DATUM
    returning
      value(RV_UKURS) type TCURR-UKURS .
  class-methods CALC_AVG_UKURS_FOR_MI
    importing
      !IV_KUNNR type VBAK-KUNNR
      !IV_VKORG type VBAK-VKORG
      !IV_VTWEG type VBAK-VTWEG
      !IV_SPART type VBAK-SPART
      !IV_KONDA type KNVV-KONDA
    returning
      value(RV_KBETR) type KONP-KBETR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EXIT_COND_PRECO_COMPOSTO IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_AVG_UKURS_FOR_MI
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_avg_ukurs_for_mi.

    CLEAR rv_kbetr.

    DATA:
      lv_2months_ago_date_26       TYPE sy-datum,
      lv_4months_ago_date_26       TYPE sy-datum,
      lv_1months_ago_date_25       TYPE sy-datum,
      lv_1months_ago_date_01       TYPE sy-datum,
      lv_1months_ago_date_last     TYPE sy-datum,
      lv_day_last_from_2month_ago  TYPE sy-datum,
      lv_penult_workday_1month_ago TYPE sy-datum.

    CASE iv_konda.
      WHEN '21'.
        lv_2months_ago_date_26  = get_day_26_from_2months_ago( ).
        lv_1months_ago_date_25  = get_day_25_from_1months_ago( ).

        rv_kbetr = sel_average_tcurr_by_gdatu(
                              iv_gdatu_from = lv_2months_ago_date_26
                              iv_gdatu_to   = lv_1months_ago_date_25
                            ).

      WHEN '22'.
        lv_4months_ago_date_26  = get_day_26_from_4months_ago( ).
        lv_1months_ago_date_25  = get_day_25_from_1months_ago( ).

        rv_kbetr = sel_average_tcurr_by_gdatu(
                              iv_gdatu_from = lv_4months_ago_date_26
                              iv_gdatu_to   = lv_1months_ago_date_25
                            ).
      WHEN '23'.

        lv_day_last_from_2month_ago = get_day_last_from_2month_ago( ).
        lv_penult_workday_1month_ago = get_penult_workday_1month_ago( ).

        rv_kbetr = sel_average_tcurr_by_gdatu(
                              iv_gdatu_from = lv_day_last_from_2month_ago
                              iv_gdatu_to   = lv_penult_workday_1month_ago
                            ).

      WHEN '24'.
        lv_1months_ago_date_01    = get_day_1_from_1month_ago( ).
        lv_1months_ago_date_last  = get_day_last_from_1month_ago( ).

        rv_kbetr = sel_average_tcurr_by_gdatu(
                              iv_gdatu_from = lv_1months_ago_date_01
                              iv_gdatu_to   = lv_1months_ago_date_last
                            ).

    ENDCASE.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_CHINA_304
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_china_304.

    CLEAR rv_kbetr.

    "Igual a 304 – Selecionar o último PIX do mês anterior, cadastrado na tabela A508, condição Z3P8
    DATA(lv_last_friday_prev_month) = get_last_friday_last_month( ).

    SELECT SINGLE knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_china "'Z3P8'
       AND spart = @iv_spart
       AND datab = @lv_last_friday_prev_month "última sexta-feira do mês anterior ao mês corrente
      INTO @DATA(lv_knumh_pix_chi_304).

    IF sy-subrc = 0 AND lv_knumh_pix_chi_304 IS NOT INITIAL.
      "Selecionar o registro de condição no campo A508-KNUMH e, na sequência, ler o valor do registro de condição na tabela KONP:
      SELECT SINGLE kbetr
        FROM konp
       WHERE knumh = @lv_knumh_pix_chi_304
        INTO @DATA(lv_kbetr_pix_chi_304).

      IF sy-subrc = 0.

        rv_kbetr = lv_kbetr_pix_chi_304.

        "EF 1.3) if it is internal market
        IF iv_vtweg = cc_vtweg_mi.

          DATA:
            lv_average_ukurs       TYPE tcurr-ukurs.

          lv_average_ukurs = calc_avg_ukurs_for_mi(
                               iv_kunnr = iv_kunnr       " Emissor da ordem
                               iv_vkorg = iv_vkorg       " Organização de vendas
                               iv_vtweg = iv_vtweg       " Canal de distribuição
                               iv_spart = iv_spart       " Setor de atividade
                               iv_konda = iv_konda       " Grupo de preço do cliente
                             ).

          rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                  THEN lv_average_ukurs * lv_kbetr_pix_chi_304 ).

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_CHINA_305
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_china_305.

    TYPES: BEGIN OF ty_konp,
             knumh TYPE konp-knumh,
             kbetr TYPE konp-kbetr,
           END   OF ty_konp.

    DATA: lt_kbetr_pix_chi   TYPE STANDARD TABLE OF ty_konp,
          lv_media_kbetr_pix TYPE kbetr.

    CLEAR rv_kbetr.

    "Igual a 305 – Calcular a média do PIX do mês anterior, cadastrado na tabela A508, condição Z3P8

    DATA(lv_first_friday_prev_month) = get_first_friday_last_month( ).
    DATA(lv_last_friday_prev_month) = get_last_friday_last_month( ).

    SELECT knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_china "'Z3P8'
       AND spart = @iv_spart
       AND datab BETWEEN @lv_first_friday_prev_month AND @lv_last_friday_prev_month
      INTO TABLE @DATA(lt_knumh_pix_chi_305).

    IF lt_knumh_pix_chi_305 IS NOT INITIAL.

      SELECT knumh, kbetr
        FROM konp
         FOR ALL ENTRIES IN @lt_knumh_pix_chi_305
       WHERE knumh = @lt_knumh_pix_chi_305-knumh
        INTO TABLE @lt_kbetr_pix_chi.

      IF sy-subrc = 0.
        LOOP AT lt_kbetr_pix_chi INTO DATA(ls_kbetr_pix_chi).
          DATA lv_soma_kbetr_pix TYPE konp-kbetr.
          lv_soma_kbetr_pix = lv_soma_kbetr_pix + ls_kbetr_pix_chi-kbetr.
        ENDLOOP.
        lv_media_kbetr_pix = lv_soma_kbetr_pix / lines( lt_knumh_pix_chi_305 ).
      ENDIF.

      "Mover o valor da média calculada para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1.
      rv_kbetr = COND kbetr( WHEN iv_kschl = 'Z3P8' AND lv_media_kbetr_pix IS NOT INITIAL
                              THEN lv_media_kbetr_pix ).

      "EF 1.3) if it is internal market
      IF iv_vtweg = cc_vtweg_mi.

        DATA:
          lv_average_ukurs TYPE tcurr-ukurs.

        lv_average_ukurs = calc_avg_ukurs_for_mi(
                             iv_kunnr = iv_kunnr       " Emissor da ordem
                             iv_vkorg = iv_vkorg       " Organização de vendas
                             iv_vtweg = iv_vtweg       " Canal de distribuição
                             iv_spart = iv_spart       " Setor de atividade
                             iv_konda = iv_konda       " Grupo de preço do cliente
                           ).

        rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                THEN lv_average_ukurs * lv_media_kbetr_pix ).

      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_CHINA_306
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_china_306.

    CLEAR rv_kbetr.

    DATA(lv_penult_friday_prev_month) = get_penult_friday_last_month( ).

    SELECT SINGLE knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_china "'Z3P8'
       AND spart = @iv_spart
       AND datab = @lv_penult_friday_prev_month "penúltima terça-feira do mês anterior ao mês corrente
      INTO @DATA(lv_knumh_pix_chi_306).

    IF sy-subrc = 0.
      "Selecionar o registro de condição no campo A508-KNUMH e, na sequência, ler o valor do registro de condição na tabela KONP:
      SELECT SINGLE kbetr
        FROM konp
       WHERE knumh = @lv_knumh_pix_chi_306
        INTO @DATA(lv_kbetr_pix_chi_306).

      IF sy-subrc = 0.
        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        rv_kbetr = COND kbetr( WHEN iv_kschl = 'Z3P8' AND lv_kbetr_pix_chi_306 IS NOT INITIAL
                                THEN lv_kbetr_pix_chi_306 ).

        "EF 1.3) if it is internal market
        IF iv_vtweg = cc_vtweg_mi.

          DATA:
            lv_average_ukurs       TYPE tcurr-ukurs.

          lv_average_ukurs = calc_avg_ukurs_for_mi(
                               iv_kunnr = iv_kunnr       " Emissor da ordem
                               iv_vkorg = iv_vkorg       " Organização de vendas
                               iv_vtweg = iv_vtweg       " Canal de distribuição
                               iv_spart = iv_spart       " Setor de atividade
                               iv_konda = iv_konda       " Grupo de preço do cliente
                             ).

          rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                  THEN lv_average_ukurs * lv_kbetr_pix_chi_306 ).

        ENDIF.

      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_EUR_300
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_eur_300.

    CLEAR rv_kbetr.

    "Igual a 300 – Selecionar o último PIX do mês anterior, cadastrado na tabela A508, condição Z3P1
    DATA(lv_last_tue_prev_month) = get_last_tuesday_last_month( ).

    SELECT SINGLE knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_europe "'Z3P1'
       AND spart = @iv_spart
       AND datab = @lv_last_tue_prev_month "última terça-feira do mês anterior ao mês corrente
      INTO @DATA(lv_knumh_pix_eur_300).

    IF sy-subrc = 0.
      "Selecionar o registro de condição no campo A508-KNUMH e, na sequência, ler o valor do registro de condição na tabela KONP:
      SELECT SINGLE kbetr
        FROM konp
       WHERE knumh = @lv_knumh_pix_eur_300
        INTO @DATA(lv_kbetr_pix_eur_300).

      IF sy-subrc = 0.

        rv_kbetr = lv_kbetr_pix_eur_300.

        "EF 1.3) if it is internal market
        IF iv_vtweg = cc_vtweg_mi.

          DATA:
            lv_average_ukurs       TYPE tcurr-ukurs.

          lv_average_ukurs = calc_avg_ukurs_for_mi(
                               iv_kunnr = iv_kunnr       " Emissor da ordem
                               iv_vkorg = iv_vkorg       " Organização de vendas
                               iv_vtweg = iv_vtweg       " Canal de distribuição
                               iv_spart = iv_spart       " Setor de atividade
                               iv_konda = iv_konda       " Grupo de preço do cliente
                             ).

          rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                  THEN lv_average_ukurs * lv_kbetr_pix_eur_300 ).

        ENDIF.

      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_EUR_301
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_eur_301.

    TYPES: BEGIN OF ty_konp,
             knumh TYPE konp-knumh,
             kbetr TYPE konp-kbetr,
           END   OF ty_konp.

    DATA: lt_kbetr_pix_eur   TYPE STANDARD TABLE OF ty_konp,
          lv_media_kbetr_pix TYPE kbetr.

    CLEAR rv_kbetr.

    "Igual a 301
    "calc. média kbetr pix eur 301
    DATA(lv_first_tue_prev_month) = get_first_tuesday_last_month( ).
    DATA(lv_last_tue_prev_month) = get_last_tuesday_last_month( ).

    SELECT knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_europe "'Z3P1'
       AND spart = @iv_spart
       AND datab BETWEEN @lv_first_tue_prev_month AND @lv_last_tue_prev_month
      INTO TABLE @DATA(lt_knumh_pix_eur_301).

    IF lt_knumh_pix_eur_301 IS NOT INITIAL.

      SELECT knumh, kbetr
        FROM konp
         FOR ALL ENTRIES IN @lt_knumh_pix_eur_301
       WHERE knumh = @lt_knumh_pix_eur_301-knumh
        INTO TABLE @lt_kbetr_pix_eur.

      IF sy-subrc = 0.
        LOOP AT lt_kbetr_pix_eur INTO DATA(ls_kbetr_pix_eur).
          DATA lv_soma_kbetr_pix TYPE konp-kbetr.
          lv_soma_kbetr_pix = lv_soma_kbetr_pix + ls_kbetr_pix_eur-kbetr.
        ENDLOOP.
        lv_media_kbetr_pix = lv_soma_kbetr_pix / lines( lt_knumh_pix_eur_301 ).
      ENDIF.

      rv_kbetr = lv_media_kbetr_pix.

      "EF 1.3) if it is internal market
      IF iv_vtweg = cc_vtweg_mi.
        DATA:
              lv_average_ukurs       TYPE tcurr-ukurs.

        lv_average_ukurs = calc_avg_ukurs_for_mi(
                             iv_kunnr = iv_kunnr       " Emissor da ordem
                             iv_vkorg = iv_vkorg       " Organização de vendas
                             iv_vtweg = iv_vtweg       " Canal de distribuição
                             iv_spart = iv_spart       " Setor de atividade
                             iv_konda = iv_konda       " Grupo de preço do cliente
                           ).

        rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                THEN lv_average_ukurs * lv_media_kbetr_pix ).

      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_EUR_302
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_eur_302.

    CLEAR rv_kbetr.

    "Igual a 302 – Selecionar o último pix do mês corrente, cadastrado na tabela a508, condição z3p1.
    DATA(lv_last_tuesday_curr_month) = get_last_tuesday_curr_month( ).

    SELECT SINGLE knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_europe "'Z3P1'
       AND spart = @iv_spart
       AND datab = @lv_last_tuesday_curr_month "última terça-feira do mês corrente
      INTO @DATA(lv_knumh_pix_eur_302).

    IF sy-subrc = 0.
      "Selecionar o registro de condição no campo A508-KNUMH e, na sequência, ler o valor do registro de condição na tabela KONP:
      SELECT SINGLE kbetr
        FROM konp
       WHERE knumh = @lv_knumh_pix_eur_302
        INTO @DATA(lv_kbetr_pix_eur_302).

      IF sy-subrc = 0.

        rv_kbetr = lv_kbetr_pix_eur_302.

        "EF 1.3) if it is internal market
        IF iv_vtweg = cc_vtweg_mi.

          DATA:
            lv_average_ukurs       TYPE tcurr-ukurs.

          lv_average_ukurs = calc_avg_ukurs_for_mi(
                               iv_kunnr = iv_kunnr       " Emissor da ordem
                               iv_vkorg = iv_vkorg       " Organização de vendas
                               iv_vtweg = iv_vtweg       " Canal de distribuição
                               iv_spart = iv_spart       " Setor de atividade
                               iv_konda = iv_konda       " Grupo de preço do cliente
                             ).

          rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                  THEN lv_average_ukurs * lv_kbetr_pix_eur_302 ).

        ENDIF.
      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_EUR_303
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_eur_303.

    TYPES: BEGIN OF ty_konp,
             knumh TYPE konp-knumh,
             kbetr TYPE konp-kbetr,
           END   OF ty_konp.

    DATA: lt_kbetr_pix_eur_303   TYPE STANDARD TABLE OF ty_konp,
          lv_media_kbetr_pix_303 TYPE kbetr.

    CLEAR rv_kbetr.

    "Igual a 303 – Calcular a média do PIX do mês corrente, cadastrado na tabela A508, condição Z3P1

    DATA(lv_first_tuesday_curr_month) = get_first_tuesday_curr_month( ).
    DATA(lv_last_tuesday_curr_month) = get_last_tuesday_curr_month( ).

    SELECT knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_europe "'Z3P1'
       AND spart = @iv_spart
       AND datab BETWEEN @lv_first_tuesday_curr_month AND @lv_last_tuesday_curr_month
      INTO TABLE @DATA(lt_knumh_pix_eur_303).

    IF lt_knumh_pix_eur_303 IS NOT INITIAL.
      SELECT knumh, kbetr
        FROM konp
         FOR ALL ENTRIES IN @lt_knumh_pix_eur_303
       WHERE knumh = @lt_knumh_pix_eur_303-knumh
        INTO TABLE @lt_kbetr_pix_eur_303.
      "INTO TABLE @DATA(lt_kbetr_pix_eur_303).

      IF sy-subrc = 0.
        LOOP AT lt_kbetr_pix_eur_303 INTO DATA(ls_kbetr_pix_eur_303).
          DATA lv_soma_kbetr_pix_303 TYPE konp-kbetr.
          lv_soma_kbetr_pix_303 = lv_soma_kbetr_pix_303 + ls_kbetr_pix_eur_303-kbetr.
        ENDLOOP.
        lv_media_kbetr_pix_303 = lv_soma_kbetr_pix_303 / lines( lt_knumh_pix_eur_303 ).
      ENDIF.

      rv_kbetr = COND kbetr( WHEN iv_kschl = 'Z3P1'
                                THEN lv_media_kbetr_pix_303 ).

      "Mover o valor da média calculada para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1.
      "EF 1.3) if it is internal market
      IF iv_vtweg = cc_vtweg_mi.

        DATA:
          lv_average_ukurs TYPE tcurr-ukurs.

        lv_average_ukurs = calc_avg_ukurs_for_mi(
                             iv_kunnr = iv_kunnr       " Emissor da ordem
                             iv_vkorg = iv_vkorg       " Organização de vendas
                             iv_vtweg = iv_vtweg       " Canal de distribuição
                             iv_spart = iv_spart       " Setor de atividade
                             iv_konda = iv_konda       " Grupo de preço do cliente
                           ).

        rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                THEN lv_average_ukurs * lv_media_kbetr_pix_303 ).

      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CALC_PIX_EUR_316
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        VBAK-KUNNR
* | [--->] IV_VKORG                       TYPE        VBAK-VKORG
* | [--->] IV_VTWEG                       TYPE        VBAK-VTWEG
* | [--->] IV_SPART                       TYPE        VBAK-SPART
* | [--->] IV_KONDA                       TYPE        KNVV-KONDA
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_KBETR                       TYPE        KONP-KBETR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD calc_pix_eur_316.

    CLEAR rv_kbetr.

    "Igual a 316 – Selecionar o penúltimo pix do mês anterior, cadastrado na tabela a508, condição z3p1

    DATA(lv_penult_tue_prev_month) = get_penult_tuesday_last_month( ).
    SELECT SINGLE knumh
      FROM a508
     WHERE kappl = 'V'
       AND kschl = @cc_cond_pix_europe "'Z3P1'
       AND spart = @iv_spart
       AND datab = @lv_penult_tue_prev_month "penúltima terça-feira do mês anterior ao mês corrente
      INTO @DATA(lv_knumh_pix_eur_316).

    IF sy-subrc = 0 AND lv_knumh_pix_eur_316 IS NOT INITIAL.
      "Selecionar o registro de condição no campo A508-KNUMH e, na sequência, ler o valor do registro de condição na tabela KONP:
      SELECT SINGLE kbetr
        FROM konp
       WHERE knumh = @lv_knumh_pix_eur_316
        INTO @DATA(lv_kbetr_pix_eur_316).

      IF sy-subrc = 0.

        rv_kbetr = lv_kbetr_pix_eur_316.

        "EF 1.3) if it is internal market
        IF iv_vtweg = cc_vtweg_mi.

          DATA:
            lv_average_ukurs       TYPE tcurr-ukurs.

          lv_average_ukurs = calc_avg_ukurs_for_mi(
                               iv_kunnr = iv_kunnr       " Emissor da ordem
                               iv_vkorg = iv_vkorg       " Organização de vendas
                               iv_vtweg = iv_vtweg       " Canal de distribuição
                               iv_spart = iv_spart       " Setor de atividade
                               iv_konda = iv_konda       " Grupo de preço do cliente
                             ).

          rv_kbetr = COND kbetr( WHEN lv_average_ukurs IS NOT INITIAL
                                  THEN lv_average_ukurs * lv_kbetr_pix_eur_316 ).

        ENDIF.
        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
*      rv_kbetr = COND kbetr( WHEN iv_kschl = 'Z3P1' AND lv_kbetr_pix_eur_316 IS NOT INITIAL
*                              THEN lv_kbetr_pix_eur_316 ).
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CHECK_COND_PIX_CHINA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_RET                         TYPE        SAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_cond_pix_china.

    CLEAR rv_ret.

    IF iv_kschl = cc_cond_pix_china.
      rv_ret = abap_true.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>CHECK_COND_PIX_EUROPE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KSCHL                       TYPE        KOMV-KSCHL
* | [<-()] RV_RET                         TYPE        SAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD check_cond_pix_europe.
    CLEAR rv_ret.

    IF iv_kschl = cc_cond_pix_europe.
      rv_ret = abap_true.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_1_FROM_1MONTH_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_day_1_from_1month_ago.

    CLEAR rv_date.

    DATA:
      lv_current_date TYPE sy-datum,
      lv_prev_date    TYPE sy-datum.

    CLEAR rv_date.

    lv_current_date = sy-datum.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_current_date
        dmm_count = '1'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_prev_date.

    rv_date = lv_prev_date(6) && '01'.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_25_FROM_1MONTHS_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_day_25_from_1months_ago.

    CLEAR rv_date.

    DATA:
      lv_current_date_25     TYPE sy-datum,
      lv_2months_ago_date_25 TYPE sy-datum.

    CLEAR rv_date.

    lv_current_date_25 = sy-datum(6) && '26'.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_current_date_25
        dmm_count = '1'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_2months_ago_date_25.

    rv_date = lv_2months_ago_date_25.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_26_FROM_2MONTHS_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_day_26_from_2months_ago.

    DATA:
      lv_current_date_26     TYPE sy-datum,
      lv_2months_ago_date_26 TYPE sy-datum.

    CLEAR rv_date.

    lv_current_date_26 = sy-datum(6) && '26'.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_current_date_26
        dmm_count = '2'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_2months_ago_date_26.

    rv_date = lv_2months_ago_date_26.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_26_FROM_4MONTHS_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD GET_DAY_26_FROM_4MONTHS_AGO.

    DATA:
      lv_current_date_26     TYPE sy-datum,
      lv_2months_ago_date_26 TYPE sy-datum.

    CLEAR rv_date.

    lv_current_date_26 = sy-datum(6) && '26'.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_current_date_26
        dmm_count = '4'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_2months_ago_date_26.

    rv_date = lv_2months_ago_date_26.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_LAST_FROM_1MONTH_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD GET_DAY_LAST_FROM_1MONTH_AGO.

    CLEAR rv_date.

    DATA:
      lv_current_date     TYPE sy-datum,
      lv_last_day_1month_ago        TYPE sy-datum.

    lv_current_date = sy-datum(6) && '01'.
    lv_last_day_1month_ago = lv_current_date - 1.

    rv_date = lv_last_day_1month_ago.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_DAY_LAST_FROM_2MONTH_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_day_last_from_2month_ago.

    CLEAR rv_date.

    DATA:
      lv_current_date        TYPE sy-datum,
      lv_last_day_2month_ago TYPE sy-datum,
      lv_1month_ago_day1     TYPE sy-datum,
      lv_1month_ago          TYPE sy-datum.

    lv_current_date = sy-datum.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_current_date
        dmm_count = '1'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_1month_ago.

    lv_1month_ago_day1 = lv_1month_ago(6) && '01'.
    lv_last_day_2month_ago = lv_1month_ago_day1 - 1.

    rv_date = lv_last_day_2month_ago.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_FIRST_FRIDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_first_friday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_first_day_prev TYPE sy-datum,
          lv_first_fri_prev TYPE sy-datum,
          lv_weekday        TYPE char1.

    CONSTANTS:
          cc_friday TYPE i VALUE 5.

    " 1. Obter a data atual
    lv_first_day_curr = sy-datum(6) && '01'.

    " 2. Obter o primeiro dia do mês anterior
    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_first_day_curr
        dmm_count = '1'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_first_day_prev.

    "Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_first_day_prev
      IMPORTING
        day  = lv_weekday.

    "Ajuste a data para a primeira Sexta-feira
    lv_first_fri_prev = lv_first_day_prev.
    WHILE lv_weekday <> cc_friday.
      lv_first_fri_prev = lv_first_fri_prev + 1.
      CALL FUNCTION 'DATE_COMPUTE_DAY'
        EXPORTING
          date = lv_first_fri_prev
        IMPORTING
          day  = lv_weekday.
    ENDWHILE.

    rv_date = lv_first_fri_prev.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_FIRST_TUESDAY_CURR_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_first_tuesday_curr_month.

    CLEAR rv_date.

    DATA:
      lv_first_day_curr TYPE sy-datum,
      lv_first_tue_curr TYPE sy-datum,
      lv_weekday        TYPE char1.

    "Obter o primeiro dia do mês atual
    lv_first_day_curr = sy-datum(6) && '01'.

    "Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_first_day_curr
      IMPORTING
        day  = lv_weekday.

    "Ajuste a data para a primeira terça-feira
    "Se o último dia já for terça-feira (lv_weekday = 2), então essa é a data.
    "Caso contrário, calcule a diferença para chegar à terça-feira anterior.
    IF lv_weekday > 2.

      lv_first_tue_curr = lv_first_day_curr.
      WHILE lv_weekday <> 2.
        lv_first_tue_curr = lv_first_tue_curr + 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_first_tue_curr
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSEIF lv_weekday < 2.
      "Se o dia da semana for segunda (1), adicione 1
      lv_first_tue_curr = lv_first_tue_curr + 1.

    ELSE.
      "Se já for terça-feira (2)
      lv_first_tue_curr = lv_first_day_curr.
    ENDIF.

    "Exibir o resultado
    rv_date = lv_first_tue_curr.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_FIRST_TUESDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_first_tuesday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_first_day_prev TYPE sy-datum,
          lv_first_tue_prev TYPE sy-datum,
          lv_weekday        TYPE char1,

          lv_last_month     TYPE sy-datum.

* 1. Obter a data atual
*    lv_today = '20250301'.
*    lv_today = sy-datum(6) && '01'.
    lv_first_day_curr = sy-datum(6) && '01'.

* 2. Obter o primeiro dia do mês atual
*    Isso pode ser feito manipulando a data diretamente
*    lv_first_day_curr = lv_today.
*    lv_first_day_curr+6(2) = '01'.
*    data(lv_last_month) = lv_today+4(2) - 1.
*    data(lv_first_day_last_month) = lv_today+4(2) - 1.

    CALL FUNCTION 'HR_BR_ADD_MONTH_TO_DATE'
      EXPORTING
        dmm_datin = lv_first_day_curr
        dmm_count = '1'
        dmm_oper  = '-'
        dmm_pos   = space
      IMPORTING
        dmm_daout = lv_first_day_prev.


*    Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_first_day_prev
      IMPORTING
        day  = lv_weekday.

*    Ajuste a data para a primeira terça-feira
*    Se o último dia já for terça-feira (lv_weekday = 2), então essa é a data.
*    Caso contrário, calcule a diferença para chegar à terça-feira anterior.
    IF lv_weekday > 2.

      lv_first_tue_prev = lv_first_day_prev.
      WHILE lv_weekday <> 2.
        lv_first_tue_prev = lv_first_tue_prev + 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_first_tue_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSEIF lv_weekday < 2.
*   Se o dia da semana for segunda (1), adicione 1
      lv_first_tue_prev = lv_first_day_prev + 1.

    ELSE.
*   Se já for terça-feira (2)
      lv_first_tue_prev = lv_first_day_prev.
    ENDIF.

* Exibir o resultado
    rv_date = lv_first_tue_prev.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_LAST_FRIDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_last_friday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_last_day_prev  TYPE sy-datum,
          lv_last_fri_prev  TYPE sy-datum,
          lv_weekday        TYPE char1.

    CONSTANTS:
      cc_friday TYPE i VALUE 5.

    " 1. Obter a data atual
    lv_today = sy-datum.

    " 2. Obter o primeiro dia do mês atual
    "    Isso pode ser feito manipulando a data diretamente
    lv_first_day_curr = lv_today.
    lv_first_day_curr+6(2) = '01'.

    " 3. Obter o último dia do mês anterior
    "    Subtraia um dia do primeiro dia do mês atual. O SAP lida automaticamente com anos bissextos e meses diferentes.
    lv_last_day_prev = lv_first_day_curr - 1.

    " 4. Encontrar a última terça-feira do mês anterior
    "    Terça-feira tem o código de dia da semana 2 (de acordo com o padrão SAP, onde Segunda = 1, Domingo = 7).
    "    Você pode usar a função WEEKDAY_GET ou SY-DATUM para isso.

    "Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_last_day_prev
      IMPORTING
        day  = lv_weekday.

    "Ajuste a data para a última terça-feira
    "Se o último dia já for terça-feira (lv_weekday = 2), então essa é a data.
    "Caso contrário, calcule a diferença para chegar à terça-feira anterior.
    IF lv_weekday < cc_friday.
      "Se o dia da semana for Dom (7), Sáb (6), etc., calcule a diferença de dias.
      "Vamos usar uma abordagem mais direta: subtrair dias até encontrar a terça-feira.

      lv_last_fri_prev = lv_last_day_prev.
      WHILE lv_weekday <> cc_friday.
        lv_last_fri_prev = lv_last_fri_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_last_fri_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSEIF lv_weekday > cc_friday.
      "Se o dia da semana for Quarta (3), Quinta (4), etc., subtraia a diferença
      lv_last_fri_prev = lv_last_day_prev - ( lv_weekday - cc_friday ).

    ELSE.
      "Se já for sexta
      lv_last_fri_prev = lv_last_day_prev.
    ENDIF.

* Exibir o resultado
    rv_date = lv_last_fri_prev.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_LAST_TUESDAY_CURR_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
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


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_LAST_TUESDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
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
        date = lv_last_day_prev
      IMPORTING
        day  = lv_weekday.

*    Ajuste a data para a última terça-feira
*    Se o último dia já for terça-feira (lv_weekday = 2), então essa é a data.
*    Caso contrário, calcule a diferença para chegar à terça-feira anterior.
    IF lv_weekday < 2.
*      Se o dia da semana for Dom (7), Sáb (6), etc., calcule a diferença de dias.
*      (lv_weekday MOD 7) retorna 0 para Domingo, 1 para Segunda, etc.
*      A lógica exata de ajuste depende do padrão de numeração de dias da semana (ex: 1=Seg, ..., 7=Dom).
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


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_PENULT_FRIDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_penult_friday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_first_day_prev TYPE sy-datum,
          lv_last_day_prev  TYPE sy-datum,
          lv_last_fri_prev  TYPE sy-datum,
          lv_penul_fri_prev TYPE sy-datum,
          lv_weekday        TYPE char1.

    CONSTANTS:
          cc_friday TYPE i VALUE 5.

    " 1. Obter a data atual
    lv_today = sy-datum.

    " 2. Obter o primeiro dia do mês atual
    "    Isso pode ser feito manipulando a data diretamente
    lv_first_day_curr = lv_today.
    lv_first_day_curr+6(2) = '01'.

    " 3. Obter o último dia do mês anterior
    "    Subtraia um dia do primeiro dia do mês atual. O SAP lida automaticamente com anos bissextos e meses diferentes.
    lv_last_day_prev = lv_first_day_curr - 1.

    " 4. Encontrar a primeira Sexta-feira do mês anterior
    "    Terça-feira tem o código de dia da semana 2 (de acordo com o padrão SAP, onde Segunda = 1, Domingo = 7).
    "    Você pode usar a função WEEKDAY_GET ou SY-DATUM para isso.

    "    Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_last_day_prev
      IMPORTING
        day  = lv_weekday.

    IF lv_weekday = cc_friday.

      lv_last_fri_prev = lv_last_day_prev.
      lv_weekday = 0.
      lv_penul_fri_prev = lv_last_fri_prev.
      WHILE lv_weekday <> cc_friday.
        lv_penul_fri_prev = lv_penul_fri_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_penul_fri_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSE.

      lv_last_fri_prev = lv_last_day_prev.
      WHILE lv_weekday <> cc_friday.
        lv_last_fri_prev = lv_last_fri_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_last_fri_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

      lv_weekday = 0.
      lv_penul_fri_prev = lv_last_fri_prev.
      WHILE lv_weekday <> cc_friday.
        lv_penul_fri_prev = lv_penul_fri_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_penul_fri_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ENDIF.

    rv_date = lv_penul_fri_prev.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_PENULT_TUESDAY_LAST_MONTH
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_penult_tuesday_last_month.

    CLEAR rv_date.

    DATA: lv_today          TYPE sy-datum,
          lv_first_day_curr TYPE sy-datum,
          lv_first_day_prev TYPE sy-datum,
          lv_last_day_prev  TYPE sy-datum,
          lv_last_tue_prev  TYPE sy-datum,
          lv_penul_tue_prev TYPE sy-datum,
          lv_weekday        TYPE char1.

    " 1. Obter a data atual
    lv_today = sy-datum.

    " 2. Obter o primeiro dia do mês atual
    "    Isso pode ser feito manipulando a data diretamente
    lv_first_day_curr = lv_today.
    lv_first_day_curr+6(2) = '01'.

    " 3. Obter o último dia do mês anterior
    "    Subtraia um dia do primeiro dia do mês atual. O SAP lida automaticamente com anos bissextos e meses diferentes.
    lv_last_day_prev = lv_first_day_curr - 1.

    " 4. Encontrar a penúltima terça-feira do mês anterior
    "    Terça-feira tem o código de dia da semana 2 (de acordo com o padrão SAP, onde Segunda = 1, Domingo = 7).
    "    Você pode usar a função WEEKDAY_GET ou SY-DATUM para isso.

    "    Determine o dia da semana do último dia do mês anterior
    CALL FUNCTION 'DATE_COMPUTE_DAY'
      EXPORTING
        date = lv_last_day_prev
      IMPORTING
        day  = lv_weekday.

    IF lv_weekday = 2.

      lv_last_tue_prev = lv_last_day_prev.
      lv_weekday = 0.
      lv_penul_tue_prev = lv_last_tue_prev.
      WHILE lv_weekday <> 2.
        lv_penul_tue_prev = lv_penul_tue_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_penul_tue_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ELSE.

      lv_last_tue_prev = lv_last_day_prev.
      WHILE lv_weekday <> 2.
        lv_last_tue_prev = lv_last_tue_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_last_tue_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

      lv_weekday = 0.
      lv_penul_tue_prev = lv_last_tue_prev.
      WHILE lv_weekday <> 2.
        lv_penul_tue_prev = lv_penul_tue_prev - 1.
        CALL FUNCTION 'DATE_COMPUTE_DAY'
          EXPORTING
            date = lv_penul_tue_prev
          IMPORTING
            day  = lv_weekday.
      ENDWHILE.

    ENDIF.

    rv_date = lv_penul_tue_prev.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>GET_PENULT_WORKDAY_1MONTH_AGO
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_DATE                        TYPE        SY-DATUM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_penult_workday_1month_ago.

    CLEAR rv_date.

    DATA: lv_date       TYPE d,
          lv_last_month TYPE d,
          lv_counter    TYPE i VALUE 0,
          lv_penultimo  TYPE d.

    CONSTANTS: lc_calendar TYPE scal-fcalid VALUE 'BR'. " ID do calendário de fábrica (ex.: Brasil)

    " Passo 1: Primeiro dia do mês atual
    lv_date = sy-datum.
    lv_date+6(2) = '01'. " Define dia como 01

    " Passo 2: Último dia do mês anterior
    lv_last_month = lv_date - 1.

    " Passo 3: Encontrar penúltimo dia útil usando calendário
    WHILE lv_counter < 2.
      CALL FUNCTION 'DATE_CHECK_WORKINGDAY'
        EXPORTING
          date                = lv_last_month
          factory_calendar_id = lc_calendar
          message_type        = 'I'
        EXCEPTIONS
          calendar_not_found  = 1
          date_invalid        = 2
          OTHERS              = 3.

      IF sy-subrc = 0. " É dia útil
        lv_counter = lv_counter + 1.
        IF lv_counter = 2.
          lv_penultimo = lv_last_month.
          EXIT.
        ENDIF.
      ENDIF.

      lv_last_month = lv_last_month - 1.
    ENDWHILE.

    rv_date = lv_penultimo.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>SEL_AVERAGE_TCURR_BY_GDATU
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_GDATU_FROM                  TYPE        SY-DATUM
* | [--->] IV_GDATU_TO                    TYPE        SY-DATUM
* | [<-()] RV_UKURS                       TYPE        TCURR-UKURS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD sel_average_tcurr_by_gdatu.

    DATA:
      lv_gdatu_from TYPE tcurr-gdatu,
      lv_gdatu_to   TYPE tcurr-gdatu.

    CONSTANTS: cc_kurst TYPE tcurr-kurst VALUE 'M',
               cc_fcurr TYPE tcurr-fcurr VALUE 'USD',
               cc_tcurr TYPE tcurr-tcurr VALUE 'BRL'.

    CLEAR rv_ukurs.

    IF iv_gdatu_from IS INITIAL OR iv_gdatu_to IS INITIAL.
      RETURN.
    ENDIF.

    CALL FUNCTION 'CONVERSION_EXIT_INVDT_INPUT'
      EXPORTING
        input  = iv_gdatu_from+6(2) && iv_gdatu_from+4(2) && iv_gdatu_from(4)
      IMPORTING
        output = lv_gdatu_from.

    CALL FUNCTION 'CONVERSION_EXIT_INVDT_INPUT'
      EXPORTING
        input  = iv_gdatu_to+6(2) && iv_gdatu_to+4(2) && iv_gdatu_to(4)
      IMPORTING
        output = lv_gdatu_to.

    DATA(lv_cont_reg) = 0.
    DATA lv_ukurs_soma TYPE tcurr-ukurs.
    SELECT ukurs
      FROM tcurr
     WHERE kurst = @cc_kurst
       AND fcurr = @cc_fcurr
       AND tcurr = @cc_tcurr
       AND gdatu BETWEEN @lv_gdatu_to AND @lv_gdatu_from
      INTO @DATA(lv_ukurs).
      ADD lv_ukurs TO lv_ukurs_soma.
      ADD 1 TO lv_cont_reg.
    ENDSELECT.

    IF sy-subrc = 0.

      DATA lv_ukurs_char TYPE char18.

      lv_ukurs_char = lv_ukurs_soma / lv_cont_reg.
      CONDENSE lv_ukurs_char NO-GAPS.
      SPLIT lv_ukurs_char AT '.' INTO DATA(lv_int_part) DATA(lv_dec_part).
      lv_ukurs_char = lv_int_part && '.' && lv_dec_part(2).
      rv_ukurs = lv_ukurs_char.
      "rv_ukurs = lv_ukurs_soma / lv_cont_reg.
      "rv_ukurs = trunc( rv_ukurs ). "discard decimal part and get just integer part
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>SEL_KNVV_PIX_CHINA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        KNVV-KUNNR
* | [--->] IV_VKORG                       TYPE        KNVV-VKORG
* | [--->] IV_VTWEG                       TYPE        KNVV-VTWEG
* | [--->] IV_SPART                       TYPE        KNVV-SPART
* | [<---] EV_KVGR3                       TYPE        KNVV-KVGR3
* | [<---] EV_KONDA                       TYPE        KNVV-KONDA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD SEL_KNVV_PIX_CHINA.

    CLEAR: ev_kvgr3, ev_konda.

    SELECT SINGLE kvgr3, konda
      FROM knvv
     WHERE kunnr = @iv_kunnr
       AND vkorg = @iv_vkorg
       AND vtweg = @iv_vtweg
       AND spart = @iv_spart
      INTO (@ev_kvgr3, @ev_konda).

    IF sy-subrc <> 0.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_EXIT_COND_PRECO_COMPOSTO=>SEL_KNVV_PIX_EUROPA
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_KUNNR                       TYPE        KNVV-KUNNR
* | [--->] IV_VKORG                       TYPE        KNVV-VKORG
* | [--->] IV_VTWEG                       TYPE        KNVV-VTWEG
* | [--->] IV_SPART                       TYPE        KNVV-SPART
* | [<---] EV_KVGR2                       TYPE        KNVV-KVGR2
* | [<---] EV_KONDA                       TYPE        KNVV-KONDA
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD sel_knvv_pix_europa.

    CLEAR: ev_kvgr2, ev_konda.

    SELECT SINGLE kvgr2, konda
      FROM knvv
     WHERE kunnr = @iv_kunnr
       AND vkorg = @iv_vkorg
       AND vtweg = @iv_vtweg
       AND spart = @iv_spart
      INTO (@ev_kvgr2, @ev_konda).

    IF sy-subrc <> 0.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
