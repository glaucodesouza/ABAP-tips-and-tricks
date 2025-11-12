FORM zf_exportar_excel .

" This form reads selected lines from ALV GRID
" This selected lines has Nota Fiscal data which user want to generate excel file.
  DATA(lo_selections) = v_faturamento->get_selections( ).
  DATA(lt_rows)       = lo_selections->get_selected_rows( ).

  " HERE internal table t_excel_envio_fin is build
  " it has name envio but it is only to save an EXCEL
  REFRESH: t_excel_envio_fin.
  LOOP AT lt_rows into data(ls_rows).
    PERFORM zf_exibe_subitens USING ls_rows.
    APPEND LINES OF t_excel_envio TO t_excel_envio_fin.
  ENDLOOP.

  IF t_excel_envio_fin IS INITIAL.
    MESSAGE s398(00) WITH TEXT-019 DISPLAY LIKE c_e.
    v_erro = c_x.
    RETURN.
  ENDIF.

  " GERAR o excel
  DATA: lv_path     TYPE string,
        lv_filename TYPE string,
        lv_fullpath TYPE string.

  DATA: lt_csv  TYPE STANDARD TABLE OF string,
        lv_line TYPE string.

  "Solicita ao usuário o diretório
  CALL METHOD cl_gui_frontend_services=>directory_browse
    CHANGING
      selected_folder = lv_path
    EXCEPTIONS
      OTHERS          = 1.

  IF sy-subrc = 0 AND lv_path IS NOT INITIAL.

    " Adiciona cabeçalho
    lv_line = 'Material'(065) && cl_abap_char_utilities=>horizontal_tab &&
              'Nfe de Formação de Lote'(066) && cl_abap_char_utilities=>horizontal_tab &&
              'Série – Nfe Form Lote'(067) && cl_abap_char_utilities=>horizontal_tab &&
              'Chave Nfe Formação Lote'(068) && cl_abap_char_utilities=>horizontal_tab &&
              'Data Em - Cent. Recebi'(069) && cl_abap_char_utilities=>horizontal_tab &&
              'Qtd. Documento Débito'(070) && cl_abap_char_utilities=>horizontal_tab &&
              'N° Nfe Retorno'(071) && cl_abap_char_utilities=>horizontal_tab &&
              'Valor Unitário Nfe Retorno'(072) && cl_abap_char_utilities=>horizontal_tab &&
              'Chave de acesso Nfe Retorno'(073).
    APPEND lv_line TO lt_csv.

    "gerar tab. final
    CLEAR lv_line.
    LOOP AT t_excel_envio_fin INTO DATA(ls_excel).

      DATA(lv_matnr)           = CONV string( ls_excel-matnr ).
      DATA(lv_data_form_lote)  = CONV string( ls_excel-data_form_lote ).
      DATA(lv_series_s)        = CONV string( ls_excel-series_s ).
      DATA(lv_acckey_s)        = |`{ CONV string( ls_excel-acckey_s ) }|.
      DATA(lv_data_e)          = CONV string( ls_excel-data_e ).
      DATA(lv_menge_deb)       = CONV string( ls_excel-menge_deb ).
      DATA(lv_nfenum_retsimb)  = CONV string( ls_excel-nfenum_retsimb ).
      DATA(lv_netwr)           = CONV string( ls_excel-netwr ).
      DATA(lv_acckey_retsimb)  = CONV string( ls_excel-acckey_retsimb ).

      CONCATENATE
        lv_matnr
        lv_data_form_lote
        lv_series_s
        lv_acckey_s
        lv_data_e
        lv_menge_deb
        lv_nfenum_retsimb
        lv_netwr
        lv_acckey_retsimb
        INTO lv_line SEPARATED BY cl_abap_char_utilities=>horizontal_tab.
      APPEND lv_line TO lt_csv.
    ENDLOOP.

    lv_filename = 'nacionalizacao_' && sy-datum && '_' && sy-uzeit && '.XLS'.
    CONCATENATE lv_path lv_filename INTO lv_fullpath SEPARATED BY '\'.

    "It saves an EXCELas CSV format
    " Cause I do not know yet how to save PURE EXCEL.
    " but it opens correctly if you click YES popup when EXCEL opens.
    CALL FUNCTION 'GUI_DOWNLOAD'
      EXPORTING
        filename              = lv_fullpath
        filetype              = 'ASC'
        write_field_separator = 'X'
      TABLES
        data_tab              = lt_csv
      EXCEPTIONS
        OTHERS                = 1.

    IF sy-subrc = 0.
      MESSAGE 'Arquivo gerado com sucesso!'(080) TYPE 'S'.
    ELSE.
      MESSAGE 'Erro ao gerar arquivo.'(081) TYPE 'E'.
    ENDIF.

  ELSE.
    MESSAGE 'Diretório não selecionado.'(082) TYPE 'W'.
  ENDIF.

ENDFORM.
