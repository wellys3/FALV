module pbo output.
  assign outputs[ table_line->guid = current_guid ] to <out>.
  if sy-subrc eq 0.
    <out>->pbo( iv_dynnr = sy-dynnr ).
  endif.

endmodule.

module pai input.
  assign outputs[ table_line->guid = current_guid ] to <out>.
  if sy-subrc eq 0.
    <out>->pai( changing c_ucomm = okcode  ).
  endif.
endmodule.
