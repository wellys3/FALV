#Changes V 740.1.0.7 - 740.1.0.11
New demo program ZDEMO_FALV16 for check if FALV is working on split container, few bugs correction ( Loop in PAI, split container ).

#Changes V 740.1.0.6
new method "SEND" for sending grid as an XLSX attachment
correction of zcl_falv->export_to_excel 

#Changes V 740.1.0.4
Run in BG mode error solved.

#Changes V 740.1.0.3
Top_of_page event is now raised and handled.

Changed Classes: ZCL_FALV
Changed Programs: ZDEMO_FALV02, ZDEMO_FALV13

#Changes V 740.1.0.2
All event handlers methods were renamed to use prefix evf_* instead of evt_*. This was because some of super classes were already containing such methods and to keep one naming range I've used other prefix. 

Additionally issue with not showing grid on full screen at first call.  
