# FALV

## Overview

FALV - Fast ALV Grid

This is just a clone of the original [FALV](https://github.com/fidley/falv).

See [website](http://abapblog.com/falv).

## Installation

This project is supported by <a href="https://github.com/larshp/abapGit">ABAPGit Project</a>. Download ZIP file or integrate this project to him.

## Changelog

- Changes v740.1.0.19 
  - Refactoring done for create / create_by_copy methods + some others. Added returning paramete wherever possible for chaining methods.
  - Bug with not appearing grid while using ZDEMO_FALV13 solved.

- Changes v740.1.0.18 
  - Chain call for setters in COLUMNS and LAYOUT are now possible (ZDEMO_FALV18)
  - Creation of FALV that is inherited in local class can be done in short way (ZDEMO_FALV19)

- Changes v740.1.0.17 
  - Creation of FALV that is inherited in global class can be done in short way (ZDEMO_FALV17)

- Changes v740.1.0.16 
  - Bug Fix for mass replace function if it was run from FALV in custom container

- Changes v740.1.0.15 
  - New method DELETE_ALL_BUTTONS for quick clear of grid toolbar.

- Changes v740.1.0.14
  - Small change in mass replace function - data is no longer directly move to output table but only passed to grid by set_delta_celss method. This is done to avoid omitting event on_data_change

- Changes v740.1.0.13
  - Internal event for user comand handling was removed. Instead all code from this method was moved to evf_user_command, so you have to call super->evf_user_command if you want standard functions to work.Additionally hot spot bug with delayed events was solved.

- Changes v740.1.0.12
  - Getters added for columns settings + get_cell_enabled method + some minor bugs

- Changes v740.1.0.7 - 740.1.0.11
  - New demo program ZDEMO_FALV16 for check if FALV is working on split container, few bugs correction ( Loop in PAI, split container ).

- Changes v740.1.0.6
  - new method "SEND" for sending grid as an XLSX attachment correction of zcl_falv->export_to_excel

- Changes v740.1.0.4
  - Run in BG mode error solved.

- Changes v740.1.0.3
  - Top_of_page event is now raised and handled.
  - Changed Classes: ZCL_FALV Changed Programs: ZDEMO_FALV02, ZDEMO_FALV13

- Changes v740.1.0.2
  - All event handlers methods were renamed to use prefix evf_* instead of evt_*. This was because some of super classes were already containing such methods and to keep one naming range I've used other prefix.
  - Additionally issue with not showing grid on full screen at first call.