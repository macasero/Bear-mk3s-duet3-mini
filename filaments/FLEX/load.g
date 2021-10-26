; =========================================================================================================
;
;  Prepare to load FLEX at 240°C
;
; =========================================================================================================
;
M291 P"Prepare for filament loading. Please wait while the nozzle is being heated up. Press OK to continue or CANCEL to abort." R"Loading FLEX at 240°C" S3;
;
M291 P"Please wait while the nozzle is being heated up" R"Heating: 240°C" S1 ; Display message
;
G91                                                    ; relative positioning
G1 Z20 F6000 H2                                        ; lift Z relative to current position
M104 S240                                              ; set current tool temperature to filament 240°C
M116                                                   ; wait for the temperatures to be reached
;
M292                                                   ; close message
;
M98 P"0:/macros/01-Filament_Handling/00-Load_Filament"    ; execute macro to load and purge filament
;
; =========================================================================================================
