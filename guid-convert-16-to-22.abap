        CALL FUNCTION '/SCMB/MDL_GUID_CONVERT'
          EXPORTING
            iv_guid16 = el_aqua-matid
          IMPORTING
            ev_guid22 = el_matkey-matid.
