class zcl_falv_column definition
  public
  create public .

  public section.

    data fieldname type lvc_s_fcat-fieldname read-only .

    methods constructor
      importing
        value(iv_fieldname) type lvc_s_fcat-fieldname
        !io_falv            type ref to zcl_falv .
    methods set_editable .
    methods set_readonly .
    methods set_row_pos
      importing
        value(iv_value) type lvc_rowpos .
    methods set_col_pos
      importing
        value(iv_value) type lvc_colpos .
    methods set_fieldname
      importing
        value(iv_value) type lvc_fname .
    methods set_tabname
      importing
        value(iv_value) type lvc_tname .
    methods set_currency
      importing
        value(iv_value) type lvc_curr .
    methods set_cfieldname
      importing
        value(iv_value) type lvc_cfname .
    methods set_quantity
      importing
        value(iv_value) type lvc_quan .
    methods set_qfieldname
      importing
        value(iv_value) type lvc_qfname .
    methods set_ifieldname
      importing
        value(iv_value) type lvc_fname .
    methods set_round
      importing
        value(iv_value) type lvc_round .
    methods set_exponent
      importing
        value(iv_value) type lvc_expont .
    methods set_key
      importing
        value(iv_value) type lvc_key .
    methods set_key_sel
      importing
        value(iv_value) type lvc_keysel .
    methods set_icon
      importing
        value(iv_value) type lvc_icon .
    methods set_symbol
      importing
        value(iv_value) type lvc_symbol .
    methods set_checkbox
      importing
        value(iv_value) type lvc_checkb .
    methods set_just
      importing
        value(iv_value) type lvc_just .
    methods set_lzero
      importing
        value(iv_value) type lvc_lzero .
    methods set_no_sign
      importing
        value(iv_value) type lvc_nosign .
    methods set_no_zero
      importing
        value(iv_value) type lvc_nozero .
    methods set_no_convext
      importing
        value(iv_value) type lvc_noconv .
    methods set_edit_mask
      importing
        value(iv_value) type lvc_edtmsk .
    methods set_emphasize
      importing
        value(iv_value) type lvc_emphsz .
    methods set_color
      importing
        value(iv_value) type lvc_emphsz .
    methods set_fix_column
      importing
        value(iv_value) type lvc_fixcol .
    methods set_do_sum
      importing
        value(iv_value) type lvc_dosum .
    methods set_no_sum
      importing
        value(iv_value) type lvc_nosum .
    methods set_no_out
      importing
        value(iv_value) type lvc_noout .
    methods set_tech
      importing
        value(iv_value) type lvc_tech .
    methods set_outputlen
      importing
        value(iv_value) type lvc_outlen .
    methods set_convexit
      importing
        value(iv_value) type convexit .
    methods set_seltext
      importing
        value(iv_value) type lvc_txt .
    methods set_tooltip
      importing
        value(iv_value) type lvc_tip .
    methods set_rollname
      importing
        value(iv_value) type lvc_roll .
    methods set_datatype
      importing
        value(iv_value) type datatype_d .
    methods set_inttype
      importing
        value(iv_value) type inttype .
    methods set_intlen
      importing
        value(iv_value) type intlen .
    methods set_lowercase
      importing
        value(iv_value) type lowercase .
    methods set_reptext
      importing
        value(iv_value) type reptext .
    methods set_hier_level
      importing
        value(iv_value) type lvc_hierl .
    methods set_reprep
      importing
        value(iv_value) type lvc_crprp .
    methods set_domname
      importing
        value(iv_value) type domname .
    methods set_sp_group
      importing
        value(iv_value) type lvc_spgrp .
    methods set_hotspot
      importing
        value(iv_value) type lvc_hotspt .
    methods set_dfieldname
      importing
        value(iv_value) type lvcdbgfn .
    methods set_col_id
      importing
        value(iv_value) type lvc_colid .
    methods set_f4availabl
      importing
        value(iv_value) type ddf4avail .
    methods set_auto_value
      importing
        value(iv_value) type lvc_auto .
    methods set_checktable
      importing
        value(iv_value) type tabname .
    methods set_valexi
      importing
        value(iv_value) type valexi .
    methods set_web_field
      importing
        value(iv_value) type lvc_fname .
    methods set_href_hndl
      importing
        value(iv_value) type int4 .
    methods set_style
      importing
        value(iv_value) type lvc_style .
    methods set_style2
      importing
        value(iv_value) type lvc_style .
    methods set_style3
      importing
        value(iv_value) type lvc_style .
    methods set_style4
      importing
        value(iv_value) type lvc_style .
    methods set_drdn_hndl
      importing
        value(iv_value) type int4 .
    methods set_drdn_field
      importing
        value(iv_value) type lvc_fname .
    methods set_no_merging
      importing
        value(iv_value) type char01 .
    methods set_h_ftype
      importing
        value(iv_value) type lvc_ftype .
    methods set_col_opt
      importing
        value(iv_value) type lvc_colopt .
    methods set_no_init_ch
      importing
        value(iv_value) type char01 .
    methods set_drdn_alias
      importing
        value(iv_value) type char01 .
    methods set_decfloat_style
      importing
        value(iv_value) type outputstyle .
    methods set_parameter0
      importing
        value(iv_value) type char30 .
    methods set_parameter1
      importing
        value(iv_value) type char30 .
    methods set_parameter2
      importing
        value(iv_value) type char30 .
    methods set_parameter3
      importing
        value(iv_value) type char30 .
    methods set_parameter4
      importing
        value(iv_value) type char30 .
    methods set_parameter5
      importing
        value(iv_value) type int4 .
    methods set_parameter6
      importing
        value(iv_value) type int4 .
    methods set_parameter7
      importing
        value(iv_value) type int4 .
    methods set_parameter8
      importing
        value(iv_value) type int4 .
    methods set_parameter9
      importing
        value(iv_value) type int4 .
    methods set_ref_field
      importing
        value(iv_value) type lvc_rfname .
    methods set_ref_table
      importing
        value(iv_value) type lvc_rtname .
    methods set_txt_field
      importing
        value(iv_value) type lvc_fname .
    methods set_roundfield
      importing
        value(iv_value) type lvc_rndfn .
    methods set_decimals_o
      importing
        value(iv_value) type lvc_decmls .
    methods set_decmlfield
      importing
        value(iv_value) type lvc_dfname .
    methods set_dd_outlen
      importing
        value(iv_value) type lvc_ddlen .
    methods set_decimals
      importing
        value(iv_value) type decimals .
    methods set_coltext
      importing
        value(iv_value) type lvc_txtcol .
    methods set_scrtext_l
      importing
        value(iv_value) type scrtext_l .
    methods set_scrtext_m
      importing
        value(iv_value) type scrtext_m .
    methods set_scrtext_s
      importing
        value(iv_value) type scrtext_s .
    methods set_colddictxt
      importing
        value(iv_value) type lvc_ddict .
    methods set_selddictxt
      importing
        value(iv_value) type lvc_ddict .
    methods set_tipddictxt
      importing
        value(iv_value) type lvc_ddict .
    methods set_edit
      importing
        value(iv_value) type lvc_edit .
    methods set_tech_col
      importing
        value(iv_value) type lvc_tcol .
    methods set_tech_form
      importing
        value(iv_value) type lvc_tform .
    methods set_tech_comp
      importing
        value(iv_value) type lvc_tcomp .
    methods set_hier_cpos
      importing
        value(iv_value) type lvchcolpos .
    methods set_h_col_key
      importing
        value(iv_value) type tv_itmname .
    methods set_h_select
      importing
        value(iv_value) type lvc_select .
    methods set_dd_roll
      importing
        value(iv_value) type rollname .
    methods set_dragdropid
      importing
        value(iv_value) type lvc_ddid .
    methods set_mac
      importing
        value(iv_value) type char01 .
    methods set_indx_field
      importing
        value(iv_value) type int4 .
    methods set_indx_cfiel
      importing
        value(iv_value) type int4 .
    methods set_indx_qfiel
      importing
        value(iv_value) type int4 .
    methods set_indx_ifiel
      importing
        value(iv_value) type int4 .
    methods set_indx_round
      importing
        value(iv_value) type int4 .
    methods set_indx_decml
      importing
        value(iv_value) type int4 .
    methods set_get_style
      importing
        value(iv_value) type char01 .
    methods set_mark
      importing
        value(iv_value) type char01 .

    methods get_editable
      returning value(rv_editable) type abap_bool.
    methods get_readonly

      returning value(rv_read_only) type abap_bool.
    methods get_row_pos
      returning
        value(rv_value) type lvc_rowpos .
    methods get_col_pos
      returning
        value(rv_value) type lvc_colpos .
    methods get_fieldname
      returning
        value(rv_value) type lvc_fname .
    methods get_tabname
      returning
        value(rv_value) type lvc_tname .
    methods get_currency
      returning
        value(rv_value) type lvc_curr .
    methods get_cfieldname
      returning
        value(rv_value) type lvc_cfname .
    methods get_quantity
      returning
        value(rv_value) type lvc_quan .
    methods get_qfieldname
      returning
        value(rv_value) type lvc_qfname .
    methods get_ifieldname
      returning
        value(rv_value) type lvc_fname .
    methods get_round
      returning
        value(rv_value) type lvc_round .
    methods get_exponent
      returning
        value(rv_value) type lvc_expont .
    methods get_key
      returning
        value(rv_value) type lvc_key .
    methods get_key_sel
      returning
        value(rv_value) type lvc_keysel .
    methods get_icon
      returning
        value(rv_value) type lvc_icon .
    methods get_symbol
      returning
        value(rv_value) type lvc_symbol .
    methods get_checkbox
      returning
        value(rv_value) type lvc_checkb .
    methods get_just
      returning
        value(rv_value) type lvc_just .
    methods get_lzero
      returning
        value(rv_value) type lvc_lzero .
    methods get_no_sign
      returning
        value(rv_value) type lvc_nosign .
    methods get_no_zero
      returning
        value(rv_value) type lvc_nozero .
    methods get_no_convext
      returning
        value(rv_value) type lvc_noconv .
    methods get_edit_mask
      returning
        value(rv_value) type lvc_edtmsk .
    methods get_emphasize
      returning
        value(rv_value) type lvc_emphsz .
    methods get_color
      returning
        value(rv_value) type lvc_emphsz .
    methods get_fix_column
      returning
        value(rv_value) type lvc_fixcol .
    methods get_do_sum
      returning
        value(rv_value) type lvc_dosum .
    methods get_no_sum
      returning
        value(rv_value) type lvc_nosum .
    methods get_no_out
      returning
        value(rv_value) type lvc_noout .
    methods get_tech
      returning
        value(rv_value) type lvc_tech .
    methods get_outputlen
      returning
        value(rv_value) type lvc_outlen .
    methods get_convexit
      returning
        value(rv_value) type convexit .
    methods get_seltext
      returning
        value(rv_value) type lvc_txt .
    methods get_tooltip
      returning
        value(rv_value) type lvc_tip .
    methods get_rollname
      returning
        value(rv_value) type lvc_roll .
    methods get_datatype
      returning
        value(rv_value) type datatype_d .
    methods get_inttype
      returning
        value(rv_value) type inttype .
    methods get_intlen
      returning
        value(rv_value) type intlen .
    methods get_lowercase
      returning
        value(rv_value) type lowercase .
    methods get_reptext
      returning
        value(rv_value) type reptext .
    methods get_hier_level
      returning
        value(rv_value) type lvc_hierl .
    methods get_reprep
      returning
        value(rv_value) type lvc_crprp .
    methods get_domname
      returning
        value(rv_value) type domname .
    methods get_sp_group
      returning
        value(rv_value) type lvc_spgrp .
    methods get_hotspot
      returning
        value(rv_value) type lvc_hotspt .
    methods get_dfieldname
      returning
        value(rv_value) type lvcdbgfn .
    methods get_col_id
      returning
        value(rv_value) type lvc_colid .
    methods get_f4availabl
      returning
        value(rv_value) type ddf4avail .
    methods get_auto_value
      returning
        value(rv_value) type lvc_auto .
    methods get_checktable
      returning
        value(rv_value) type tabname .
    methods get_valexi
      returning
        value(rv_value) type valexi .
    methods get_web_field
      returning
        value(rv_value) type lvc_fname .
    methods get_href_hndl
      returning
        value(rv_value) type int4 .
    methods get_style
      returning
        value(rv_value) type lvc_style .
    methods get_style2
      returning
        value(rv_value) type lvc_style .
    methods get_style3
      returning
        value(rv_value) type lvc_style .
    methods get_style4
      returning
        value(rv_value) type lvc_style .
    methods get_drdn_hndl
      returning
        value(rv_value) type int4 .
    methods get_drdn_field
      returning
        value(rv_value) type lvc_fname .
    methods get_no_merging
      returning
        value(rv_value) type char01 .
    methods get_h_ftype
      returning
        value(rv_value) type lvc_ftype .
    methods get_col_opt
      returning
        value(rv_value) type lvc_colopt .
    methods get_no_init_ch
      returning
        value(rv_value) type char01 .
    methods get_drdn_alias
      returning
        value(rv_value) type char01 .
    methods get_decfloat_style
      returning
        value(rv_value) type outputstyle .
    methods get_parameter0
      returning
        value(rv_value) type char30 .
    methods get_parameter1
      returning
        value(rv_value) type char30 .
    methods get_parameter2
      returning
        value(rv_value) type char30 .
    methods get_parameter3
      returning
        value(rv_value) type char30 .
    methods get_parameter4
      returning
        value(rv_value) type char30 .
    methods get_parameter5
      returning
        value(rv_value) type int4 .
    methods get_parameter6
      returning
        value(rv_value) type int4 .
    methods get_parameter7
      returning
        value(rv_value) type int4 .
    methods get_parameter8
      returning
        value(rv_value) type int4 .
    methods get_parameter9
      returning
        value(rv_value) type int4 .
    methods get_ref_field
      returning
        value(rv_value) type lvc_rfname .
    methods get_ref_table
      returning
        value(rv_value) type lvc_rtname .
    methods get_txt_field
      returning
        value(rv_value) type lvc_fname .
    methods get_roundfield
      returning
        value(rv_value) type lvc_rndfn .
    methods get_decimals_o
      returning
        value(rv_value) type lvc_decmls .
    methods get_decmlfield
      returning
        value(rv_value) type lvc_dfname .
    methods get_dd_outlen
      returning
        value(rv_value) type lvc_ddlen .
    methods get_decimals
      returning
        value(rv_value) type decimals .
    methods get_coltext
      returning
        value(rv_value) type lvc_txtcol .
    methods get_scrtext_l
      returning
        value(rv_value) type scrtext_l .
    methods get_scrtext_m
      returning
        value(rv_value) type scrtext_m .
    methods get_scrtext_s
      returning
        value(rv_value) type scrtext_s .
    methods get_colddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_selddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_tipddictxt
      returning
        value(rv_value) type lvc_ddict .
    methods get_edit
      returning
        value(rv_value) type lvc_edit .
    methods get_tech_col
      returning
        value(rv_value) type lvc_tcol .
    methods get_tech_form
      returning
        value(rv_value) type lvc_tform .
    methods get_tech_comp
      returning
        value(rv_value) type lvc_tcomp .
    methods get_hier_cpos
      returning
        value(rv_value) type lvchcolpos .
    methods get_h_col_key
      returning
        value(rv_value) type tv_itmname .
    methods get_h_select
      returning
        value(rv_value) type lvc_select .
    methods get_dd_roll
      returning
        value(rv_value) type rollname .
    methods get_dragdropid
      returning
        value(rv_value) type lvc_ddid .
    methods get_mac
      returning
        value(rv_value) type char01 .
    methods get_indx_field
      returning
        value(rv_value) type int4 .
    methods get_indx_cfiel
      returning
        value(rv_value) type int4 .
    methods get_indx_qfiel
      returning
        value(rv_value) type int4 .
    methods get_indx_ifiel
      returning
        value(rv_value) type int4 .
    methods get_indx_round
      returning
        value(rv_value) type int4 .
    methods get_indx_decml
      returning
        value(rv_value) type int4 .
    methods get_get_style
      returning
        value(rv_value) type char01 .
    methods get_mark
      returning
        value(rv_value) type char01 .

  protected section.
  private section.

    data falv type ref to zcl_falv .

    methods change_setting
      importing
        value(iv_value)   type any
        value(iv_setting) type string .

    methods get_setting
      importing
        value(iv_setting) type string
      exporting
        value(e_value)    type any.
