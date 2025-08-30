*&---------------------------------------------------------------------*
*& Report zaks_mad_alv_ida_1cc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaks_mad_alv_ida_1cc.

PARAMETERS: pr_m_grp TYPE matkl.
DATA : lv_slt TYPE matnr.
SELECT-OPTIONS: s_matnr FOR lv_slt.

DATA : lo_alv       TYPE REF TO if_salv_gui_table_ida,
       lo_container TYPE REF TO cl_gui_custom_container.

START-OF-SELECTION.
  CALL SCREEN 0100.


MODULE status_0100 OUTPUT.
  SET TITLEBAR 'Material Analytics Dashboard -- ALV IDA'.

  CREATE OBJECT lo_container
    EXPORTING
      container_name = 'CUST1'.

  TRY.
      cl_salv_gui_table_ida=>create_for_cds_view(
              EXPORTING
                  iv_cds_view_name = 'zaks_mad_cds_imat_tf'
                  io_gui_container = lo_container
              RECEIVING
                  ro_alv_gui_table_ida = lo_alv ).

      lo_alv->set_view_parameters(
          VALUE #( ( name = 'PR_M_GROUP' value = pr_m_grp ) ) ).

      DATA(lo_range_col) = NEW cl_salv_range_tab_collector( ).
      lo_range_col->add_ranges_for_name(
          iv_name = 'MATNR'
          it_ranges = s_matnr[] ).

    CATCH cx_salv_ida_selection_invalid.
      LEAVE TO SCREEN 0.
  ENDTRY.

  DATA : lo_option TYPE REF TO if_salv_gui_table_display_opt.
  CALL METHOD lo_alv->display_options
    RECEIVING
      ro_display_options = lo_option.
  lo_option->set_title(
        EXPORTING
            iv_title = 'Material Details of selected Material Group' ).

  TRY.
      CALL METHOD lo_alv->set_maximum_number_of_rows
        EXPORTING
          iv_number_of_rows = 50.
    CATCH cx_salv_param_out_of_bounds.
  ENDTRY.

  DATA(lo_fcat) = lo_alv->field_catalog( ).
  lo_fcat->set_available_fields(
    its_field_names = VALUE if_salv_gui_types_ida=>yts_field_name(
        ( CONV fieldname( 'MATNR' ) )
        ( CONV fieldname( 'MTART' ) )
        ( CONV fieldname( 'MEINS' ) )
        ( CONV fieldname( 'DISPO' ) )
        ( CONV fieldname( 'BEARZ' ) )
        ( CONV fieldname( 'PLANT_PROC_TYP' ) )
        ( CONV fieldname( 'M_TYP' ) )
        ( CONV fieldname( 'M_UNIT' ) )
        ( CONV fieldname( 'M_GWEIGHT' ) )
        ( CONV fieldname( 'M_MNO' ) )
         ) ).

  DATA(lo_layout) = lo_alv->default_layout( ).
  lo_layout->set_visible_fields(
      it_visible_fields = VALUE if_salv_gui_types_ida=>yt_field_name(
      ( 'MATNR' )
*        ( 'MTART' )
      ( 'M_GWEIGHT' )
      ( 'MEINS' )
      ( 'DISPO' )
      ( 'BEARZ' )
      ( 'PLANT_PROC_TYP' )
      ( 'M_TYP' )
*        ( 'M_UNIT' )
       ) ).

  lo_fcat->set_field_header_texts(
      iv_field_name = 'MATNR'
      iv_header_text = 'Materail Number'
       ).
*    lo_fcat->set_field_header_texts(
*        iv_field_name = 'MTART'
*        iv_header_text = ''
*         ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'M_GWEIGHT'
      iv_header_text = 'Materail Gross-Weight'
       ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'MEINS'
      iv_header_text = 'Base Unit of Measure'
       ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'DISPO'
      iv_header_text = 'MRP Controller'
       ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'BEARZ'
      iv_header_text = 'Processing Time'
       ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'PLANT_PROC_TYP'
      iv_header_text = 'Plant-Procurement Type'
       ).
*    lo_fcat->set_field_header_texts(
*        iv_field_name = 'M_UNIT'
*        iv_header_text = ''
*         ).
  lo_fcat->set_field_header_texts(
      iv_field_name = 'M_TYP'
      iv_header_text = 'Material Type'
       ).

  DATA(it_sort_ord) = VALUE if_salv_gui_types_ida=>yt_sort_rule(
      ( field_name = 'MATNR' descending = abap_true ) ).
  lo_layout->set_sort_order( it_sort_order = it_sort_ord ).

ENDMODULE.
