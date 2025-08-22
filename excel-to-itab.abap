    DATA: is_returnct       TYPE bapiret2,
          is_returnkapa     TYPE bapiret2,
          is_returnkazy     TYPE bapiret2,
          erro              TYPE REF TO cx_root,
          it_returnct       TYPE TABLE OF bapiret2,
          ls_capacity       TYPE ty_capacidade_ct,
          ls_kapa           TYPE kapa,
          lv_anzhl          TYPE kapanzahl,
          ls_kapa_aux       TYPE kapa,
          e_enq_id          TYPE c,
          e_user            TYPE syuname,
          it_kapa           TYPE TABLE OF kapa,
          lt_kapa_aux       TYPE TABLE OF kapa,
          ls_kazy           TYPE kazy,
          ls_kazy_aux       TYPE kazy,
          it_kazy           TYPE TABLE OF kazy,
          it_capacidade_ct  TYPE ty_capacidade_ct,
          lv_arbid          TYPE cr_objid,
          lv_kapid          TYPE kapid,
          lv_subrc          TYPE sysubrc,
          lv_valido_ate     TYPE datub,
          lv_valido_inicial TYPE datuv,
          lv_valido_desde   TYPE datuv,
          lv_dia_sm         TYPE kapa-tagnr,
          lv_turnodf        TYPE kapa-schnr,
          lv_dia            TYPE i,
          tcrca             TYPE TABLE OF crca,
          lv_arktx          TYPE arktx,
          prev_datub        TYPE kazy-datub,
          lv_seconds_begzt  TYPE kapa-begzt,
          lv_seconds_endzt  TYPE kapa-endzt,
          lv_total          TYPE string,
          lv_cont_ok        TYPE string,
          lv_cont           TYPE string.

    DATA: ls_capacidade_return TYPE ty_capacidade_ct.
    DATA: lv_campo_vazio TYPE string.
    io_data_provider->read_entry_data( IMPORTING es_data = ls_capacity ).

    it_capacidade_ct = ls_capacity.

    DATA: lo_excel   TYPE REF TO cl_fdt_xl_spreadsheet,
          lt_data    TYPE REF TO data,
          lv_xstring TYPE xstring.

    " Passo 2: Decodificar o conteúdo base64
    CALL FUNCTION 'SCMS_BASE64_DECODE_STR'
      EXPORTING
        input  = it_capacidade_ct-arquivo
      IMPORTING
        output = lv_xstring.

    TRY.
        CREATE OBJECT lo_excel
          EXPORTING
            document_name = 'TemplateCapacidade'
            xdocument     = lv_xstring.

        CALL METHOD lo_excel->if_fdt_doc_spreadsheet~get_itab_from_worksheet
          EXPORTING
            worksheet_name = 'template-planilha-ajuste-capaci'
          RECEIVING
            itab           = lt_data.

      CATCH cx_root INTO erro.

        is_returnct-message = TEXT-063.
        is_returnct-type = 'E'.
        APPEND is_returnct TO ls_capacidade_return-messages.

        is_returnct-message = TEXT-064.
        is_returnct-type = 'E'.
        APPEND is_returnct TO ls_capacidade_return-messages.

        er_result = ls_capacidade_return.
        EXIT.
    ENDTRY.



    FIELD-SYMBOLS: <gt_data> TYPE table,
                   <row>     TYPE any,
                   <fs_1>    TYPE any,
                   <fs_2>    TYPE any,
                   <fs_3>    TYPE any,
                   <fs_4>    TYPE any,
                   <fs_5>    TYPE any,
                   <fs_6>    TYPE any,
                   <fs_7>    TYPE any,
                   <fs_8>    TYPE any,
                   <fs_9>    TYPE any,
                   <fs_10>   TYPE any,
                   <fs_11>   TYPE any.


    ASSIGN lt_data->* TO <gt_data>.
    DATA: ls_capac_ct TYPE zovspm_capac_ct_programacao.
    DATA: lt_ct_aux TYPE TABLE OF zovspm_capac_ct_programacao.

    DELETE <gt_data> INDEX 1. "remove cabeçalho

    DESCRIBE TABLE <gt_data> LINES lv_total.

    CLEAR: erro_ct   ,   erro_cent .
    IF  lv_total = 0.
      is_returnct-message = TEXT-060.
      is_returnct-type = 'E'.
      APPEND is_returnct TO  ls_capacidade_return-messages.
    ELSE.
      LOOP AT <gt_data> ASSIGNING <row>.

        ASSIGN COMPONENT 1 OF STRUCTURE <row> TO <fs_1>.
        ASSIGN COMPONENT 2 OF STRUCTURE <row> TO <fs_2>.
        ASSIGN COMPONENT 3 OF STRUCTURE <row> TO <fs_3>.
        ASSIGN COMPONENT 4 OF STRUCTURE <row> TO <fs_4>.
        ASSIGN COMPONENT 5 OF STRUCTURE <row> TO <fs_5>.
        ASSIGN COMPONENT 6 OF STRUCTURE <row> TO <fs_6>.
        ASSIGN COMPONENT 7 OF STRUCTURE <row> TO <fs_7>.
        ASSIGN COMPONENT 8 OF STRUCTURE <row> TO <fs_8>.
        ASSIGN COMPONENT 9 OF STRUCTURE <row> TO <fs_9>.
        ASSIGN COMPONENT 10 OF STRUCTURE <row> TO <fs_10>.
        ASSIGN COMPONENT 11 OF STRUCTURE <row> TO <fs_11>.

        CONDENSE <fs_7> NO-GAPS.
        CONDENSE <fs_8> NO-GAPS.
        CONDENSE <fs_9> NO-GAPS.


        MOVE <fs_1>  TO ls_capac_ct-centro.
        MOVE <fs_2>  TO ls_capac_ct-cent_trb.
        MOVE <fs_3>  TO ls_capac_ct-valido_desde.
        MOVE <fs_4>  TO ls_capac_ct-valido_ate.
        MOVE <fs_5>  TO ls_capac_ct-dia.
        MOVE <fs_6>  TO ls_capac_ct-def_turno.
        MOVE <fs_7>  TO ls_capac_ct-hora_inicio.
        MOVE <fs_8>  TO ls_capac_ct-hora_fim.
        MOVE <fs_9>  TO ls_capac_ct-dur_intervalo.
        MOVE <fs_10> TO ls_capac_ct-grau_utilizacao.
        MOVE <fs_11> TO ls_capac_ct-nm_cap_indiv.