ENDCLASS.



CLASS ZCL_FALV_COLUMN IMPLEMENTATION.


  method change_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        <field> = iv_value.
      endif.
      falv->set_frontend_fieldcatalog( it_fieldcatalog = falv->fcat ).
    endif.
  endmethod.


  method constructor.
    fieldname = iv_fieldname.
    falv = io_falv.
  endmethod.


  method get_auto_value.
    get_setting( exporting  iv_setting = 'AUTO_VALUE' importing e_value = rv_value ).
  endmethod.


  method get_cfieldname.
    get_setting( exporting  iv_setting = 'CFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_checkbox.
    get_setting( exporting  iv_setting = 'CHECKBOX' importing e_value = rv_value ).
  endmethod.


  method get_checktable.
    get_setting( exporting  iv_setting = 'CHECKTABLE' importing e_value = rv_value ).
  endmethod.


  method get_colddictxt.
    get_setting( exporting  iv_setting = 'COLDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_color.
    get_emphasize(   receiving rv_value = rv_value ).
  endmethod.


  method get_coltext.
    get_setting( exporting  iv_setting = 'COLTEXT' importing e_value = rv_value ).
  endmethod.


  method get_col_id.
    get_setting( exporting  iv_setting = 'COL_ID' importing e_value = rv_value ).
  endmethod.


  method get_col_opt.
    get_setting( exporting  iv_setting = 'COL_OPT' importing e_value = rv_value ).
  endmethod.


  method get_col_pos.
    get_setting( exporting  iv_setting = 'COL_POS' importing e_value = rv_value ).
  endmethod.


  method get_convexit.
    get_setting( exporting  iv_setting = 'CONVEXIT' importing e_value = rv_value ).
  endmethod.


  method get_currency.
    get_setting( exporting  iv_setting = 'CURRENCY' importing e_value = rv_value ).
  endmethod.


  method get_datatype.
    get_setting( exporting  iv_setting = 'DATATYPE' importing e_value = rv_value ).
  endmethod.


  method get_dd_outlen.
    get_setting( exporting  iv_setting = 'DD_OUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_dd_roll.
    get_setting( exporting  iv_setting = 'DD_ROLL' importing e_value = rv_value ).
  endmethod.


  method get_decfloat_style.
    get_setting( exporting  iv_setting = 'DECFLOAT_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_decimals.
    get_setting( exporting  iv_setting = 'DECIMALS' importing e_value = rv_value ).
  endmethod.


  method get_decimals_o.
    get_setting( exporting  iv_setting = 'DECIMALS_O' importing e_value = rv_value ).
  endmethod.


  method get_decmlfield.
    get_setting( exporting  iv_setting = 'DECMLFIELD' importing e_value = rv_value ).
  endmethod.


  method get_dfieldname.
    get_setting( exporting  iv_setting = 'DFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_domname.
    get_setting( exporting  iv_setting = 'DOMNAME' importing e_value = rv_value ).
  endmethod.


  method get_do_sum.
    get_setting( exporting  iv_setting = 'DO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_dragdropid.
    get_setting( exporting  iv_setting = 'DRAGDROPID' importing e_value = rv_value ).
  endmethod.


  method get_drdn_alias.
    get_setting( exporting  iv_setting = 'DRDN_ALIAS' importing e_value = rv_value ).
  endmethod.


  method get_drdn_field.
    get_setting( exporting  iv_setting = 'DRDN_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_drdn_hndl.
    get_setting( exporting  iv_setting = 'DRDN_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_edit.
    get_setting( exporting  iv_setting = 'EDIT' importing e_value = rv_value ).
  endmethod.


  method get_editable.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_editable ).
  endmethod.


  method get_edit_mask.
    get_setting( exporting  iv_setting = 'EDIT_MASK' importing e_value = rv_value ).
  endmethod.


  method get_emphasize.
    get_setting( exporting  iv_setting = 'EMPHASIZE' importing e_value = rv_value ).
  endmethod.


  method get_exponent.
    get_setting( exporting  iv_setting = 'EXPONENT' importing e_value = rv_value ).
  endmethod.


  method get_f4availabl.
    get_setting( exporting  iv_setting = 'F4AVAILABL' importing e_value = rv_value ).
  endmethod.


  method get_fieldname.
    get_setting( exporting  iv_setting = 'FIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_fix_column.
    get_setting( exporting  iv_setting = 'FIX_COLUMN' importing e_value = rv_value ).
  endmethod.


  method get_get_style.
    get_setting( exporting  iv_setting = 'GET_STYLE' importing e_value = rv_value ).
  endmethod.


  method get_hier_cpos.
    get_setting( exporting  iv_setting = 'HIER_CPOS' importing e_value = rv_value ).
  endmethod.


  method get_hier_level.
    get_setting( exporting  iv_setting = 'HIER_LEVEL' importing e_value = rv_value ).
  endmethod.


  method get_hotspot.
    get_setting( exporting  iv_setting = 'HOTSPOT' importing e_value = rv_value ).
  endmethod.


  method get_href_hndl.
    get_setting( exporting  iv_setting = 'HREF_HNDL' importing e_value = rv_value ).
  endmethod.


  method get_h_col_key.
    get_setting( exporting  iv_setting = 'H_COL_KEY' importing e_value = rv_value ).
  endmethod.


  method get_h_ftype.
    get_setting( exporting  iv_setting = 'H_FTYPE' importing e_value = rv_value ).
  endmethod.


  method get_h_select.
    get_setting( exporting  iv_setting = 'H_SELECT' importing e_value = rv_value ).
  endmethod.


  method get_icon.
    get_setting( exporting  iv_setting = 'ICON' importing e_value = rv_value ).
  endmethod.


  method get_ifieldname.
    get_setting( exporting  iv_setting = 'IFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_indx_cfiel.
    get_setting( exporting  iv_setting = 'INDX_CFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_decml.
    get_setting( exporting  iv_setting = 'INDX_DECML' importing e_value = rv_value ).
  endmethod.


  method get_indx_field.
    get_setting( exporting  iv_setting = 'INDX_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_indx_ifiel.
    get_setting( exporting  iv_setting = 'INDX_IFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_qfiel.
    get_setting( exporting  iv_setting = 'INDX_QFIEL' importing e_value = rv_value ).
  endmethod.


  method get_indx_round.
    get_setting( exporting  iv_setting = 'INDX_ROUND' importing e_value = rv_value ).
  endmethod.


  method get_intlen.
    get_setting( exporting  iv_setting = 'INTLEN' importing e_value = rv_value ).
  endmethod.


  method get_inttype.
    get_setting( exporting  iv_setting = 'INTTYPE' importing e_value = rv_value ).
  endmethod.


  method get_just.
    get_setting( exporting  iv_setting = 'JUST' importing e_value = rv_value ).
  endmethod.


  method get_key.
    get_setting( exporting  iv_setting = 'KEY' importing e_value = rv_value ).
  endmethod.


  method get_key_sel.
    get_setting( exporting  iv_setting = 'KEY_SEL' importing e_value = rv_value ).
  endmethod.


  method get_lowercase.
    get_setting( exporting  iv_setting = 'LOWERCASE' importing e_value = rv_value ).
  endmethod.


  method get_lzero.
    get_setting( exporting  iv_setting = 'LZERO' importing e_value = rv_value ).
  endmethod.


  method get_mac.
    get_setting( exporting  iv_setting = 'MAC' importing e_value = rv_value ).
  endmethod.


  method get_mark.
    get_setting( exporting  iv_setting = 'MARK' importing e_value = rv_value ).
  endmethod.


  method get_no_convext.
    get_setting( exporting  iv_setting = 'NO_CONVEXT' importing e_value = rv_value ).
  endmethod.


  method get_no_init_ch.
    get_setting( exporting  iv_setting = 'NO_INIT_CH' importing e_value = rv_value ).
  endmethod.


  method get_no_merging.
    get_setting( exporting  iv_setting = 'NO_MERGING' importing e_value = rv_value ).
  endmethod.


  method get_no_out.
    get_setting( exporting  iv_setting = 'NO_OUT' importing e_value = rv_value ).
  endmethod.


  method get_no_sign.
    get_setting( exporting  iv_setting = 'NO_SIGN' importing e_value = rv_value ).
  endmethod.


  method get_no_sum.
    get_setting( exporting  iv_setting = 'NO_SUM' importing e_value = rv_value ).
  endmethod.


  method get_no_zero.
    get_setting( exporting  iv_setting = 'NO_ZERO' importing e_value = rv_value ).
  endmethod.


  method get_outputlen.
    get_setting( exporting  iv_setting = 'OUTPUTLEN' importing e_value = rv_value ).
  endmethod.


  method get_parameter0.
    get_setting( exporting  iv_setting = 'PARAMETER0' importing e_value = rv_value ).
  endmethod.


  method get_parameter1.
    get_setting( exporting  iv_setting = 'PARAMETER1' importing e_value = rv_value ).
  endmethod.


  method get_parameter2.
    get_setting( exporting  iv_setting = 'PARAMETER2' importing e_value = rv_value ).
  endmethod.


  method get_parameter3.
    get_setting( exporting  iv_setting = 'PARAMETER3' importing e_value = rv_value ).
  endmethod.


  method get_parameter4.
    get_setting( exporting  iv_setting = 'PARAMETER4' importing e_value = rv_value ).
  endmethod.


  method get_parameter5.
    get_setting( exporting  iv_setting = 'PARAMETER5' importing e_value = rv_value ).
  endmethod.


  method get_parameter6.
    get_setting( exporting  iv_setting = 'PARAMETER6' importing e_value = rv_value ).
  endmethod.


  method get_parameter7.
    get_setting( exporting  iv_setting = 'PARAMETER7' importing e_value = rv_value ).
  endmethod.


  method get_parameter8.
    get_setting( exporting  iv_setting = 'PARAMETER8' importing e_value = rv_value ).
  endmethod.


  method get_parameter9.
    get_setting( exporting  iv_setting = 'PARAMETER9' importing e_value = rv_value ).
  endmethod.


  method get_qfieldname.
    get_setting( exporting  iv_setting = 'QFIELDNAME' importing e_value = rv_value ).
  endmethod.


  method get_quantity.
    get_setting( exporting  iv_setting = 'QUANTITY' importing e_value = rv_value ).
  endmethod.


  method get_readonly.
    get_setting( exporting iv_setting = 'EDIT' importing e_value = rv_read_only ).
    rv_read_only = switch #( rv_read_only when abap_true then abap_false
                                          when abap_false then abap_true ).
  endmethod.


  method get_ref_field.
    get_setting( exporting  iv_setting = 'REF_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_ref_table.
    get_setting( exporting  iv_setting = 'REF_TABLE' importing e_value = rv_value ).
  endmethod.


  method get_reprep.
    get_setting( exporting  iv_setting = 'REPREP' importing e_value = rv_value ).
  endmethod.


  method get_reptext.
    get_setting( exporting  iv_setting = 'REPTEXT' importing e_value = rv_value ).
  endmethod.


  method get_rollname.
    get_setting( exporting  iv_setting = 'ROLLNAME' importing e_value = rv_value ).
  endmethod.


  method get_round.
    get_setting( exporting  iv_setting = 'ROUND' importing e_value = rv_value ).
  endmethod.


  method get_roundfield.
    get_setting( exporting  iv_setting = 'ROUNDFIELD' importing e_value = rv_value ).
  endmethod.


  method get_row_pos.
    get_setting( exporting  iv_setting = 'ROW_POS' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_l.
    get_setting( exporting  iv_setting = 'SCRTEXT_L' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_m.
    get_setting( exporting  iv_setting = 'SCRTEXT_M' importing e_value = rv_value ).
  endmethod.


  method get_scrtext_s.
    get_setting( exporting  iv_setting = 'SCRTEXT_S' importing e_value = rv_value ).
  endmethod.


  method get_selddictxt.
    get_setting( exporting  iv_setting = 'SELDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_seltext.
    get_setting( exporting  iv_setting = 'SELTEXT' importing e_value = rv_value ).
  endmethod.


  method get_setting.
    falv->get_frontend_fieldcatalog( importing et_fieldcatalog = falv->fcat ).
    assign falv->fcat[ fieldname = fieldname ] to field-symbol(<fcat>).
    if sy-subrc eq 0.
      data(fcat_field) = |<fcat>-{ iv_setting }|.
      assign (fcat_field) to field-symbol(<field>).
      if sy-subrc eq 0.
        e_value = <field>.
      endif.
    endif.
  endmethod.


  method get_sp_group.
    get_setting( exporting  iv_setting = 'SP_GROUP' importing e_value = rv_value ).
  endmethod.


  method get_style.
    get_setting( exporting  iv_setting = 'STYLE' importing e_value = rv_value ).
  endmethod.


  method get_style2.
    get_setting( exporting  iv_setting = 'STYLE2' importing e_value = rv_value ).
  endmethod.


  method get_style3.
    get_setting( exporting  iv_setting = 'STYLE3' importing e_value = rv_value ).
  endmethod.


  method get_style4.
    get_setting( exporting  iv_setting = 'STYLE4' importing e_value = rv_value ).
  endmethod.


  method get_symbol.
    get_setting( exporting  iv_setting = 'SYMBOL' importing e_value = rv_value ).
  endmethod.


  method get_tabname.
    get_setting( exporting  iv_setting = 'TABNAME' importing e_value = rv_value ).
  endmethod.


  method get_tech.
    get_setting( exporting  iv_setting = 'TECH' importing e_value = rv_value ).
  endmethod.


  method get_tech_col.
    get_setting( exporting  iv_setting = 'TECH_COL' importing e_value = rv_value ).
  endmethod.


  method get_tech_comp.
    get_setting( exporting  iv_setting = 'TECH_COMP' importing e_value = rv_value ).
  endmethod.


  method get_tech_form.
    get_setting( exporting  iv_setting = 'TECH_FORM' importing e_value = rv_value ).
  endmethod.


  method get_tipddictxt.
    get_setting( exporting  iv_setting = 'TIPDDICTXT' importing e_value = rv_value ).
  endmethod.


  method get_tooltip.
    get_setting( exporting  iv_setting = 'TOOLTIP' importing e_value = rv_value ).
  endmethod.


  method get_txt_field.
    get_setting( exporting  iv_setting = 'TXT_FIELD' importing e_value = rv_value ).
  endmethod.


  method get_valexi.
    get_setting( exporting  iv_setting = 'VALEXI' importing e_value = rv_value ).
  endmethod.


  method get_web_field.
    get_setting( exporting  iv_setting = 'WEB_FIELD' importing e_value = rv_value ).
  endmethod.


  method set_auto_value.
    change_setting( iv_value = iv_value iv_setting = 'AUTO_VALUE').
  endmethod.


  method set_cfieldname.
    change_setting( iv_value = iv_value iv_setting = 'CFIELDNAME').
  endmethod.


  method set_checkbox.
    change_setting( iv_value = iv_value iv_setting = 'CHECKBOX').
  endmethod.


  method set_checktable.
    change_setting( iv_value = iv_value iv_setting = 'CHECKTABLE').
  endmethod.


  method set_colddictxt.
    change_setting( iv_value = iv_value iv_setting = 'COLDDICTXT').
  endmethod.


  method set_color.
    set_emphasize( iv_value = iv_value ).
  endmethod.


  method set_coltext.
    change_setting( iv_value = iv_value iv_setting = 'COLTEXT').
  endmethod.


  method set_col_id.
    change_setting( iv_value = iv_value iv_setting = 'COL_ID').
  endmethod.


  method set_col_opt.
    change_setting( iv_value = iv_value iv_setting = 'COL_OPT').
  endmethod.


  method set_col_pos.
    change_setting( iv_value = iv_value iv_setting = 'COL_POS').
  endmethod.


  method set_convexit.
    change_setting( iv_value = iv_value iv_setting = 'CONVEXIT').
  endmethod.


  method set_currency.
    change_setting( iv_value = iv_value iv_setting = 'CURRENCY').
  endmethod.


  method set_datatype.
    change_setting( iv_value = iv_value iv_setting = 'DATATYPE').
  endmethod.


  method set_dd_outlen.
    change_setting( iv_value = iv_value iv_setting = 'DD_OUTLEN').
  endmethod.


  method set_dd_roll.
    change_setting( iv_value = iv_value iv_setting = 'DD_ROLL').
  endmethod.


  method set_decfloat_style.
    change_setting( iv_value = iv_value iv_setting = 'DECFLOAT_STYLE').
  endmethod.


  method set_decimals.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS').
  endmethod.


  method set_decimals_o.
    change_setting( iv_value = iv_value iv_setting = 'DECIMALS_O').
  endmethod.


  method set_decmlfield.
    change_setting( iv_value = iv_value iv_setting = 'DECMLFIELD').
  endmethod.


  method set_dfieldname.
    change_setting( iv_value = iv_value iv_setting = 'DFIELDNAME').
  endmethod.


  method set_domname.
    change_setting( iv_value = iv_value iv_setting = 'DOMNAME').
  endmethod.


  method set_do_sum.
    change_setting( iv_value = iv_value iv_setting = 'DO_SUM').
  endmethod.


  method set_dragdropid.
    change_setting( iv_value = iv_value iv_setting = 'DRAGDROPID').
  endmethod.


  method set_drdn_alias.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_ALIAS').
  endmethod.


  method set_drdn_field.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_FIELD').
  endmethod.


  method set_drdn_hndl.
    change_setting( iv_value = iv_value iv_setting = 'DRDN_HNDL').
  endmethod.


  method set_edit.
    change_setting( iv_value = iv_value iv_setting = 'EDIT').
  endmethod.


  method set_editable.
    change_setting( iv_value = abap_true iv_setting = 'EDIT').
  endmethod.


  method set_edit_mask.
    change_setting( iv_value = iv_value iv_setting = 'EDIT_MASK').
  endmethod.


  method set_emphasize.
    change_setting( iv_value = iv_value iv_setting = 'EMPHASIZE').
  endmethod.


  method set_exponent.
    change_setting( iv_value = iv_value iv_setting = 'EXPONENT').
  endmethod.


  method set_f4availabl.
    change_setting( iv_value = iv_value iv_setting = 'F4AVAILABL').
  endmethod.


  method set_fieldname.
    change_setting( iv_value = iv_value iv_setting = 'FIELDNAME').
  endmethod.


  method set_fix_column.
    change_setting( iv_value = iv_value iv_setting = 'FIX_COLUMN').
  endmethod.


  method set_get_style.
    change_setting( iv_value = iv_value iv_setting = 'GET_STYLE').
  endmethod.


  method set_hier_cpos.
    change_setting( iv_value = iv_value iv_setting = 'HIER_CPOS').
  endmethod.


  method set_hier_level.
    change_setting( iv_value = iv_value iv_setting = 'HIER_LEVEL').
  endmethod.


  method set_hotspot.
    change_setting( iv_value = iv_value iv_setting = 'HOTSPOT').
  endmethod.


  method set_href_hndl.
    change_setting( iv_value = iv_value iv_setting = 'HREF_HNDL').
  endmethod.


  method set_h_col_key.
    change_setting( iv_value = iv_value iv_setting = 'H_COL_KEY').
  endmethod.


  method set_h_ftype.
    change_setting( iv_value = iv_value iv_setting = 'H_FTYPE').
  endmethod.


  method set_h_select.
    change_setting( iv_value = iv_value iv_setting = 'H_SELECT').
  endmethod.


  method set_icon.
    change_setting( iv_value = iv_value iv_setting = 'ICON').
  endmethod.


  method set_ifieldname.
    change_setting( iv_value = iv_value iv_setting = 'IFIELDNAME').
  endmethod.


  method set_indx_cfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_CFIEL').
  endmethod.


  method set_indx_decml.
    change_setting( iv_value = iv_value iv_setting = 'INDX_DECML').
  endmethod.


  method set_indx_field.
    change_setting( iv_value = iv_value iv_setting = 'INDX_FIELD').
  endmethod.


  method set_indx_ifiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_IFIEL').
  endmethod.


  method set_indx_qfiel.
    change_setting( iv_value = iv_value iv_setting = 'INDX_QFIEL').
  endmethod.


  method set_indx_round.
    change_setting( iv_value = iv_value iv_setting = 'INDX_ROUND').
  endmethod.


  method set_intlen.
    change_setting( iv_value = iv_value iv_setting = 'INTLEN').
  endmethod.


  method set_inttype.
    change_setting( iv_value = iv_value iv_setting = 'INTTYPE').
  endmethod.


  method set_just.
    change_setting( iv_value = iv_value iv_setting = 'JUST').
  endmethod.


  method set_key.
    change_setting( iv_value = iv_value iv_setting = 'KEY').
  endmethod.


  method set_key_sel.
    change_setting( iv_value = iv_value iv_setting = 'KEY_SEL').
  endmethod.


  method set_lowercase.
    change_setting( iv_value = iv_value iv_setting = 'LOWERCASE').
  endmethod.


  method set_lzero.
    change_setting( iv_value = iv_value iv_setting = 'LZERO').
  endmethod.


  method set_mac.
    change_setting( iv_value = iv_value iv_setting = 'MAC').
  endmethod.


  method set_mark.
    change_setting( iv_value = iv_value iv_setting = 'MARK').
  endmethod.


  method set_no_convext.
    change_setting( iv_value = iv_value iv_setting = 'NO_CONVEXT').
  endmethod.


  method set_no_init_ch.
    change_setting( iv_value = iv_value iv_setting = 'NO_INIT_CH').
  endmethod.


  method set_no_merging.
    change_setting( iv_value = iv_value iv_setting = 'NO_MERGING').
  endmethod.


  method set_no_out.
    change_setting( iv_value = iv_value iv_setting = 'NO_OUT').
  endmethod.


  method set_no_sign.
    change_setting( iv_value = iv_value iv_setting = 'NO_SIGN').
  endmethod.


  method set_no_sum.
    change_setting( iv_value = iv_value iv_setting = 'NO_SUM').
  endmethod.


  method set_no_zero.
    change_setting( iv_value = iv_value iv_setting = 'NO_ZERO').
  endmethod.


  method set_outputlen.
    change_setting( iv_value = iv_value iv_setting = 'OUTPUTLEN').
  endmethod.


  method set_parameter0.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER0').
  endmethod.


  method set_parameter1.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER1').
  endmethod.


  method set_parameter2.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER2').
  endmethod.


  method set_parameter3.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER3').
  endmethod.


  method set_parameter4.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER4').
  endmethod.


  method set_parameter5.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER5').
  endmethod.


  method set_parameter6.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER6').
  endmethod.


  method set_parameter7.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER7').
  endmethod.


  method set_parameter8.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER8').
  endmethod.


  method set_parameter9.
    change_setting( iv_value = iv_value iv_setting = 'PARAMETER9').
  endmethod.


  method set_qfieldname.
    change_setting( iv_value = iv_value iv_setting = 'QFIELDNAME').
  endmethod.


  method set_quantity.
    change_setting( iv_value = iv_value iv_setting = 'QUANTITY').
  endmethod.


  method set_readonly.
    change_setting( iv_value = abap_false iv_setting = 'EDIT').
  endmethod.


  method set_ref_field.
    change_setting( iv_value = iv_value iv_setting = 'REF_FIELD').
  endmethod.


  method set_ref_table.
    change_setting( iv_value = iv_value iv_setting = 'REF_TABLE').
  endmethod.


  method set_reprep.
    change_setting( iv_value = iv_value iv_setting = 'REPREP').
  endmethod.


  method set_reptext.
    change_setting( iv_value = iv_value iv_setting = 'REPTEXT').
  endmethod.


  method set_rollname.
    change_setting( iv_value = iv_value iv_setting = 'ROLLNAME').
  endmethod.


  method set_round.
    change_setting( iv_value = iv_value iv_setting = 'ROUND').
  endmethod.


  method set_roundfield.
    change_setting( iv_value = iv_value iv_setting = 'ROUNDFIELD').
  endmethod.


  method set_row_pos.
    change_setting( iv_value = iv_value iv_setting = 'ROW_POS').
  endmethod.


  method set_scrtext_l.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_L').
  endmethod.


  method set_scrtext_m.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_M').
  endmethod.


  method set_scrtext_s.
    change_setting( iv_value = iv_value iv_setting = 'SCRTEXT_S').
  endmethod.


  method set_selddictxt.
    change_setting( iv_value = iv_value iv_setting = 'SELDDICTXT').
  endmethod.


  method set_seltext.
    change_setting( iv_value = iv_value iv_setting = 'SELTEXT').
  endmethod.


  method set_sp_group.
    change_setting( iv_value = iv_value iv_setting = 'SP_GROUP').
  endmethod.


  method set_style.
    change_setting( iv_value = iv_value iv_setting = 'STYLE').
  endmethod.


  method set_style2.
    change_setting( iv_value = iv_value iv_setting = 'STYLE2').
  endmethod.


  method set_style3.
    change_setting( iv_value = iv_value iv_setting = 'STYLE3').
  endmethod.


  method set_style4.
    change_setting( iv_value = iv_value iv_setting = 'STYLE4').
  endmethod.


  method set_symbol.
    change_setting( iv_value = iv_value iv_setting = 'SYMBOL').
  endmethod.


  method set_tabname.
    change_setting( iv_value = iv_value iv_setting = 'TABNAME').
  endmethod.


  method set_tech.
    change_setting( iv_value = iv_value iv_setting = 'TECH').
  endmethod.


  method set_tech_col.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COL').
  endmethod.


  method set_tech_comp.
    change_setting( iv_value = iv_value iv_setting = 'TECH_COMP').
  endmethod.


  method set_tech_form.
    change_setting( iv_value = iv_value iv_setting = 'TECH_FORM').
  endmethod.


  method set_tipddictxt.
    change_setting( iv_value = iv_value iv_setting = 'TIPDDICTXT').
  endmethod.


  method set_tooltip.
    change_setting( iv_value = iv_value iv_setting = 'TOOLTIP').
  endmethod.


  method set_txt_field.
    change_setting( iv_value = iv_value iv_setting = 'TXT_FIELD').
  endmethod.


  method set_valexi.
    change_setting( iv_value = iv_value iv_setting = 'VALEXI').
  endmethod.


  method set_web_field.
    change_setting( iv_value = iv_value iv_setting = 'WEB_FIELD').
  endmethod.
ENDCLASS.
