"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv17.

data: sflight type standard table of sflight.


start-of-selection.

  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  "creation of falv with global class redefinition and without passing subclass type
  data falv type ref to zcl_falv_inheritance_demo.

  falv ?=  zcl_falv_inheritance_demo=>create( changing ct_table = sflight ).


  falv->column( 'SEATSMAX' )->set_hotspot( abap_true ).
  falv->title_v1 = 'ZDEMO_FALV17'.

  falv->top_of_page_height = 100. "absolute size
  falv->show_top_of_page( ).

  falv->display( ).
