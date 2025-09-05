# Loop Group By
- It is a LOOP grouped, new ABAP 7.4.
- It works as older versions of:
  - AT FIRST
  - AT LAST
  - Etc

## Example, works very well for grouped fields (gkey)

       LOOP AT lt_ct_aux into ls_capac_ct
           GROUP BY ( centro = ls_capac_ct-centro
                      cent_trb = ls_capac_ct-cent_trb
                      valido_desde = ls_capac_ct-valido_desde ) ASCENDING
           REFERENCE INTO DATA(gref).

          " Aqui entra UMA vez por par (centro, cent_trb, valido_desde)
          " Você pode pegar a chave do grupo:
          DATA(gkey) = gref->*.

          " ...faça lock, leituras base, buffers etc. para o grupo...
          FREE: it_kapa.
          
          " Enqueue
          CALL FUNCTION 'ENQUEUE_ECARPL'
            EXPORTING
              arbpl        = GKEY-cent_trb
              werks        = GKEY-centro
            EXCEPTIONS
              foreign_lock = 01.
          CASE sy-subrc.
            WHEN 0.

            WHEN 1.
              e_user   = sy-msgv1.
              e_enq_id = '4'.

              MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
               INTO is_returnct-message.
              EXIT. "EXIT from ENTIRE main loop
          ENDCASE.

          " Se precisar iterar as linhas do grupo:
          LOOP AT GROUP gref INTO ls_capac_ct.
            " processa cada linha do (centro, cent_trb) atual
            CLEAR: ls_kapa,
                   ls_kazy.

            "-------Tratando datas
            REPLACE ALL   OCCURRENCES OF '-' IN ls_capac_ct-valido_ate WITH ''.
            REPLACE ALL   OCCURRENCES OF '-' IN ls_capac_ct-valido_desde WITH ''.

            "--------------------- Preenchimento Kapa ---------"   Inicio
            ls_kapa-kapid  = ls_crca-kapid.
            ls_kapa-schnr  = ls_capac_ct-def_turno. "  Turno
            ls_kapa-ngrad  = ls_capac_ct-grau_utilizacao ." capac %
            ls_kapa-anzhl  = ls_capac_ct-nm_cap_indiv ."cap de pessoas
            lv_anzhl = ls_capac_ct-nm_cap_indiv.
            ls_kapa-datub  = ls_capac_ct-valido_ate.  "data fim
            ls_kapa-versn  = lv_versn.
            ls_kapa-tagnr  = ls_capac_ct-dia(1).

            " Convert into seconds
            CALL METHOD me->convert_time_into_seconds
              EXPORTING
                iv_hora_inicio   = conv #( ls_capac_ct-hora_inicio )
                iv_hora_fim      = conv #( ls_capac_ct-hora_fim )
                iv_dur_intervalo = conv #( ls_capac_ct-dur_intervalo )
              IMPORTING
                ev_begzt         = ls_kapa-begzt
                ev_endzt         = ls_kapa-endzt
                ev_pause         = ls_kapa-pause.

            CALL METHOD me->calculo_capacidade
              EXPORTING
                iv_begzt = ls_kapa-begzt
                iv_endzt = ls_kapa-endzt
                iv_pause = ls_kapa-pause
                iv_anzhl = lv_anzhl
                iv_ngrad = ls_capac_ct-grau_utilizacao
              CHANGING
                cv_einzt = ls_kapa-einzt
                cv_kapaz = ls_kapa-kapaz.

            APPEND ls_kapa TO it_kapa.
            "--------------------- Preenchimento Kapa ---------"   Fim

          ENDLOOP.

          " Select infinite line, just to have default values to kazy.
          SELECT single * INTO @data(ls_kazy_infinite)
           FROM kazy
          WHERE datub = '99991231'
            AND kapid = @ls_crca-kapid.
          IF sy-subrc = 0.

            MOVE-CORRESPONDING ls_kazy_infinite TO ls_kazy.
            ls_kazy-datub = ls_kapa-datub.
            ls_kazy-kkopf = space.

            " Modify data
            MODIFY kazy FROM ls_kazy.
            IF sy-subrc = 0.
              MODIFY kapa FROM TABLE it_kapa.
              IF sy-subrc IS INITIAL.
                COMMIT WORK AND WAIT.
                CALL FUNCTION 'DEQUEUE_ECARPL'
                  EXPORTING
                     arbpl        = GKEY-cent_trb
                     werks        = GKEY-centro.
              ELSE.
                "ERRO
                ROLLBACK WORK.
                lv_subrc = 4.
                MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                   WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
                   INTO is_returnct-message.
                is_returnct-type = 'E'.
                APPEND is_returnct TO ls_capacidade_return-messages.
                EXIT. " exit from MAIN LOOP
              ENDIF.
            ELSE.
              "ERRO
              ROLLBACK WORK.
              lv_subrc = 4.
              MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
                 INTO is_returnct-message.
              is_returnct-type = 'E'.
              APPEND is_returnct TO ls_capacidade_return-messages.
              EXIT. " exit from current ct in loop
            ENDIF.
          ENDIF.

        ENDLOOP.
