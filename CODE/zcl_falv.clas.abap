class zcl_falv definition
  public
  inheriting from cl_gui_alv_grid
  create private

  global friends zcl_falv_layout .

  public section.

    interfaces if_os_clone .
    interfaces if_alv_rm_grid_friend .

    types:
      begin of t_subcl_call,
        progname type progname,
        line     type i,
        column   type i,
        class    type string,
      end of t_subcl_call .
    types:
      tt_subcl_call type sorted table of t_subcl_call with unique key progname line column .
    types:
      begin of t_email,
        smtp_addr  type ad_smtpadr,
        express    type os_boolean,
        copy       type os_boolean,
        blind_copy type os_boolean,
      end of t_email .
    types:
      tt_email type table of t_email .
    constants version type string value '740.1.0.17' ##NO_TEXT.
    constants cc_name type char30 value 'CC_GRID' ##NO_TEXT.
    constants c_screen_popup type sy-dynnr value '0200' ##NO_TEXT.
    constants c_screen_full type sy-dynnr value '0100' ##NO_TEXT.
    constants c_fscr_repid type sy-repid value 'SAPLZFALV' ##NO_TEXT.
    data result type i read-only .
    data splitter_row_1_height type i read-only .
    data splitter_row_2_height type i read-only .
    data splitter_row_3_height type i read-only .
    constants fc_back type sy-ucomm value 'BACK' ##NO_TEXT.
    constants fc_up type sy-ucomm value 'UP' ##NO_TEXT.
    constants fc_exit type sy-ucomm value 'EXIT' ##NO_TEXT.
    constants fc_cancel type sy-ucomm value 'CANCEL' ##NO_TEXT.
    constants fc_mass_replace type sy-ucomm value 'MASS_REPL' ##NO_TEXT.
    constants fc_save type sy-ucomm value '&DATA_SAVE' ##NO_TEXT.
    constants fc_print type sy-ucomm value 'PRINT' ##NO_TEXT.
    constants fc_find type sy-ucomm value 'FIND' ##NO_TEXT.
    constants fc_find_next type sy-ucomm value 'FINDNEXT' ##NO_TEXT.
    constants fc_first_page type sy-ucomm value 'PGHOME' ##NO_TEXT.
    constants fc_last_page type sy-ucomm value 'PGEND' ##NO_TEXT.
    constants fc_previous_page type sy-ucomm value 'PGUP' ##NO_TEXT.
    constants fc_next_page type sy-ucomm value 'PGDOWN' ##NO_TEXT.
    constants button_normal type tb_btype value '0' ##NO_TEXT.
    constants button_menu_default type tb_btype value '1' ##NO_TEXT.
    constants button_menu type tb_btype value '2' ##NO_TEXT.
    constants button_separator type tb_btype value '3' ##NO_TEXT.
    constants button_radiobutton type tb_btype value '4' ##NO_TEXT.
    constants button_checkbox type tb_btype value '5' ##NO_TEXT.
    constants button_menu_entry type tb_btype value '6' ##NO_TEXT.
    data main_container type ref to cl_gui_container read-only .
    data split_container type ref to cl_gui_splitter_container .
    data main_split_container type ref to cl_gui_splitter_container .
    data top_of_page_container type ref to cl_gui_container .
    data variant type disvariant .
    data layout_save type char01 .
    data exclude_functions type ui_functions .
    data fcat type lvc_t_fcat .
    data sort type lvc_t_sort .
    data filter type lvc_t_filt .
    data lvc_layout type lvc_s_layo read-only .
    data layout type ref to zcl_falv_layout .
    data gui_status type ref to zcl_falv_dynamic_status .
    data screen type sy-dynnr read-only .
    data outtab type ref to data .
    data title_v1 type string .
    data title_v2 type string .
    data title_v3 type string .
    data title_v4 type string .
    data title_v5 type string .
    data delay_move_current_cell type i read-only value 20 ##NO_TEXT.
    data delay_change_selection type i read-only value 20 ##NO_TEXT.
    data top_of_page_height type i value 150 ##NO_TEXT.
    data error_log_height type i value 100 ##NO_TEXT.
    data grid type ref to cl_gui_alv_grid .

    class-methods create
      importing
        value(i_parent)          type ref to cl_gui_container optional
        value(i_applogparent)    type ref to cl_gui_container optional
        value(i_popup)           type abap_bool default abap_false
        value(i_applog_embedded) type abap_bool default abap_false
        value(i_subclass)        type ref to cl_abap_typedescr optional
      changing
        !ct_table                type standard table
      returning
        value(rv_falv)           type ref to zcl_falv .
    methods create_by_copy
      importing
        value(i_parent)       type ref to cl_gui_container optional
        value(i_applogparent) type ref to cl_gui_container optional
        value(i_popup)        type abap_bool default abap_false
      returning
        value(rv_falv)        type ref to zcl_falv .
    class-methods lvc_fcat_from_itab
      importing
        !it_table      type standard table
      returning
        value(rt_fcat) type lvc_t_fcat .
    methods pbo
      importing
        value(iv_dynnr) type sy-dynnr default sy-dynnr .
    methods pai
      importing
        value(iv_dynnr) type sy-dynnr default sy-dynnr
      changing
        !c_ucomm        type sy-ucomm default sy-ucomm .
    methods display
      importing
        value(iv_force_grid)   type abap_bool default space
        value(iv_start_row)    type i optional
        value(iv_start_column) type i optional
        value(iv_end_row)      type i optional
        value(iv_end_column)   type i optional .
    methods exclude_function
      importing
        value(iv_ucomm) type sy-ucomm .
    methods column
      importing
        value(iv_fieldname) type lvc_s_fcat-fieldname
      returning
        value(rv_column)    type ref to zcl_falv_column .
    methods soft_refresh .
    methods set_mark_field
      importing
        value(iv_fieldname) type lvc_s_fcat-fieldname .
    methods set_editable
      importing
        value(iv_modify) type abap_bool default abap_false .
    methods set_readonly .
    methods add_button
      importing
        value(iv_function)  type ui_func
        value(iv_icon)      type icon_d optional
        value(iv_quickinfo) type iconquick optional
        value(iv_butn_type) type tb_btype optional
        value(iv_disabled)  type abap_bool optional
        value(iv_text)      type text40 optional
        value(iv_checked)   type abap_bool optional .
    methods disable_button
      importing
        value(iv_function) type ui_func .
    methods enable_button
      importing
        value(iv_function) type ui_func .
    methods delete_button
      importing
        value(iv_function) type ui_func .
    methods delete_all_buttons
      importing
        value(iv_exceptions) type ttb_button optional.
    methods set_cell_disabled
      importing
        value(iv_fieldname) type fieldname
        value(iv_row)       type lvc_s_roid-row_id .
    methods set_cell_enabled
      importing
        value(iv_fieldname) type fieldname
        value(iv_row)       type lvc_s_roid-row_id .
    methods set_cell_button
      importing
        value(iv_fieldname) type fieldname
        value(iv_row)       type lvc_s_roid-row_id .
    methods set_cell_hotspot
      importing
        value(iv_fieldname) type fieldname
        value(iv_row)       type lvc_s_roid-row_id .
    methods set_row_color
      importing
        value(iv_color) type char04
        value(iv_row)   type lvc_s_roid-row_id .
    methods set_cell_color
      importing
        value(iv_fieldname) type fieldname
        value(iv_color)     type lvc_s_colo
        value(iv_row)       type lvc_s_roid-row_id .
    methods mass_replace .
    methods export_to_excel
      returning
        value(rv_xstring) type xstring .
    methods save_excel_localy
      importing
        value(iv_path)  type string optional
      returning
        value(rv_saved) type abap_bool .
    methods hide_top_of_page .
    methods show_top_of_page .
    methods set_list_view .
    methods encode_picture_base64
      importing
        value(iv_xstring)   type xstring
        value(iv_mime_type) type csequence
      returning
        value(rv_image)     type string .
    methods get_file_from_mime
      importing
        value(iv_path)      type string
      exporting
        value(ev_xstring)   type xstring
        value(ev_mime_type) type string .
    methods get_picture_from_se78
      importing
        value(iv_name)    type stxbitmaps-tdname
        value(iv_type)    type stxbitmaps-tdbtype default 'BCOL'
        value(iv_id)      type stxbitmaps-tdid default 'BMAP'
      returning
        value(rv_xstring) type xstring .
    methods send
      importing
        value(iv_subject)     type csequence optional
        value(iv_sender)      type ad_smtpadr optional
        value(iv_sender_name) type ad_smtpadr optional
        value(iv_filename)    type csequence optional
        value(it_recipients)  type tt_email
        value(iv_body)        type string optional
        value(iv_importance)  type bcs_docimp optional
        value(iv_sensitivity) type so_obj_sns optional
        value(iv_immediately) type abap_bool optional
        value(iv_commit)      type abap_bool default abap_true
      exceptions
        create_request_error
        create_document_error
        add_attachment_error
        add_document_error
        add_recipient_error
        add_sender_error
        send_error
        send_immediately_error .
    methods hide_applog .
    methods show_applog .
    "! Cell can be editable by layout, by field-catalog or by cell styles
    methods get_cell_enabled
      importing
        value(i_row)     type i
        value(i_field)   type lvc_fname
      returning
        value(r_enabled) type abap_bool.
    methods refresh_toolbar .

    methods set_frontend_fieldcatalog
        redefinition .
    methods set_frontend_layout
        redefinition .
  protected section.

    types t_column type ref to zcl_falv_column .

    data: toolbar_added      type ttb_button,
          toolbar_deleted    type ttb_button,
          toolbar_disabled   type ttb_button,
          toolbar_exceptions type ttb_button.
    data:
      columns type sorted table of t_column with unique key table_line .
    data built_in_screen type abap_bool .
    data application_log_embedded type abap_bool .
    data subclass_type type ref to cl_abap_typedescr .

    events at_set_pf_status .
    events at_set_title .

    methods evf_btn_click
          for event button_click of cl_gui_alv_grid
      importing
          !es_col_id
          !es_row_no .
    methods evf_user_command
          for event user_command of cl_gui_alv_grid
      importing
          !e_ucomm .
    methods evf_hotspot_click
          for event hotspot_click of cl_gui_alv_grid
      importing
          !e_row_id
          !e_column_id
          !es_row_no .
    methods evf_data_changed
          for event data_changed of cl_gui_alv_grid
      importing
          !er_data_changed
          !e_onf4
          !e_onf4_before
          !e_onf4_after
          !e_ucomm .
    methods evf_data_changed_finished
          for event data_changed_finished of cl_gui_alv_grid
      importing
          !e_modified
          !et_good_cells .
    methods evf_double_click
          for event double_click of cl_gui_alv_grid
      importing
          !e_row
          !e_column
          !es_row_no .
    methods evf_onf1
          for event onf1 of cl_gui_alv_grid
      importing
          !e_fieldname
          !es_row_no
          !er_event_data .
    methods evf_onf4
          for event onf4 of cl_gui_alv_grid
      importing
          !e_fieldname
          !e_fieldvalue
          !es_row_no
          !er_event_data
          !et_bad_cells
          !e_display .
    methods evf_subtotal_text
          for event subtotal_text of cl_gui_alv_grid
      importing
          !es_subtottxt_info
          !ep_subtot_line
          !e_event_data .
    methods evf_before_user_command
          for event before_user_command of cl_gui_alv_grid
      importing
          !e_ucomm .
    methods evf_after_user_command
          for event after_user_command of cl_gui_alv_grid
      importing
          !e_ucomm
          !e_saved
          !e_not_processed .
    methods evf_menu_button
          for event menu_button of cl_gui_alv_grid
      importing
          !e_object
          !e_ucomm .
    methods evf_toolbar
          for event toolbar of cl_gui_alv_grid
      importing
          !e_object
          !e_interactive .
    methods evf_after_refresh
        for event after_refresh of cl_gui_alv_grid .
    methods evf_top_of_page
          for event top_of_page of cl_gui_alv_grid
      importing
          !e_dyndoc_id
          !table_index .
    methods evf_delayed_callback
        for event delayed_callback of cl_gui_alv_grid .
    methods evf_delayed_changed_sel_call
        for event delayed_changed_sel_callback of cl_gui_alv_grid .
    methods evf_ondropgetflavor
          for event ondropgetflavor of cl_gui_alv_grid
      importing
          !es_row_no
          !e_column
          !e_dragdropobj
          !e_flavors
          !e_row .
    methods evf_ondrag
          for event ondrag of cl_gui_alv_grid
      importing
          !es_row_no
          !e_column
          !e_dragdropobj
          !e_row .
    methods evf_ondrop
          for event ondrop of cl_gui_alv_grid
      importing
          !es_row_no
          !e_column
          !e_dragdropobj
          !e_row .
    methods evf_ondropcomplete
          for event ondropcomplete of cl_gui_alv_grid
      importing
          !es_row_no
          !e_column
          !e_dragdropobj
          !e_row .
    methods evf_drop_external_file
          for event drop_external_files of cl_gui_alv_grid
      importing
          !files .
    methods evf_toolbar_menubutton_click
          for event toolbar_menubutton_click of cl_gui_alv_grid
      importing
          !fcode
          !menu_pos_x
          !menu_pos_y .
    methods evf_click_col_header
          for event click_col_header of cl_gui_alv_grid
      importing
          !col_id .
    methods evf_delayed_move_current_cell
        for event delayed_move_current_cell of cl_gui_alv_grid .
    methods evf_f1
        for event f1 of cl_gui_alv_grid .
    methods evf_dblclick_row_col
          for event dblclick_row_col of cl_gui_alv_grid
      importing
          !col_id
          !row_id .
    methods evf_click_row_col
          for event click_row_col of cl_gui_alv_grid
      importing
          !col_id
          !row_id .
    methods evf_toolbar_button_click
          for event toolbar_button_click of cl_gui_alv_grid
      importing
          !fcode .
    methods evf_double_click_col_separator
          for event double_click_col_separator of cl_gui_alv_grid
      importing
          !col_id .
    methods evf_delayed_change_selection
        for event delayed_change_selection of cl_gui_alv_grid .
    methods evf_context_menu
        for event context_menu of cl_gui_alv_grid .
    methods evf_total_click_row_col
          for event total_click_row_col of cl_gui_alv_grid
      importing
          !col_id
          !row_id .
    methods evf_context_menu_selected
          for event context_menu_selected of cl_gui_alv_grid
      importing
          !fcode .
    methods evf_toolbar_menu_selected
          for event toolbar_menu_selected of cl_gui_alv_grid
      importing
          !fcode .
    methods evf_request_data
          for event _request_data of cl_gui_alv_grid
      importing
          !fragments .
    methods evf_at_set_pf_status
        for event at_set_pf_status of zcl_falv .
    methods evf_at_set_title
        for event at_set_title of zcl_falv .
  private section.

    data top_of_page_doc type ref to cl_dd_document .
    data top_of_page_visible_at_start type abap_bool .

    class-methods check_if_called_from_subclass
      returning
        value(ro_subclass) type ref to object .

    methods evf_before_ucommand_internal
          for event before_user_command of cl_gui_alv_grid
      importing
          !e_ucomm .
    methods evf_toolbar_internal
          for event toolbar of cl_gui_alv_grid
      importing
          !e_object
          !e_interactive .
    methods evf_data_changed_internal
          for event data_changed of cl_gui_alv_grid
      importing
          !er_data_changed
          !e_onf4
          !e_onf4_before
          !e_onf4_after
          !e_ucomm .
    methods evf_user_command_internal
          for event user_command of cl_gui_alv_grid
      importing
          !e_ucomm .
    methods set_parent
      importing
        !io_parent type ref to object .
    methods constructor
      importing
        value(i_shellstyle)  type i default 0
        value(i_lifetime)    type i optional
        value(i_parent)      type ref to cl_gui_container optional
        value(i_appl_events) type char01 default space
        !i_parentdbg         type ref to cl_gui_container optional
        !i_applogparent      type ref to cl_gui_container optional
        !i_graphicsparent    type ref to cl_gui_container optional
        value(i_name)        type string optional
        !i_fcat_complete     type sap_bool default space
      exceptions
        error_cntl_create
        error_cntl_init
        error_cntl_link
        error_dp_create .
    methods set_output_table
      changing
        !ct_table type standard table .
    methods build_columns .
    methods raise_top_of_page .
