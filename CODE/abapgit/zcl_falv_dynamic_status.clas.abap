class ZCL_FALV_DYNAMIC_STATUS definition
  public
  final
  create public .

public section.

  interfaces IF_OS_CLONE .

  types:
    begin of t_buttons,
        f01 type rsfunc_txt,
        f02 type rsfunc_txt,
        f03 type rsfunc_txt,
        f04 type rsfunc_txt,
        f05 type rsfunc_txt,
        f06 type rsfunc_txt,
        f07 type rsfunc_txt,
        f08 type rsfunc_txt,
        f09 type rsfunc_txt,
        f10 type rsfunc_txt,
        f11 type rsfunc_txt,
        f12 type rsfunc_txt,
        f13 type rsfunc_txt,
        f14 type rsfunc_txt,
        f15 type rsfunc_txt,
        f16 type rsfunc_txt,
        f17 type rsfunc_txt,
        f18 type rsfunc_txt,
        f19 type rsfunc_txt,
        f20 type rsfunc_txt,
        f21 type rsfunc_txt,
        f22 type rsfunc_txt,
        f23 type rsfunc_txt,
        f24 type rsfunc_txt,
        f25 type rsfunc_txt,
        f26 type rsfunc_txt,
        f27 type rsfunc_txt,
        f28 type rsfunc_txt,
        f29 type rsfunc_txt,
        f30 type rsfunc_txt,
        f31 type rsfunc_txt,
        f32 type rsfunc_txt,
        f33 type rsfunc_txt,
        f34 type rsfunc_txt,
        f35 type rsfunc_txt,
      end of t_buttons .
  types:
    begin of t_allowed_but,
        function type sy-ucomm,
      end of t_allowed_but .
  types:
    tt_excluded_but type standard table of sy-ucomm .
  types:
    tt_allowed_but type standard table of t_allowed_but .

  constants B_01 type SY-UCOMM value 'F01' ##NO_TEXT.
  constants B_02 type SY-UCOMM value 'F02' ##NO_TEXT.
  constants B_03 type SY-UCOMM value 'F03' ##NO_TEXT.
  constants B_04 type SY-UCOMM value 'F04' ##NO_TEXT.
  constants B_05 type SY-UCOMM value 'F05' ##NO_TEXT.
  constants B_06 type SY-UCOMM value 'F06' ##NO_TEXT.
  constants B_07 type SY-UCOMM value 'F07' ##NO_TEXT.
  constants B_08 type SY-UCOMM value 'F08' ##NO_TEXT.
  constants B_09 type SY-UCOMM value 'F09' ##NO_TEXT.
  constants B_10 type SY-UCOMM value 'F10' ##NO_TEXT.
  constants B_11 type SY-UCOMM value 'F11' ##NO_TEXT.
  constants B_12 type SY-UCOMM value 'F12' ##NO_TEXT.
  constants B_13 type SY-UCOMM value 'F13' ##NO_TEXT.
  constants B_14 type SY-UCOMM value 'F14' ##NO_TEXT.
  constants B_15 type SY-UCOMM value 'F15' ##NO_TEXT.
  constants B_16 type SY-UCOMM value 'F16' ##NO_TEXT.
  constants B_17 type SY-UCOMM value 'F17' ##NO_TEXT.
  constants B_18 type SY-UCOMM value 'F18' ##NO_TEXT.
  constants B_19 type SY-UCOMM value 'F19' ##NO_TEXT.
  constants B_20 type SY-UCOMM value 'F20' ##NO_TEXT.
  constants B_21 type SY-UCOMM value 'F21' ##NO_TEXT.
  constants B_22 type SY-UCOMM value 'F22' ##NO_TEXT.
  constants B_23 type SY-UCOMM value 'F23' ##NO_TEXT.
  constants B_24 type SY-UCOMM value 'F24' ##NO_TEXT.
  constants B_25 type SY-UCOMM value 'F25' ##NO_TEXT.
  constants B_26 type SY-UCOMM value 'F26' ##NO_TEXT.
  constants B_27 type SY-UCOMM value 'F27' ##NO_TEXT.
  constants B_28 type SY-UCOMM value 'F28' ##NO_TEXT.
  constants B_29 type SY-UCOMM value 'F29' ##NO_TEXT.
  constants B_30 type SY-UCOMM value 'F30' ##NO_TEXT.
  constants B_31 type SY-UCOMM value 'F31' ##NO_TEXT.
  constants B_32 type SY-UCOMM value 'F32' ##NO_TEXT.
  constants B_33 type SY-UCOMM value 'F33' ##NO_TEXT.
  constants B_34 type SY-UCOMM value 'F34' ##NO_TEXT.
  constants B_35 type SY-UCOMM value 'F35' ##NO_TEXT.
  data FULLY_DYNAMIC type ABAP_BOOL .
  data EXCLUDED_BUTTONS type TT_EXCLUDED_BUT .
  data BUTTONS type T_BUTTONS .

  methods CONSTRUCTOR .
  methods ADD_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM
      value(IV_TEXT) type SMP_DYNTXT-TEXT optional
      value(IV_ICON) type SMP_DYNTXT-ICON_ID optional
      value(IV_QINFO) type SMP_DYNTXT-QUICKINFO optional
      value(IV_ALLOWED) type ABAP_BOOL default ABAP_TRUE
    exceptions
      BUTTON_ALREADY_FILLED
      BUTTON_DOES_NOT_EXISTS
      ICON_AND_TEXT_EMPTY .
  methods HIDE_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods SHOW_BUTTON
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods GET_TOOLBAR
    exporting
      !E_TOOLBAR type T_BUTTONS .
  methods ADD_SEPARATOR
    importing
      value(IV_BUTTON) type SY-UCOMM .
  methods SHOW_TITLE
    importing
      value(IV_TEXT1) type STRING
      value(IV_TEXT2) type STRING optional
      value(IV_TEXT3) type STRING optional
      value(IV_TEXT4) type STRING optional
      value(IV_TEXT5) type STRING optional .
  methods SHOW_GUI_STATUS .
