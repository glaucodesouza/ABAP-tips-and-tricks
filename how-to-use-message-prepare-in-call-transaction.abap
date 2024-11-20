parameter of method:
  CT_MSG	TYPE BAPIRET2_T



DATA: vl_msg(300)        TYPE c,
          vl_msgv1(50)       TYPE c,
          vl_msgv2(50)       TYPE c,
          vl_msgv3(50)       TYPE c,
          vl_msgv4(50)       TYPE c,
          vl_msgnr           TYPE bdc_mnr,
          vl_msgid           TYPE bdc_mid,
          t_msg              TYPE tab_bdcmsgcoll,
          vl_background_mode TYPE c VALUE 'N' ##NO_TEXT,
          vl_update          TYPE c VALUE 'S' ##NO_TEXT.


TRY.
          CALL TRANSACTION 'CO02' USING  t_bdc[]         "#EC CI_CALLTA
                                  MODE   vl_background_mode
                                  UPDATE vl_update
                                  MESSAGES INTO t_msg[].

          IF sy-subrc IS NOT INITIAL.
            """ translate lt_msg (tab_bdcmsgcoll) to ct_msg (bapiret2_t)
            lt_msg = VALUE #( BASE ct_msg
                              FOR <fs_msg> IN t_msg ( type       = <fs_msg>-msgtyp
                                                      id         = <fs_msg>-msgid
                                                      number     = <fs_msg>-dynumb
                                                      message    = <fs_msg>-msgnr
                                                      log_no     = <fs_msg>-dyname
                                                      message_v1 = <fs_msg>-msgv1
                                                      message_v2 = <fs_msg>-msgv2
                                                      message_v3 = <fs_msg>-msgv3
                                                      message_v4 = <fs_msg>-msgv4
                                                      parameter  = <fs_msg>-env
                                                      field      = <fs_msg>-fldname
                                                      system     = <fs_msg>-tcode ) ).

            LOOP AT lt_msg ASSIGNING FIELD-SYMBOL(<fs_msg_prepare>).
              vl_msgid  = <fs_msg_prepare>-id.
              vl_msgnr  = <fs_msg_prepare>-message.
              vl_msgv1  = <fs_msg_prepare>-message_v1.
              vl_msgv2  = <fs_msg_prepare>-message_v2.
              vl_msgv3  = <fs_msg_prepare>-message_v3.
              vl_msgv4  = <fs_msg_prepare>-message_v4.

              CALL FUNCTION 'MESSAGE_PREPARE'
                EXPORTING
                  language               = sy-langu
                  msg_id                 = vl_msgid
                  msg_no                 = vl_msgnr
                  msg_var1               = vl_msgv1
                  msg_var2               = vl_msgv2
                  msg_var3               = vl_msgv3
                  msg_var4               = vl_msgv4
                IMPORTING
                  msg_text               = vl_msg
                EXCEPTIONS
                  function_not_completed = 1
                  message_not_found      = 2
                  OTHERS                 = 3.

              <fs_msg_prepare>-message = vl_msg.
            ENDLOOP.
          ENDIF.
        CATCH cx_sy_send_dynpro_no_receiver INTO DATA(err).
      ENDTRY.
    ENDIF.