endclass.



class zcl_falv implementation.


  method add_button.
    if not line_exists( toolbar_added[ function = iv_function ] ).
      insert value #( function = iv_function
                      icon = conv #( iv_icon )
                      quickinfo = iv_quickinfo
                      butn_type = iv_butn_type
                      disabled = iv_disabled
                      text = iv_text
                      checked = iv_checked
                        ) into table toolbar_added .

      delete toolbar_deleted where function = iv_function.
      me->refresh_toolbar( ).
    endif.

  endmethod.


  method build_columns.
    loop at fcat assigning field-symbol(<fcat>).
      data(column) = new zcl_falv_column( iv_fieldname = <fcat>-fieldname io_falv = me ).
      insert column into table columns.
    endloop.
  endmethod.


  method check_if_called_from_subclass.
    data: callstack      type abap_callstack,
          src            type table of string,
          tokens         type table of stokes,
          statements     type table of sstmnt.

    call function 'SYSTEM_CALLSTACK'
      importing
        callstack = callstack.

    assign callstack[ 3 ] to field-symbol(<stack>).
    check sy-subrc eq 0.

    data(compiler) = cl_abap_compiler=>create(
                    p_name             =  <stack>-mainprogram
                    p_include          =  <stack>-include
                    p_no_package_check = abap_true ).

    compiler->get_single_ref(
      exporting
        p_full_name       =  '\TY:ZCL_FALV\ME:CREATE'
        p_grade           =  1   " Grade of Use
      importing
        p_result          =    data(falv_references) " Where-Used List
      exceptions
        others            = 5
    ).
    if sy-subrc eq 0.
      read report <stack>-mainprogram into src.

      scan abap-source src
                tokens      into tokens
                statements  into statements
                include program from <stack>-mainprogram
                frame   program from <stack>-mainprogram
                with comments
                with includes.

      assign src[ <stack>-line ] to field-symbol(<line>).
      if <line> is assigned.
        assign falv_references[ line = <stack>-line ] to field-symbol(<reference>).
        if sy-subrc eq 0.
          data: subclass_name type string.
          do.
            data(offset) = <reference>-column - sy-index - 2. "-2 because of =>
            if offset lt 0 or <line>+offset(1) eq ` `.
              exit.
            endif.
            subclass_name =  <line>+offset(1) && subclass_name.
          enddo.
          cl_abap_classdescr=>describe_by_name( exporting p_name = to_upper( subclass_name )
                                                receiving p_descr_ref = ro_subclass
                                                        exceptions type_not_found = 1 ).
          if sy-subrc eq 0.
            return.
          endif.
        endif.
      endif.
    endif.

  endmethod.


  method column.
    try.
        rv_column = columns[  table_line->fieldname = iv_fieldname ].
      catch cx_sy_itab_line_not_found.

    endtry.
  endmethod.


  method constructor.
    super->constructor(
      exporting
        i_shellstyle      = i_shellstyle    " Control Style
        i_lifetime        = i_lifetime    " Lifetime
        i_parent          = i_parent    " Parent Container
        i_appl_events     = i_appl_events    " Register Events as Application Events
        i_parentdbg       = i_parentdbg    " Internal, Do not Use
        i_applogparent    = i_applogparent    " Container for Application Log
        i_graphicsparent  = i_graphicsparent    " Container for Graphics
        i_name            = i_name    " Name
        i_fcat_complete   = i_fcat_complete  " Boolean Variable (X=True, Space=False)
      exceptions
        error_cntl_create = 1
        error_cntl_init   = 2
        error_cntl_link   = 3
        error_dp_create   = 4
        others            = 5
    ).
    if sy-subrc <> 0.
      case sy-subrc.
        when 1.
          raise error_cntl_create.
        when 2.
          raise error_cntl_init.
        when 3.
          raise error_cntl_link.
        when 4.
          raise error_dp_create.
      endcase.
    endif.
  endmethod.


  method create.
    data: built_in_screen type abap_bool.
    data: main_parent type ref to cl_gui_container.
    data: parent type ref to cl_gui_container.
    data: applog type ref to cl_gui_container.
    data: top_of_page_parent type ref to cl_gui_container.
    data: docking_parent type ref to cl_gui_docking_container.

    if i_subclass is initial.
      i_subclass ?= check_if_called_from_subclass( ).
    endif.

    if cl_gui_alv_grid=>offline( ) is not initial.
      main_parent ?= docking_parent.
    endif.
    "We need to call full screen ALV as container was not passed
    if i_parent is initial.

      built_in_screen = abap_true.
      try.

          if cl_gui_alv_grid=>offline( ) is initial.
            data(custom_container) = cast cl_gui_container( new cl_gui_custom_container(
                      container_name = cc_name
                      dynnr          = switch #( i_popup when abap_true then c_screen_popup
                                                         when abap_false then c_screen_full )
                      repid          = c_fscr_repid
                      no_autodef_progid_dynnr = abap_true
                      ) ).
            main_parent ?= custom_container.


            " Create split container, log at bottom, grid at top.
            "Log hidden as default, will appear when error will be thrown.
            data(main_split_container) = new cl_gui_splitter_container(
                link_dynnr              = switch #( i_popup when abap_true then c_screen_popup
                                                            when abap_false then c_screen_full )
                link_repid              = c_fscr_repid
                 parent                  = main_parent
                 rows                    = cond #( when  i_applog_embedded eq abap_true then 2
                                                   else 1 )
                 columns                 = 1
            ).
            data(split_container) = new cl_gui_splitter_container(
              parent                  = main_split_container->get_container( row = 1 column    = 1 )
              rows                    = 2
              columns                 = 1
         ).

            parent ?= split_container->get_container( row = 2 column    = 1 ).
            applog ?= main_split_container->get_container( row = 2 column    = 1 ).
            top_of_page_parent ?= split_container->get_container( row = 1 column    = 1 ).
          else.

            parent ?= main_parent.
            custom_container ?= parent.

          endif.

        catch cx_root.
          "Something is wrong...
      endtry.
    else.
      if cl_gui_alv_grid=>offline( ) is not initial.

        parent ?= main_parent.
        custom_container ?= parent.

      else.

        applog ?= i_applogparent.

        custom_container ?= i_parent.

        main_split_container = new cl_gui_splitter_container(
             parent                  = custom_container
             rows                    = cond #( when  i_applog_embedded eq abap_true then 2
                                               else 1 )
             columns                 = 1
        ).

        split_container = new cl_gui_splitter_container(
             parent                  = main_split_container->get_container( row = 1 column    = 1 )
             rows                    = 2
             columns                 = 1
        ).
        if applog is initial.
          parent ?= split_container->get_container( row = 2 column    = 1 ).
          applog ?= main_split_container->get_container( row = 2 column  = 1 ).
          top_of_page_parent ?= split_container->get_container( row = 1 column    = 1 ).
        else.
          parent ?= split_container->get_container( row = 2 column    = 1 ).
          top_of_page_parent ?= split_container->get_container( row = 1 column    = 1 ).
          custom_container ?= i_parent.
        endif.

      endif.

    endif.
    if i_subclass is not initial.
      data: subclass type ref to object.
      data(sublcass_abs_name) = i_subclass->absolute_name.
      create object subclass type (sublcass_abs_name)
       exporting
        i_parent       = parent
        i_applogparent = applog.
      rv_falv ?= subclass.
      rv_falv->subclass_type = i_subclass.

    else.
      create object rv_falv
        exporting
          i_parent       = parent
          i_applogparent = applog.

    endif.


    rv_falv->set_delay_change_selection(
      exporting
        time   =  rv_falv->delay_change_selection
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.

    rv_falv->set_delay_move_current_cell(
      exporting
       time   = rv_falv->delay_move_current_cell
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.



    set handler rv_falv->evf_after_refresh for rv_falv.
    set handler rv_falv->evf_after_user_command for rv_falv.
    set handler rv_falv->evf_before_ucommand_internal for rv_falv.
    set handler rv_falv->evf_before_user_command for rv_falv.
    set handler rv_falv->evf_btn_click for rv_falv.
    set handler rv_falv->evf_data_changed for rv_falv.
    set handler rv_falv->evf_data_changed_internal for rv_falv.
    set handler rv_falv->evf_data_changed_finished for rv_falv.
    set handler rv_falv->evf_double_click for rv_falv.
    set handler rv_falv->evf_hotspot_click for rv_falv.
    set handler rv_falv->evf_menu_button for rv_falv.
    set handler rv_falv->evf_onf1 for rv_falv.
    set handler rv_falv->evf_onf4 for rv_falv.
    set handler rv_falv->evf_subtotal_text for rv_falv.
    set handler rv_falv->evf_toolbar_internal for rv_falv.
    set handler rv_falv->evf_toolbar for rv_falv.
    set handler rv_falv->evf_user_command for rv_falv.
    set handler rv_falv->evf_user_command_internal for rv_falv.
    set handler rv_falv->evf_at_set_pf_status for rv_falv.
    set handler rv_falv->evf_at_set_title for rv_falv.
    set handler rv_falv->evf_top_of_page for rv_falv.
    set handler rv_falv->evf_delayed_callback for rv_falv.
    set handler rv_falv->evf_delayed_changed_sel_call for rv_falv.
    set handler rv_falv->evf_ondrag for rv_falv.
    set handler rv_falv->evf_ondrop for rv_falv.
    set handler rv_falv->evf_ondropcomplete for rv_falv.
    set handler rv_falv->evf_ondropgetflavor for rv_falv.
    set handler rv_falv->evf_drop_external_file for rv_falv.
    set handler rv_falv->evf_toolbar_menubutton_click for rv_falv.
    set handler rv_falv->evf_click_col_header for rv_falv.
    set handler rv_falv->evf_delayed_move_current_cell for rv_falv.
    set handler rv_falv->evf_f1 for rv_falv.
    set handler rv_falv->evf_dblclick_row_col for rv_falv.
    set handler rv_falv->evf_click_row_col for rv_falv.
    set handler rv_falv->evf_toolbar_button_click for rv_falv.
    set handler rv_falv->evf_double_click_col_separator for rv_falv.
    set handler rv_falv->evf_delayed_change_selection for rv_falv.
    set handler rv_falv->evf_context_menu for rv_falv.
    set handler rv_falv->evf_total_click_row_col for rv_falv.
    set handler rv_falv->evf_context_menu_selected for rv_falv.
    set handler rv_falv->evf_toolbar_menu_selected for rv_falv.
    set handler rv_falv->evf_request_data for rv_falv.





    rv_falv->set_output_table( changing ct_table = ct_table ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = ct_table ).
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = rv_falv->fcat ).
    rv_falv->application_log_embedded = i_applog_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
    rv_falv->layout = new zcl_falv_layout( rv_falv ).

    rv_falv->gui_status = new zcl_falv_dynamic_status( ).
    rv_falv->screen = switch #( i_popup when abap_true then c_screen_popup
                                        when abap_false then c_screen_full ).
    if built_in_screen eq abap_true and rv_falv->screen eq c_screen_full.
      "default in full screen
      rv_falv->layout->set_no_toolbar( abap_true ).
    endif.
    rv_falv->main_container ?= custom_container.
    rv_falv->split_container = split_container.
    rv_falv->main_split_container = main_split_container.
    rv_falv->top_of_page_container = top_of_page_parent.
    if main_split_container is not initial.
      main_split_container->set_row_mode(
        exporting
          mode              =  split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0
      ).
      rv_falv->hide_applog( ).
    endif.
    if split_container is not initial.
      split_container->set_row_mode(
        exporting
          mode              =  split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0
      ).
      rv_falv->hide_top_of_page( ).
    endif.

    rv_falv->layout_save = 'A'.
    rv_falv->variant-report = sy-cprog.
    rv_falv->variant-username = sy-uname.
    rv_falv->grid = cast #(  rv_falv ).
  endmethod.


  method create_by_copy.
    data: built_in_screen type abap_bool.
    data: main_parent type ref to cl_gui_container.
    data: parent type ref to cl_gui_container.
    data: applog type ref to cl_gui_container.
    data: top_of_page_parent type ref to cl_gui_container.
    data: docking_parent type ref to cl_gui_docking_container.

    if cl_gui_alv_grid=>offline( ) is not initial.
      main_parent  ?= docking_parent.
    endif.

    "We need to call full screen ALV as container was not passed
    if i_parent is initial.
      built_in_screen = abap_true.
      try.
          if cl_gui_alv_grid=>offline( ) is initial.
            data(custom_container) = cast cl_gui_container( new cl_gui_custom_container(
                      container_name = cc_name
                      dynnr          = switch #( i_popup when abap_true then c_screen_popup
                                                         when abap_false then c_screen_full )
                      repid          = c_fscr_repid
                      no_autodef_progid_dynnr = abap_true
                      ) ).
            main_parent ?= custom_container.
            " Create split container, log at bottom, grid at top.
            "Log hidden as default, will appear when error will be thrown.
            data(main_split_container) = new cl_gui_splitter_container(
                 parent                  = main_parent
                 rows                    = cond #( when  application_log_embedded eq abap_true then 2
                                                      else 1 )
                 columns                 = 1  ).
            data(split_container) = new cl_gui_splitter_container(
                 parent                  = main_split_container->get_container( row = 1 column    = 1 )
                 rows                    = 2
                 columns                 = 1  ).

            parent ?= split_container->get_container( row = 2 column    = 1 ).
            applog ?= main_split_container->get_container( row = 2 column    = 1 ).
            top_of_page_parent ?= split_container->get_container( row = 1 column    = 1 ).
          else.

            parent ?= main_parent.
            custom_container ?= parent.

          endif.
        catch cx_root.
          "Something is wrong...
      endtry.
    else.

      if cl_gui_alv_grid=>offline( ) is initial.

        main_parent ?= i_parent.
        parent ?= main_parent.

        main_split_container = new cl_gui_splitter_container(
                parent                  = main_parent
                rows                    = cond #( when   application_log_embedded eq abap_true then 2
                                                  else 1 )
                columns                 = 1
           ).

        split_container = new cl_gui_splitter_container(
                parent                  = main_split_container->get_container( row = 1 column    = 1 )
                rows                    = 2
                columns                 = 1
           ).

        parent ?= split_container->get_container( row = 2 column    = 1 ).
        if i_applogparent is initial.
          applog ?= main_split_container->get_container( row = 2 column    = 1 ).
        endif.
        top_of_page_parent ?= split_container->get_container( row = 1 column    = 1 ).

      else.

        parent ?= main_parent.
        custom_container ?= parent.

      endif.

    endif.

    if me->subclass_type is not initial.
      data: subclass type ref to object.
      data(sublcass_abs_name) = subclass_type->absolute_name.
      create object subclass type (sublcass_abs_name)
       exporting
        i_parent       = parent
        i_applogparent = applog.

      rv_falv ?= subclass.
      rv_falv->subclass_type = subclass_type.
    else.
      create object rv_falv
        exporting
          i_parent       = parent
          i_applogparent = applog.
    endif.


    set handler rv_falv->evf_after_refresh for rv_falv.
    set handler rv_falv->evf_after_user_command for rv_falv.
    set handler rv_falv->evf_before_ucommand_internal for rv_falv.
    set handler rv_falv->evf_before_user_command for rv_falv.
    set handler rv_falv->evf_btn_click for rv_falv.
    set handler rv_falv->evf_data_changed for rv_falv.
    set handler rv_falv->evf_data_changed_internal for rv_falv.
    set handler rv_falv->evf_data_changed_finished for rv_falv.
    set handler rv_falv->evf_double_click for rv_falv.
    set handler rv_falv->evf_hotspot_click for rv_falv.
    set handler rv_falv->evf_menu_button for rv_falv.
    set handler rv_falv->evf_onf1 for rv_falv.
    set handler rv_falv->evf_onf4 for rv_falv.
    set handler rv_falv->evf_subtotal_text for rv_falv.
    set handler rv_falv->evf_toolbar_internal for rv_falv.
    set handler rv_falv->evf_toolbar for rv_falv.
    set handler rv_falv->evf_user_command for rv_falv.
    set handler rv_falv->evf_user_command_internal for rv_falv.
    set handler rv_falv->evf_at_set_pf_status for rv_falv.
    set handler rv_falv->evf_at_set_title for rv_falv.
    set handler rv_falv->evf_top_of_page for rv_falv.
    set handler rv_falv->evf_delayed_callback for rv_falv.
    set handler rv_falv->evf_delayed_changed_sel_call for rv_falv.
    set handler rv_falv->evf_ondrag for rv_falv.
    set handler rv_falv->evf_ondrop for rv_falv.
    set handler rv_falv->evf_ondropcomplete for rv_falv.
    set handler rv_falv->evf_ondropgetflavor for rv_falv.
    set handler rv_falv->evf_drop_external_file for rv_falv.
    set handler rv_falv->evf_toolbar_menubutton_click for rv_falv.
    set handler rv_falv->evf_click_col_header for rv_falv.
    set handler rv_falv->evf_delayed_move_current_cell for rv_falv.
    set handler rv_falv->evf_f1 for rv_falv.
    set handler rv_falv->evf_dblclick_row_col for rv_falv.
    set handler rv_falv->evf_click_row_col for rv_falv.
    set handler rv_falv->evf_toolbar_button_click for rv_falv.
    set handler rv_falv->evf_double_click_col_separator for rv_falv.
    set handler rv_falv->evf_delayed_change_selection for rv_falv.
    set handler rv_falv->evf_context_menu for rv_falv.
    set handler rv_falv->evf_total_click_row_col for rv_falv.
    set handler rv_falv->evf_context_menu_selected for rv_falv.
    set handler rv_falv->evf_toolbar_menu_selected for rv_falv.
    set handler rv_falv->evf_request_data for rv_falv.

    rv_falv->set_delay_change_selection(
      exporting
        time   =  me->delay_change_selection
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.

    rv_falv->set_delay_move_current_cell(
      exporting
       time   = me->delay_move_current_cell
      exceptions
        error  = 1
        others = 2
    ).
    if sy-subrc <> 0.
    endif.


    field-symbols: <outtab> type standard table.
    assign me->outtab->* to <outtab>.
    rv_falv->set_output_table( changing ct_table = <outtab> ).
    rv_falv->fcat = rv_falv->lvc_fcat_from_itab( it_table = <outtab> ).
    rv_falv->sort = me->sort.
    rv_falv->filter = me->filter.
    rv_falv->set_frontend_fieldcatalog( it_fieldcatalog = me->fcat ).
    rv_falv->application_log_embedded = application_log_embedded.
    rv_falv->built_in_screen = built_in_screen.
    rv_falv->build_columns( ).
    rv_falv->layout = new zcl_falv_layout( io_falv = rv_falv ).
    rv_falv->gui_status ?= me->gui_status->if_os_clone~clone( ). "clone object
    rv_falv->lvc_layout = me->lvc_layout.
    rv_falv->variant = me->variant.
    rv_falv->screen = switch #( i_popup when abap_true then c_screen_popup
                                        when abap_false then c_screen_full ).

    rv_falv->main_container ?= custom_container.
    rv_falv->split_container = split_container.
    rv_falv->main_split_container = main_split_container.
    rv_falv->top_of_page_container = top_of_page_parent.
    rv_falv->top_of_page_height = me->top_of_page_height.
    rv_falv->top_of_page_visible_at_start = me->top_of_page_visible_at_start.
    if main_split_container is not initial.
      main_split_container->set_row_mode(
        exporting
          mode              =  split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0   ).
      rv_falv->hide_applog( ).
    endif.
    if split_container is not initial.
      split_container->set_row_mode(
        exporting
          mode              =  split_container->mode_absolute
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0
      ).
      rv_falv->hide_top_of_page( ).
    endif.
    rv_falv->title_v1 = me->title_v1.
    rv_falv->title_v2 = me->title_v2.
    rv_falv->title_v3 = me->title_v3.
    rv_falv->title_v4 = me->title_v4.
    rv_falv->exclude_functions = me->exclude_functions.
    rv_falv->toolbar_added = me->toolbar_added.
    rv_falv->toolbar_deleted = me->toolbar_deleted.
    rv_falv->toolbar_disabled = me->toolbar_disabled.
    rv_falv->m_batch_mode = me->m_batch_mode.
    rv_falv->grid = cast #( rv_falv ).
    rv_falv->layout->delete_all_buttons = me->layout->delete_all_buttons.
    rv_falv->layout->mark_field = me->layout->mark_field.
  endmethod.


  method delete_all_buttons.
    layout->delete_all_buttons = abap_true.
    if iv_exceptions is initial.
      append lines of mt_toolbar to toolbar_deleted.
      refresh toolbar_added.
    else.
      toolbar_exceptions = iv_exceptions.
      loop at mt_toolbar assigning field-symbol(<tlb>).
        if not line_exists( iv_exceptions[ function = <tlb>-function ] ).
          append <tlb> to toolbar_deleted.
          delete toolbar_added where function eq <tlb>-function.
        endif.
      endloop.
    endif.
    append lines of toolbar_deleted to exclude_functions.
    me->refresh_toolbar( ).
  endmethod.


  method delete_button.
    delete toolbar_added where function = iv_function.
    if sy-subrc ne 0.
      insert value #( function = iv_function ) into table toolbar_deleted.
      if sy-subrc ne 0.
      endif.
    endif.
    me->refresh_toolbar( ).
  endmethod.


  method disable_button.
    try.
        toolbar_added[ function = iv_function ]-disabled = abap_true.
      catch cx_sy_itab_line_not_found.
    endtry.
    insert value #( function = iv_function ) into table toolbar_disabled.
    if sy-subrc ne 0.
    endif.
    me->refresh_toolbar( ).
  endmethod.


  method display.
    field-symbols: <outtab> type standard table.
    if me->title_v1 is initial.
      me->title_v1 = sy-title. " for lazy people who wants to have alv title to be equal one from report.
    endif.
    if built_in_screen eq abap_true and iv_force_grid eq abap_false.
      if screen eq c_screen_popup and iv_start_row is initial
                                  and iv_start_column is initial
                                  and iv_end_row is initial
                                  and iv_end_column is initial.
        iv_start_row = 1.
        iv_start_column = 1.
        iv_end_row = 20.
        iv_end_column = 150.
      endif.
      call function 'Z_FALV_DISPLAY'
        exporting
          io_falv         = me
          iv_start_row    = iv_start_row
          iv_start_column = iv_start_column
          iv_end_row      = iv_end_row
          iv_end_column   = iv_end_column.
      .
    else.
      assign outtab->* to <outtab>.
      me->set_table_for_first_display(
        exporting
*            i_buffer_active               =     " Buffering Active
*            i_bypassing_buffer            =     " Switch Off Buffer
*            i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*            i_structure_name              =     " Internal Output Table Structure Name
          is_variant                     =     variant
          i_save                        =      layout_save
*            i_default                     = 'X'    " Default Display Variant
          is_layout                     =      lvc_layout
*            is_print                      =     " Print Control
*            it_special_groups            =     " Field Groups
          it_toolbar_excluding          =     exclude_functions
*            it_hyperlink                  =     " Hyperlinks
*            it_alv_graphics               =     " Table of Structure DTC_S_TC
*            it_except_qinfo               =     " Table for Exception Quickinfo
*            ir_salv_adapter               =     " Interface ALV Adapter
        changing
          it_outtab                     =    <outtab> " Output Table
          it_fieldcatalog               =     fcat
          it_sort                       =     sort " Sort Criteria
          it_filter                     =     filter " Filter Criteria
        exceptions
          invalid_parameter_combination = 1
          program_error                 = 2
          too_many_lines                = 3
          others                        = 4
      ).
      if sy-subrc eq 0.
        if layout->delete_all_buttons eq abap_true.
          delete_all_buttons( toolbar_exceptions ).
        endif.
        if split_container is not initial.
          split_container->set_focus(
            exporting
              control           =     me
            exceptions
              cntl_error        = 0
              cntl_system_error = 0
              others            = 0 ).
          me->hide_applog( ).
        else.
          me->parent->set_focus(
            exporting
              control           =  me
            exceptions
              cntl_error        = 0
              cntl_system_error = 0
              others            = 0  ).
        endif.
        cl_gui_cfw=>flush(
          exceptions
            cntl_system_error = 0
            cntl_error        = 0
            others            = 0 ).
        me->set_visible( abap_true ).
        me->parent->set_visible( abap_true ).
        me->main_container->set_visible( abap_true ).
        if me->split_container is not initial.
          me->split_container->set_visible( abap_true ).
        endif.
        me->raise_top_of_page( ).
      endif.
    endif.
  endmethod.


  method enable_button.
    try.
        toolbar_added[ function = iv_function ]-disabled = abap_false.
      catch cx_sy_itab_line_not_found.
    endtry.
    delete toolbar_disabled where function = iv_function.
    me->refresh_toolbar( ).
  endmethod.


  method encode_picture_base64.

    rv_image = |<img src="data:{ iv_mime_type };base64,{ cl_http_utility=>encode_x_base64( unencoded = iv_xstring ) }">|.

  endmethod.


  method evf_after_refresh.
  endmethod.


  method evf_after_user_command.
  endmethod.


  method evf_at_set_pf_status.
  endmethod.


  method evf_at_set_title.
  endmethod.


  method evf_before_ucommand_internal.
    field-symbols: <outtab> type standard table.
    case e_ucomm.
      when me->mc_fc_select_all.
        if layout->mark_field is not initial and
           line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          assign outtab->* to <outtab>.
          loop at <outtab> assigning field-symbol(<line>).
            assign component layout->mark_field of structure <line> to field-symbol(<mark>).
            if sy-subrc eq 0 and me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) eq abap_true.
              <mark> = abap_true.
            endif.
          endloop.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        endif.
      when me->mc_fc_deselect_all.
        if layout->mark_field is not initial and
          line_exists( fcat[ fieldname = layout->mark_field checkbox = abap_true ] ).
          assign outtab->* to <outtab>.
          loop at <outtab> assigning <line>.
            assign component layout->mark_field of structure <line> to <mark>.
            if sy-subrc eq 0 and me->get_cell_enabled( i_row = sy-tabix i_field = layout->mark_field ) eq abap_true.
              <mark> = abap_false.
            endif.
          endloop.
          me->soft_refresh( ).
          set_user_command( i_ucomm = space ).
        endif.
    endcase.
  endmethod.


  method evf_before_user_command.
  endmethod.


  method evf_btn_click.
  endmethod.


  method evf_click_col_header.

  endmethod.


  method evf_click_row_col.

  endmethod.


  method evf_context_menu.

  endmethod.


  method evf_context_menu_selected.

  endmethod.


  method evf_data_changed.

  endmethod.


  method evf_data_changed_finished.
  endmethod.


  method evf_data_changed_internal.

    if er_data_changed->mt_protocol is not initial.
      show_applog( ).
    else.
      hide_applog( ).
    endif.

    "This lines makes that focus stays on grid
    "while embedded error log appears on the screen.
    "This trick will not work if someone will use own handler
    "for data_changed instead of evf_data_changed
    me->m_display_protocol = abap_true.

    er_data_changed->display_protocol( ).

    cl_gui_control=>set_focus(
      exporting
        control           =  cast #( me )
      exceptions
        cntl_error        = 1
        cntl_system_error = 2
        others            = 3
    ).
    if sy-subrc eq 0.
      me->m_display_protocol = abap_false.
    endif.

  endmethod.


  method evf_dblclick_row_col.

  endmethod.


  method evf_delayed_callback.

  endmethod.


  method evf_delayed_changed_sel_call.

  endmethod.


  method evf_delayed_change_selection.

  endmethod.


  method evf_delayed_move_current_cell.

  endmethod.


  method evf_double_click.
  endmethod.


  method evf_double_click_col_separator.

  endmethod.


  method evf_drop_external_file.

  endmethod.


  method evf_f1.

  endmethod.


  method evf_hotspot_click.
  endmethod.


  method evf_menu_button.
  endmethod.


  method evf_ondrag.

  endmethod.


  method evf_ondrop.

  endmethod.


  method evf_ondropcomplete.

  endmethod.


  method evf_ondropgetflavor.

  endmethod.


  method evf_onf1.
  endmethod.


  method evf_onf4.
  endmethod.


  method evf_request_data.

  endmethod.


  method evf_subtotal_text.
  endmethod.


  method evf_toolbar.

  endmethod.


  method evf_toolbar_button_click.

  endmethod.


  method evf_toolbar_internal.
    loop at toolbar_added assigning field-symbol(<tb>).
      insert <tb> into table e_object->mt_toolbar[].
    endloop.
    loop at toolbar_disabled assigning <tb>.
      try.
          e_object->mt_toolbar[ function = <tb>-function ]-disabled = abap_true.
        catch cx_sy_itab_line_not_found.

      endtry.
    endloop.
    loop at toolbar_deleted assigning <tb>.
      data(tabix) = sy-tabix.
      delete e_object->mt_toolbar where function = <tb>-function.
      if sy-subrc ne 0.
      endif.
    endloop.

  endmethod.


  method evf_toolbar_menubutton_click.

  endmethod.


  method evf_toolbar_menu_selected.

  endmethod.


  method evf_top_of_page.

  endmethod.


  method evf_total_click_row_col.

  endmethod.


  method evf_user_command.
    case e_ucomm.
      when fc_back.
        leave to screen 0.
      when fc_exit.
        leave to screen 0.
      when fc_up.
        leave to screen 0.
      when fc_cancel.
        leave to screen 0.
      when fc_mass_replace.
        mass_replace( ).
    endcase.
  endmethod.


  method evf_user_command_internal.
