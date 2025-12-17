# VOFM
## Menu Fórmulas, Valor da Condição
- Choose some formula 800 or 900, which is deactivated.  
- Activate it and tell the functional which number of formula it is.
- Code it
- Example


    
      DATA(lo_preco_comp) = NEW zcl_exit_cond_preco_composto( ).
      
      IF lo_preco_comp IS BOUND AND lo_preco_comp->is_active( ).
    
      DATA:
        lv_kvgr2_pix_europa TYPE knvv-kvgr2,
        lv_kvgr3_pix_china  TYPE knvv-kvgr3,
        lv_konda_pix_europa TYPE knvv-konda,
        lv_konda_pix_china  TYPE knvv-konda.
    
      CONSTANTS:
        lc_kunnr TYPE char30 VALUE '(SAPMV45A)XVBAK-KUNNR',
        lc_spart TYPE char30 VALUE '(SAPMV45A)XVBAK-SPART',
        lc_vkorg TYPE char30 VALUE '(SAPMV45A)XVBAK-VKORG',
        lc_vtweg TYPE char30 VALUE '(SAPMV45A)XVBAK-VTWEG',
        lc_kschl TYPE char30 VALUE 'XKOMV-KSCHL'.
    
      FIELD-SYMBOLS:
        <fs_kunnr> TYPE vbak-kunnr,
        <fs_spart> TYPE vbak-spart,
        <fs_vkorg> TYPE vbak-vkorg,
        <fs_vtweg> TYPE vbak-vtweg,
        <fs_kschl> TYPE komv-kschl.
    
      ASSIGN (lc_kunnr) TO <fs_kunnr>.
      ASSIGN (lc_spart) TO <fs_spart>.
      ASSIGN (lc_vkorg) TO <fs_vkorg>.
      ASSIGN (lc_vtweg) TO <fs_vtweg>.
      ASSIGN (lc_kschl) TO <fs_kschl>.
    
      "EF 1.1
      IF <fs_kunnr> IS ASSIGNED AND
         <fs_spart> IS ASSIGNED AND
         <fs_kschl> IS ASSIGNED AND
         lo_preco_comp->check_cond_pix_europe( <fs_kschl> ).
  
      lo_preco_comp->sel_knvv_pix_europa(
        EXPORTING
          iv_kunnr = <fs_kunnr>
          iv_vkorg = <fs_vkorg>
          iv_vtweg = <fs_vtweg>
          iv_spart = <fs_spart>
        IMPORTING
          ev_kvgr2 = lv_kvgr2_pix_europa
          ev_konda = lv_konda_pix_europa
      ).
  
  
      "--------------------------------
      " EUROPA
      "--------------------------------
      CASE lv_kvgr2_pix_europa.

      WHEN '300'.

        "Igual a 300 – Selecionar o último PIX do mês anterior, cadastrado na tabela A508, condição Z3P1
        DATA lv_kbetr_pix_eur_300 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_300 TYPE sap_bool.
        lo_preco_comp->calc_pix_eur_300(
          EXPORTING
            iv_kunnr = <fs_kunnr>       " Emissor da ordem
            iv_vkorg = <fs_vkorg>       " Organização de vendas
            iv_vtweg = <fs_vtweg>       " Canal de distribuição
            iv_spart = <fs_spart>       " Setor de atividade
            iv_konda = lv_konda_pix_europa  " Grupo de preço do cliente
            iv_kschl = <fs_kschl>
          IMPORTING
            ev_kbetr               = lv_kbetr_pix_eur_300
            ev_has_curr_convertion = lv_has_curr_convertion_300
        ).

        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_300 IS NOT INITIAL THEN lv_kbetr_pix_eur_300 ).

        IF lv_has_curr_convertion_300 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '301'.

        "calc. média kbetr pix eur 301
        DATA lv_kbetr_pix_eur_301 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_301 TYPE sap_bool.
        lo_preco_comp->calc_pix_eur_301(
        EXPORTING
          iv_kunnr = <fs_kunnr>       " Emissor da ordem
          iv_vkorg = <fs_vkorg>       " Organização de vendas
          iv_vtweg = <fs_vtweg>       " Canal de distribuição
          iv_spart = <fs_spart>       " Setor de atividade
          iv_konda = lv_konda_pix_europa  " Grupo de preço do cliente
          iv_kschl = <fs_kschl>
        IMPORTING
          ev_kbetr               = lv_kbetr_pix_eur_301
          ev_has_curr_convertion = lv_has_curr_convertion_301
        ).

        "Mover o valor da média calculada para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1.
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_301 IS NOT INITIAL THEN lv_kbetr_pix_eur_301 ).

        IF lv_has_curr_convertion_301 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '302'.

        "Igual a 302 – Selecionar o último pix do mês corrente, cadastrado na tabela a508, condição z3p1.
        DATA lv_kbetr_pix_eur_302 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_302 TYPE sap_bool.
        lo_preco_comp->calc_pix_eur_302(
          EXPORTING
            iv_kunnr = <fs_kunnr>       " Emissor da ordem
            iv_vkorg = <fs_vkorg>       " Organização de vendas
            iv_vtweg = <fs_vtweg>       " Canal de distribuição
            iv_spart = <fs_spart>       " Setor de atividade
            iv_konda = lv_konda_pix_europa  " Grupo de preço do cliente
            iv_kschl = <fs_kschl>
          IMPORTING
            ev_kbetr               = lv_kbetr_pix_eur_302
            ev_has_curr_convertion = lv_has_curr_convertion_302
          ).

        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_302 IS NOT INITIAL THEN lv_kbetr_pix_eur_302 ).

        IF lv_has_curr_convertion_302 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '303'.

        "Igual a 303 – Calcular a média do PIX do mês corrente, cadastrado na tabela A508, condição Z3P1
        DATA lv_kbetr_pix_eur_303 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_303 TYPE sap_bool.
        lo_preco_comp->calc_pix_eur_303(
          EXPORTING
           iv_kunnr = <fs_kunnr>       " Emissor da ordem
           iv_vkorg = <fs_vkorg>       " Organização de vendas
           iv_vtweg = <fs_vtweg>       " Canal de distribuição
           iv_spart = <fs_spart>       " Setor de atividade
           iv_konda = lv_konda_pix_europa  " Grupo de preço do cliente
           iv_kschl = <fs_kschl>
         IMPORTING
           ev_kbetr               = lv_kbetr_pix_eur_303
           ev_has_curr_convertion = lv_has_curr_convertion_303
          ).

        "Mover o valor da média calculada para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1.
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_303 IS NOT INITIAL THEN lv_kbetr_pix_eur_303 ).

        IF lv_has_curr_convertion_303 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '316'.
        "Igual a 316 – Selecionar o penúltimo PIX do mês anterior, cadastrado na tabela A508, condição Z3P1
        DATA lv_kbetr_pix_eur_316 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_316 TYPE sap_bool.
        lo_preco_comp->calc_pix_eur_316(
         EXPORTING
           iv_kunnr = <fs_kunnr>       " Emissor da ordem
           iv_vkorg = <fs_vkorg>       " Organização de vendas
           iv_vtweg = <fs_vtweg>       " Canal de distribuição
           iv_spart = <fs_spart>       " Setor de atividade
           iv_konda = lv_konda_pix_europa  " Grupo de preço do cliente
           iv_kschl = <fs_kschl>
         IMPORTING
           ev_kbetr               = lv_kbetr_pix_eur_316
           ev_has_curr_convertion = lv_has_curr_convertion_316
          ).

        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_316 IS NOT INITIAL THEN lv_kbetr_pix_eur_316 ).

        IF lv_has_curr_convertion_316 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

    ENDCASE.
  ENDIF."EF 1.1

  "--------------------------------
  " CHINA
  "--------------------------------
  "EF 1.2
  IF <fs_kunnr> IS ASSIGNED AND
     <fs_spart> IS ASSIGNED AND
     <fs_kschl> IS ASSIGNED AND
     lo_preco_comp->check_cond_pix_china( <fs_kschl> ).

    lo_preco_comp->sel_knvv_pix_china(
      EXPORTING
        iv_kunnr = <fs_kunnr>
        iv_vkorg = <fs_vkorg>
        iv_vtweg = <fs_vtweg>
        iv_spart = <fs_spart>
      IMPORTING
        ev_kvgr3 = lv_kvgr3_pix_china
        ev_konda = lv_konda_pix_china
    ).

    "--------------------------------
    " CHINA
    "--------------------------------
    CASE lv_kvgr3_pix_china.

      WHEN '304'.
        "Igual a 304 – Selecionar o último PIX do mês anterior, cadastrado na tabela A508, condição Z3P8
        DATA lv_kbetr_pix_eur_304 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_304 TYPE sap_bool.
        lo_preco_comp->calc_pix_china_304(
          EXPORTING
            iv_kunnr = <fs_kunnr>       " Emissor da ordem
            iv_vkorg = <fs_vkorg>       " Organização de vendas
            iv_vtweg = <fs_vtweg>       " Canal de distribuição
            iv_spart = <fs_spart>       " Setor de atividade
            iv_konda = lv_konda_pix_china  " Grupo de preço do cliente
            iv_kschl = <fs_kschl>
         IMPORTING
           ev_kbetr               = lv_kbetr_pix_eur_304
           ev_has_curr_convertion = lv_has_curr_convertion_304
          ).

        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_304 IS NOT INITIAL THEN lv_kbetr_pix_eur_304 ).

        IF lv_has_curr_convertion_304 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '305'.

        "Igual a 305 – Calcular a média do PIX do mês anterior, cadastrado na tabela A508, condição Z3P8
        DATA lv_kbetr_pix_eur_305 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_305 TYPE sap_bool.
        lo_preco_comp->calc_pix_china_305(
          EXPORTING
            iv_kunnr = <fs_kunnr>       " Emissor da ordem
            iv_vkorg = <fs_vkorg>       " Organização de vendas
            iv_vtweg = <fs_vtweg>       " Canal de distribuição
            iv_spart = <fs_spart>       " Setor de atividade
            iv_konda = lv_konda_pix_china  " Grupo de preço do cliente
            iv_kschl = <fs_kschl>
          IMPORTING
           ev_kbetr               = lv_kbetr_pix_eur_305
           ev_has_curr_convertion = lv_has_curr_convertion_305
          ).

        "Mover o valor da média calculada para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1.
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_305 IS NOT INITIAL THEN lv_kbetr_pix_eur_305 ).

        IF lv_has_curr_convertion_305 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

      WHEN '306'.
        "Igual a 306 – Selecionar o penúltimo PIX do mês anterior, cadastrado na tabela A508, condição Z3P8
        DATA lv_kbetr_pix_eur_306 TYPE komv-kbetr.
        DATA lv_has_curr_convertion_306 TYPE sap_bool.
        lo_preco_comp->calc_pix_china_306(
          exporting
            iv_kunnr = <fs_kunnr>       " Emissor da ordem
            iv_vkorg = <fs_vkorg>       " Organização de vendas
            iv_vtweg = <fs_vtweg>       " Canal de distribuição
            iv_spart = <fs_spart>       " Setor de atividade
            iv_konda = lv_konda_pix_china  " Grupo de preço do cliente
            iv_kschl = <fs_kschl>
          IMPORTING
           ev_kbetr               = lv_kbetr_pix_eur_306
           ev_has_curr_convertion = lv_has_curr_convertion_306
          ).
        "Mover o valor de KONP-KBETR para PRCD_ELEMENTS-KBETR quando PRCD_ELEMENTS-KSCHL for igual a Z3P1
        xkomv-kbetr = COND kbetr( WHEN lv_kbetr_pix_eur_306 IS NOT INITIAL THEN lv_kbetr_pix_eur_306 ).
        
        IF lv_has_curr_convertion_306 = abap_true.
          xkomv-kkurs = '1.00000'.
        ENDIF.

    ENDCASE.
  ENDIF."EF 1.2
ENDIF. "EXIT active