protected section.

  data ALLOWED_BUTTONS type TT_ALLOWED_BUT .
private section.
ENDCLASS.



CLASS ZCL_FALV_DYNAMIC_STATUS IMPLEMENTATION.


method add_button.
    data button type smp_dyntxt.
    check iv_button is not initial.

    if iv_text is initial and iv_icon is initial.
      raise icon_and_text_empty.
      return.
    endif.

    button-icon_id = iv_icon.
    button-icon_text = iv_text.
    button-text      = iv_text.
    button-quickinfo = iv_qinfo.

    assign component iv_button of structure buttons to field-symbol(<bt>).
    if <bt> is assigned.
      if <bt> is initial.
        <bt> = button.
        if iv_allowed eq abap_true.
          show_button( iv_button = iv_button ).
        endif.
      else.
        raise button_already_filled.
      endif.
    else.
      raise button_does_not_exists.
    endif.
  endmethod.


method add_separator.
    add_button(
      exporting
        iv_button              = iv_button
        iv_text                = |{ cl_abap_char_utilities=>minchar }|
*        iv_icon                = iv_icon
*        iv_qinfo               = iv_qinfo
         iv_allowed             = abap_true
      exceptions
        button_already_filled  = 1
        button_does_not_exists = 2
        icon_and_text_empty    = 3
        others                 = 4
    ).
    if sy-subrc <> 0.
*     message id sy-msgid type sy-msgty number sy-msgno
*                with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.
  endmethod.


method constructor.
    excluded_buttons = value #( ( b_01 ) ( b_02 ) ( b_03 ) ( b_04 ) ( b_05 ) ( b_06 ) ( b_07 ) ( b_08 ) ( b_09 )
                                ( b_10 ) ( b_11 ) ( b_12 ) ( b_13 ) ( b_14 ) ( b_15 ) ( b_16 ) ( b_17 ) ( b_18 ) ( b_19 )
                                ( b_20 ) ( b_21 ) ( b_22 ) ( b_23 ) ( b_24 ) ( b_25 ) ( b_26 ) ( b_27 ) ( b_28 ) ( b_29 )
                                ( b_30 ) ( b_31 ) ( b_32 ) ( b_33 ) ( b_34 ) ( b_35 )
                                ( zcl_falv=>mc_fc_data_save ) ( zcl_falv=>fc_find ) ( zcl_falv=>fc_find_next ) ( zcl_falv=>fc_first_page )
                                ( zcl_falv=>fc_last_page ) ( zcl_falv=>fc_next_page ) ( zcl_falv=>fc_previous_page ) ( zcl_falv=>fc_print ) ).
  endmethod.


method get_toolbar.
    e_toolbar = buttons.
  endmethod.


method hide_button.
    check iv_button is not initial.

    delete allowed_buttons where function = iv_button.
    append iv_button to excluded_buttons.

  endmethod.


method if_os_clone~clone.
    system-call objmgr clone me to result.
  endmethod.


method show_button.
    check iv_button is not initial.
    if not line_exists( allowed_buttons[ function = iv_button ] ).
      data(allowed) = value t_allowed_but( function = iv_button ).
      append allowed to allowed_buttons.
      delete excluded_buttons where table_line eq iv_button.
    endif.
  endmethod.


method show_gui_status.
    if sy-dynnr eq zcl_falv=>c_screen_full and fully_dynamic eq abap_true.
      set pf-status 'DYNAMIC_STATUS' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    elseif sy-dynnr eq zcl_falv=>c_screen_full.
      set pf-status 'DYNAMIC_STATUS_PART' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    else.
      set pf-status 'STATUS_0200' of program zcl_falv=>c_fscr_repid excluding excluded_buttons.
    endif.
  endmethod.


method show_title.
    set titlebar 'TITLE' of program zcl_falv=>c_fscr_repid with iv_text1 iv_text2 iv_text3 iv_text4 iv_text5.
  endmethod.
ENDCLASS.