*    "TODO add check if function was called from FALV PAI
*    "or not, if yes, just change current guid?
*    "what about popup? - it's on a different screen
*    "so it should work without exceptions
*    case e_ucomm.
*      when fc_back.
*        leave to screen 0.
*      when fc_exit.
*        leave to screen 0.
*      when fc_up.
*        leave to screen 0.
*      when fc_cancel.
*        leave to screen 0.
*      when fc_mass_replace.
*        mass_replace( ).
*    endcase.
  endmethod.


  method exclude_function.
    if not line_exists( exclude_functions[ table_line = iv_ucomm ] ).
      insert iv_ucomm into table exclude_functions.
    endif.
  endmethod.


  method export_to_excel.


    data: version type string.
    data: result_data type ref to cl_salv_ex_result_data_table.
    data: columns type ref to cl_salv_columns_table.
    data: aggreg type ref to cl_salv_aggregations.
    data: salv_intf_descr type ref to cl_abap_objectdescr.
    data: salv_table type ref to cl_salv_table.
    data: file_type type salv_bs_constant.
    field-symbols <tab> type any table.


    if cl_salv_bs_a_xml_base=>get_version( ) eq if_salv_bs_xml=>version_25 or
       cl_salv_bs_a_xml_base=>get_version( ) eq if_salv_bs_xml=>version_26.

      result_data = grid->create_ex_result( ).

      case cl_salv_bs_a_xml_base=>get_version( ).
        when if_salv_bs_xml=>version_25.
          version = if_salv_bs_xml=>version_25.
        when if_salv_bs_xml=>version_26.
          version = if_salv_bs_xml=>version_26.
      endcase.

      "if XLSX is possible then we create it,  if not then MHTML excel file
      salv_intf_descr ?= cl_abap_intfdescr=>describe_by_name( exporting p_name = 'IF_SALV_BS_XML' ).
      if salv_intf_descr is not initial and line_exists( salv_intf_descr->attributes[ name = 'C_TYPE_XLSX'  ] ).
        file_type = 10.
      else.
        file_type = 02.
      endif.

      "transformation of data to excel
      call method cl_salv_bs_tt_util=>if_salv_bs_tt_util~transform
        exporting
          xml_type      = file_type
          xml_version   = version
          r_result_data = result_data
          xml_flavour   = if_salv_bs_c_tt=>c_tt_xml_flavour_export
          gui_type      = if_salv_bs_xml=>c_gui_type_gui
        importing
          xml           = rv_xstring.
    endif.


  endmethod.


  method get_cell_enabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl,
                   <field>  type any.
    check i_row is not initial and i_field is not initial.
    get_frontend_layout( importing es_layout =  lvc_layout ).

    if sy-subrc eq 0.
      if lvc_layout-stylefname is not initial.
        assign outtab->* to <outtab>.
        assign <outtab>[ i_row ] to field-symbol(<line>).
        if sy-subrc eq 0.
          assign component lvc_layout-stylefname of structure <line> to <styles>.
          if sy-subrc eq 0.
            assign <styles>[ fieldname = i_field ] to field-symbol(<style>).
            if sy-subrc eq 0.
              if <style>-style = mc_style_enabled.
                r_enabled = abap_true.
                return.
              elseif <style>-style = mc_style_disabled.
                r_enabled = abap_false.
                return.
              endif.
            endif.
          endif.
        endif.
      endif.
      "all cells editable
      if lvc_layout-edit eq abap_true.
        r_enabled = abap_true.
      else.
        get_frontend_fieldcatalog( importing et_fieldcatalog = fcat ).
        assign fcat[ fieldname = i_field ] to field-symbol(<fcat>).
        if <fcat>-edit eq abap_true.
          r_enabled = abap_true.
        endif.
      endif.
    endif.
  endmethod.


  method get_file_from_mime.
    cl_mime_repository_api=>get_api( )->get(
            exporting i_url = iv_path
            importing e_content = ev_xstring
                      e_mime_type = ev_mime_type
        exceptions others = 1 ).
    check sy-subrc eq 0.
  endmethod.


  method get_picture_from_se78.
    cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp(
      exporting
        p_object       = 'GRAPHICS'    " SAPscript Graphics Management: Application object
        p_name         =  iv_name   " Name
        p_id           =  iv_id   " SAPscript Graphics Management: ID
        p_btype        =  iv_type   " SAPscript: Type of graphic
      receiving
        p_bmp          =  rv_xstring   " Graphic Data
      exceptions
        not_found      = 0
        internal_error = 0
        others         = 0
    ).
  endmethod.


  method hide_applog.

    if main_split_container is not initial.
      main_split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  0   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0      ).
      main_split_container->set_row_height(
        exporting
          id                =   2 " Row ID
          height            =   0  " Height
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0   ).
      clear splitter_row_3_height.
    endif.
  endmethod.


  method hide_top_of_page.
    if split_container is not initial.

      split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  0   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0  ).

      split_container->set_row_height(
        exporting
          id                =   1 " Row ID
          height            =   0  " Height
        exceptions
          cntl_error        = 1
          cntl_system_error = 2
          others            = 3   ).
      if sy-subrc eq 0.
        splitter_row_1_height = 0.
      endif.
    endif.
  endmethod.


  method if_os_clone~clone.
    system-call objmgr clone me to result.
  endmethod.


  method lvc_fcat_from_itab.
    data: table type ref to data.
    create data table like it_table.
    assign table->* to field-symbol(<table>).
    try.
        cl_salv_table=>factory( importing
                                  r_salv_table   = data(salv_table)
                                changing
                                  t_table        = <table>  ).
        rt_fcat = cl_salv_controller_metadata=>get_lvc_fieldcatalog(
            r_columns      = salv_table->get_columns( ) " ALV Filter
            r_aggregations = salv_table->get_aggregations( ) " ALV Aggregations
    ).
      catch cx_root.
    endtry.
  endmethod.


  method mass_replace.
    field-symbols: <outtab> type standard table.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      call function 'Z_FALV_MASS_REPLACE'
        exporting
          io_grid   = cast cl_gui_alv_grid( me )
        changing
          ct_outtab = <outtab>.
    endif.
  endmethod.


  method pai.
    data: ucomm type sy-ucomm.
    ucomm = c_ucomm.
    clear c_ucomm.
    raise event user_command exporting e_ucomm = ucomm.

    me->set_function_code(
       changing
         c_ucomm = ucomm ).
  endmethod.


  method pbo.

    gui_status->show_gui_status( ).
    raise event at_set_pf_status .

    gui_status->show_title(
      exporting
        iv_text1 = title_v1
        iv_text2 = title_v2
        iv_text3 = title_v3
        iv_text4 = title_v4
        iv_text5 = title_v5
    ).
    raise event at_set_title.

  endmethod.


  method raise_top_of_page.

    if top_of_page_visible_at_start eq abap_true and
       top_of_page_container is not initial.

      if me->top_of_page_doc is initial.
        top_of_page_doc = new cl_dd_document(
*            style            =
*            background_color =
*            bds_stylesheet   =
*            no_margins       =
        ).
      endif.

      export alv_form_html from abap_true
            to memory id 'ALV_FORM_HTML'.


      call method me->list_processing_events
        exporting
          i_event_name = 'TOP_OF_PAGE'
          i_dyndoc_id  = me->top_of_page_doc.


      export alv_form_html from abap_false
             to memory id 'ALV_FORM_HTML'.

      top_of_page_doc->display_document(
        exporting
          reuse_control      =  'X'
           parent             =  top_of_page_container
        exceptions
          html_display_error = 0
          others             = 0    ).
      show_top_of_page( ).
    endif.
  endmethod.


  method refresh_toolbar.
    check cl_gui_alv_grid=>offline( ) is initial.
    try.
        me->set_toolbar_interactive(  ).
      catch cx_root.
        "in case method is called before the display of grid
        "no need to do anything with that
    endtry.
  endmethod.


  method save_excel_localy.
    data: path     type string,
          filename type string.

    if iv_path is initial.
      cl_gui_frontend_services=>file_save_dialog(
      exporting
*      window_title         = window_title
        default_extension    = 'XLSX'
*      default_file_name    = default_file_name
*      with_encoding        = with_encoding
*      file_filter          = file_filter
*      initial_directory    = initial_directory
*      prompt_on_overwrite  = 'X'
      changing
        filename             = filename
        path                 = path
        fullpath             = iv_path
*      user_action          = user_action
*      file_encoding        = file_encoding
      exceptions
        cntl_error           = 1
        error_no_gui         = 2
        not_supported_by_gui = 3
        others               = 4
           ).
      if sy-subrc <> 0.
        return.
      endif.
    endif.

    if iv_path is not initial.

      data(xstring) = me->export_to_excel( ).
      data(xstrsize) = xstrlen( xstring ).
      data(solix) = cl_bcs_convert=>xstring_to_solix( xstring  ).

      cl_gui_frontend_services=>gui_download(
        exporting
          bin_filesize              = xstrsize
          filename                  = iv_path
          filetype                  = 'BIN'
        changing
          data_tab                  = solix
        exceptions
          file_write_error          = 1
          no_batch                  = 2
          gui_refuse_filetransfer   = 3
          invalid_type              = 4
          no_authority              = 5
          unknown_error             = 6
          header_not_allowed        = 7
          separator_not_allowed     = 8
          filesize_not_allowed      = 9
          header_too_long           = 10
          dp_error_create           = 11
          dp_error_send             = 12
          dp_error_write            = 13
          unknown_dp_error          = 14
          access_denied             = 15
          dp_out_of_memory          = 16
          disk_full                 = 17
          dp_timeout                = 18
          file_not_found            = 19
          dataprovider_exception    = 20
          control_flush_error       = 21
          not_supported_by_gui      = 22
          error_no_gui              = 23
          others                    = 24
             ).
      if sy-subrc eq 0.
        rv_saved = abap_true.
      endif.

    endif.
  endmethod.


  method send.
    try.
        data(request) = cl_bcs=>create_persistent( ).
      catch cx_send_req_bcs.
        raise create_request_error.
    endtry.

    try.
        data(document) = cl_document_bcs=>create_document(
                                                            i_type = 'HTM'
                                                            i_text = cl_document_bcs=>string_to_soli( iv_body )
                                                            i_subject = conv #( iv_subject )
                                                            i_importance = iv_importance
                                                            i_sensitivity = iv_sensitivity
                                                           ).


      catch cx_document_bcs.
        raise create_document_error.
    endtry.

    data(excel) = export_to_excel( ).

    try.
        document->add_attachment(
            i_attachment_type    = 'EXT'
            i_att_content_hex    = cl_document_bcs=>xstring_to_solix( excel )
            i_attachment_size    = conv #( xstrlen( excel ) )
            i_attachment_subject = cond #( when iv_filename is not initial then iv_filename
                                           else conv #( |{ sy-datum }_{ sy-uzeit }.xlsx | )
                                                        )

                                           ).
      catch cx_document_bcs .
        raise add_attachment_error.
    endtry.


    try.

        request->set_document( document ).
      catch cx_send_req_bcs.
        raise add_document_error.
    endtry.

    if it_recipients is not initial.
      loop at it_recipients assigning field-symbol(<addr>).
        try.
            data(smtp_addr) = cl_cam_address_bcs=>create_internet_address( <addr>-smtp_addr ).
          catch cx_address_bcs.
            raise add_recipient_error.
        endtry.

        try.
            request->add_recipient( i_recipient = smtp_addr
                                    i_express = <addr>-express
                                    i_copy = <addr>-copy
                                    i_blind_copy = <addr>-blind_copy
            ).

          catch cx_send_req_bcs.
            raise add_recipient_error.
        endtry.
      endloop.

      if iv_sender is not initial.
        try.
            data(sender)  = cl_cam_address_bcs=>create_internet_address(  i_address_string  = iv_sender
                                                                          i_address_name    = iv_sender_name ).
          catch cx_address_bcs.
            raise add_sender_error.
        endtry.

        try.
            request->set_sender( i_sender = sender  ).
          catch cx_send_req_bcs.
            raise add_sender_error.
        endtry.
      endif.

      try.
          request->set_message_subject( ip_subject = iv_subject ).
        catch cx_root.
      endtry.


      if iv_immediately eq abap_true.
        try .
