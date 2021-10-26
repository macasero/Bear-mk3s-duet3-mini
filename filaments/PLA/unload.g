; =========================================================================================================
;
;  Prepare to un-load PLA at 215°C
;
; =========================================================================================================
;
M291 P"Prepare for filament un-loading. Please wait while the nozzle is being heated up. Press OK to continue or CANCEL to abort." R"Unloading PLA at 215°C" S3;
;
M291 P"Please wait while the nozzle is being heated up" R"Heating: 215°C" T30 ; Display message
;
G91                                                    ; relative positioning
G1 Z20 F6000 H2                                        ; lift Z relative to current position
M104 S215                                               ; set current tool temperature to filament 215°C
M116                                                   ; wait for the temperatures to be reached
;
M98 P"0:/macros/01-Filament_Handling/01-Unload_Filament"  ; execute macro to unload filament
;
; =========================================================================================================
