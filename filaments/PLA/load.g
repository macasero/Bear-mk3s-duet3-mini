; =========================================================================================================
;
;  Prepare to load PLA at 215°C
;
; =========================================================================================================
;
M291 P"Prepare for filament loading. Please wait while the nozzle is being heated up. Press OK to continue or CANCEL to abort." R"Loading PLA at 215°C" S3;
;
M291 P"Please wait while the nozzle is being heated up" R"Heating: 215°C" S1 ; Display message
;
G91                                                    ; relative positioning
G1 Z20 F6000 H2                                        ; lift Z relative to current position
M104 S215                                              ; set current tool temperature to filament 215°C
M116                                                   ; wait for the temperatures to be reached
;
M292                                                   ; close message
;
M98 P"0:/macros/01-Filament_Handling/00-Load_Filament"    ; execute macro to load and purge filament
;
; =========================================================================================================