*        IF erro_ct   = ls_capac_ct-cent_trb AND
*         erro_cent = ls_capac_ct-centro.
*          CONTINUE.
*        ENDIF.

        "Verificação se algum campo do XLs está vazio.
        IF ls_capac_ct-centro IS INITIAL AND
       ls_capac_ct-cent_trb      IS INITIAL AND
       ls_capac_ct-valido_desde  IS INITIAL AND
       ls_capac_ct-valido_ate    IS INITIAL AND
       ls_capac_ct-dia           IS INITIAL AND
       ls_capac_ct-def_turno     IS INITIAL AND
       ls_capac_ct-hora_inicio   IS INITIAL AND
       ls_capac_ct-hora_fim      IS INITIAL AND
       ls_capac_ct-dur_intervalo IS INITIAL AND
       ls_capac_ct-grau_utilizacao IS INITIAL AND
       ls_capac_ct-nm_cap_indiv = ''.

          lv_total = lv_total - 1.
          DELETE <gt_data> INDEX sy-tabix.
          CONTINUE.
        ELSEIF ls_capac_ct-centro IS INITIAL.
          lv_campo_vazio = TEXT-046.
        ELSEIF ls_capac_ct-cent_trb IS INITIAL.
          lv_campo_vazio = TEXT-038.
        ELSEIF ls_capac_ct-valido_desde IS INITIAL.
          lv_campo_vazio = TEXT-047.
        ELSEIF ls_capac_ct-valido_ate IS INITIAL.
          lv_campo_vazio = TEXT-048.
        ELSEIF ls_capac_ct-dia IS INITIAL.
          lv_campo_vazio = TEXT-049.
        ELSEIF ls_capac_ct-def_turno IS INITIAL.
          lv_campo_vazio = TEXT-050.
        ELSEIF ls_capac_ct-hora_inicio IS INITIAL.
          lv_campo_vazio = TEXT-051.
        ELSEIF ls_capac_ct-hora_fim IS INITIAL.
          lv_campo_vazio = TEXT-052.
        ELSEIF ls_capac_ct-dur_intervalo IS INITIAL.
          lv_campo_vazio = TEXT-053.
        ELSEIF ls_capac_ct-grau_utilizacao IS INITIAL.
          lv_campo_vazio = TEXT-054.
        ELSEIF ls_capac_ct-nm_cap_indiv = ''.
          lv_campo_vazio = TEXT-055.

        ELSE.
          lv_campo_vazio = ''.

        ENDIF.
        CLEAR erro_ct.
        IF lv_campo_vazio IS NOT INITIAL.
          erro_ct    = abap_true.
          CONCATENATE TEXT-056 ls_capac_ct-cent_trb TEXT-057  ls_capac_ct-cent_trb ',' TEXT-034 lv_campo_vazio TEXT-035 INTO is_returnct-message SEPARATED BY space.
          is_returnct-type = 'E'.

          APPEND is_returnct TO ls_capacidade_return-messages.

          CONTINUE.
        ELSE.

          
        ENDIF.
        CLEAR ls_capac_ct.
      ENDLOOP.
    ENDIF.
