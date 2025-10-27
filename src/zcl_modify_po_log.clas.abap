CLASS zcl_modify_po_log DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MODIFY_PO_LOG IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DELETE FROM ztb_po_log.
    COMMIT WORK.

    DELETE FROM ztb_po_log_item.
    COMMIT WORK.

    DELETE FROM ztb_po_log_d.
    COMMIT WORK.


    out->write( 'Delete successfully!' ).

  ENDMETHOD.
ENDCLASS.