*     set send immediately
            request->set_send_immediately( abap_true ).
          catch cx_send_req_bcs.
            raise send_immediately_error.
        endtry.

      endif.
      try.
          data(result) = request->send(  ).
          if iv_commit eq abap_true.
            commit work.
          endif.
        catch cx_send_req_bcs.
          raise send_error.
      endtry.
    else.
      raise add_recipient_error.
    endif.



  endmethod.


  method set_cell_button.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_button.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_button ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_color.
    field-symbols: <outtab> type standard table,
                   <colors> type lvc_t_scol.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-ctab_fname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-ctab_fname of structure <row> to <colors>.
        if sy-subrc eq 0.
          try.
              <colors>[ fname = iv_fieldname ]-color = iv_color.
            catch cx_sy_itab_line_not_found.
              insert value #( fname = iv_fieldname color = iv_color ) into table <colors>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_disabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_disabled.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_disabled ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_enabled.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_enabled.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_enabled ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_cell_hotspot.
    field-symbols: <outtab> type standard table,
                   <styles> type lvc_t_styl.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-stylefname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-stylefname of structure <row> to <styles>.
        if sy-subrc eq 0.
          try.
              <styles>[ fieldname = iv_fieldname ]-style = mc_style_hotspot.
            catch cx_sy_itab_line_not_found.
              insert value #( fieldname = iv_fieldname style = mc_style_hotspot ) into table <styles>.
          endtry.
        endif.
      endif.
    endif.
  endmethod.


  method set_editable.
    check cl_gui_alv_grid=>offline( ) is initial.
    me->set_ready_for_input( i_ready_for_input = 1 ).
    if iv_modify eq abap_true.
      me->register_edit_event(
        exporting
          i_event_id =  me->mc_evt_modified
        exceptions
          error      = 0
          others     = 0 ).
    else.
      me->register_edit_event(
        exporting
          i_event_id =  me->mc_evt_enter
        exceptions
          error      = 0
          others     = 0  ).
    endif.
  endmethod.


  method set_frontend_fieldcatalog.
    fcat = it_fieldcatalog.
    super->set_frontend_fieldcatalog( fcat ).
  endmethod.


  method set_frontend_layout.
    lvc_layout = is_layout.
    super->set_frontend_layout( is_layout ).
  endmethod.


  method set_list_view.
    m_batch_mode = abap_true.
  endmethod.


  method set_mark_field.
    if line_exists( fcat[ fieldname = iv_fieldname ] ).
      layout->mark_field = iv_fieldname.
      check iv_fieldname is not initial.
      column( iv_fieldname )->set_checkbox( abap_true ).
    endif.
  endmethod.


  method set_output_table.
    get reference of ct_table into outtab.
  endmethod.


  method set_parent.
    me->parent ?= io_parent.
  endmethod.


  method set_readonly.
    me->set_ready_for_input( i_ready_for_input = 0 ).
  endmethod.


  method set_row_color.
    field-symbols: <outtab> type standard table,
                   <color>  type char04.
    get_frontend_layout( importing es_layout =  lvc_layout ).
    check lvc_layout-info_fname is not initial.
    assign outtab->* to <outtab>.
    if sy-subrc eq 0.
      assign <outtab>[ iv_row ] to field-symbol(<row>).
      if sy-subrc eq 0.
        assign component lvc_layout-info_fname of structure <row> to <color>.
        if sy-subrc eq 0.
          <color> = iv_color.
        endif.
      endif.
    endif.
  endmethod.


  method show_applog.


    if main_split_container is not initial.
      main_split_container->get_row_height(
    exporting
      id                =  2
    importing
      result            =  splitter_row_2_height
    exceptions
      cntl_error        = 1
      cntl_system_error = 2
      others            = 3  ).
      if sy-subrc eq 0 and splitter_row_2_height eq 0.
        main_split_container->set_row_sash(
          exporting
            id                =  1   " Row Splitter Bar ID
            type              =  split_container->type_sashvisible   " Attribute
            value             =  1   " Value
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).
        main_split_container->get_row_height(
          exporting
            id                =  1   " ALV
          importing
            result            =  splitter_row_2_height
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        main_split_container->get_row_height(
          exporting
            id                = 2   " Row ID
          importing
            result            =  splitter_row_3_height   " Result Code
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        main_split_container->set_row_height(
          exporting
            id                =   2 "error log
            height            =   error_log_height
          importing
            result           = result
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).

        try.
            main_split_container->set_row_height(
             exporting
               id                =   1 " ALV
               height            =   conv #( splitter_row_2_height - error_log_height )
             importing
               result           = result
             exceptions
               cntl_error        = 0
               cntl_system_error = 0
               others            = 0 ).
          catch cx_root.
        endtry.
      endif.
      clear splitter_row_2_height.
      clear splitter_row_3_height.
    endif.
  endmethod.


  method show_top_of_page.
    if split_container is not initial.
      split_container->set_row_sash(
        exporting
          id                =  1   " Row Splitter Bar ID
          type              =  split_container->type_sashvisible   " Attribute
          value             =  1   " Value
        exceptions
          cntl_error        = 0
          cntl_system_error = 0
          others            = 0 ).

      split_container->get_row_height(
        exporting
          id                =  1   " Row ID
        importing
          result            =  splitter_row_1_height   " Result Code
        exceptions
          cntl_error        = 1
          cntl_system_error = 2
          others            = 3 ).
      if sy-subrc eq 0 and splitter_row_1_height eq 0.
        split_container->set_row_height(
          exporting
            id                =   1 " Row ID
            height            =   top_of_page_height
          importing
            result           = result
          exceptions
            cntl_error        = 0
            cntl_system_error = 0
            others            = 0 ).
      endif.
      top_of_page_visible_at_start = abap_true.
    endif.
  endmethod.


  method soft_refresh.
    me->refresh_table_display(
      exporting
        is_stable      =     conv #('XX') " With Stable Rows/Columns
        i_soft_refresh =     abap_true" Without Sort, Filter, etc.
      exceptions
        finished       = 0
        others         = 0 ).
  endmethod.
endclass.
