"! done by Lukasz Pegiel for http://abapblog.com
report zdemo_falv18.

data: sflight type standard table of sflight.


start-of-selection.

  select * up to 100 rows
  into corresponding fields of table @sflight
  from sflight.

  data(falv) =  zcl_falv=>create( changing ct_table = sflight ).


  falv->column( 'SEATSMAX' )->set_hotspot( abap_true )->set_color( 'C410').
  falv->layout->set_cwidth_opt( abap_true )->set_no_toolbar( abap_true ).
  falv->title_v1 = 'ZDEMO_FALV17'.

  falv->top_of_page_height = 100. "absolute size
  falv->show_top_of_page( ).

  falv->display( ).
