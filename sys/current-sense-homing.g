; =========================================================================================================
;
; Set the current and sensitivity for homing, non-printing, routines
;
; =========================================================================================================
;
;M915 X S-20 F1 H200 R0                                   ; set the x axis sensitivity.
;M915 Y S-20 F1 H200 R0                                   ; set the y axis sensitivity.
;M913 X40 Y30 Z60                                       ; set the x, y, and z drivers current percentage for non-print moves, per config.g.

M915 X S-15 F1 H200 R0                                   ; set the x axis sensitivity.
M915 Y S-15 F1 H200 R0                                   ; set the y axis sensitivity.
M913 X40 Y30 Z60                                       ; set the x, y, and z drivers current percentage for non-print moves, per config.g.
;
; =========================================================================================================
;