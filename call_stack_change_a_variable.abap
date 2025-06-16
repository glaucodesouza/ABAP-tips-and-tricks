*Reason: Update Reqmt Date (BDTER) in order to consider the current    *
*        date.                                                         *
*&---------------------------------------------------------------------*

FIELD-SYMBOLS: <fs_resb>   TYPE STANDARD TABLE,
               <fs_w_resb> TYPE resbb.

DATA: callstack    TYPE abap_callstack,
      et_callstack TYPE sys_callst.

CONSTANTS: c_proxyname TYPE SYREPID VALUE 'ZCL_MATERIAL'.

CALL FUNCTION 'SYSTEM_CALLSTACK'
  EXPORTING
    max_level    = 30
  IMPORTING
    callstack    = callstack
    et_callstack = et_callstack.

IF callstack IS NOT INITIAL.
  SORT: callstack BY mainprogram.
  READ TABLE callstack TRANSPORTING NO FIELDS WITH KEY mainprogram = c_proxyname BINARY SEARCH.
  IF sy-subrc IS INITIAL.

*Assigning data from resb_bt internal table from SAPLCOBT program
    ASSIGN ('(SAPLCOBT)RESB_BT[]') TO <fs_resb>.

    IF <fs_resb> IS ASSIGNED.
*  Getting the total register number from resb_bt table
      DATA(l_line) = lines( <fs_resb> ).                                                         "$smart: #164
      IF l_line GT 0.
*  Check the last line
        LOOP AT <fs_resb> ASSIGNING <fs_w_resb> FROM l_line.
          IF <fs_w_resb>-bdter NE sy-datum.
*  Update the bdter field with the current date to the last register line
            <fs_w_resb>-bdter = sy-datum.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDIF.
  ENDIF.
ENDIF.
