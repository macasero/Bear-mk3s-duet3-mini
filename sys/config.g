; =========================================================================================================
;
; Configuration file for Duet2WiFi-Ethernet (firmware version 3.3)
;
; for 1.8° LDO cold motors on xye
;
; for Kapa Bear Duet5 Mini - E3d Thermistor - SuperPINDA
;
; Based on CariboDuetConfiguration Release : "1.6.4"

; =========================================================================================================
; Network settings
; =========================================================================================================
;
M550 P"CariBearMini"                                 ; set printer name
;
M552 S1                                                ; enable network
M586 P0 S1                                             ; enable HTTP
M586 P1 S1                                             ; enable FTP
M586 P2 S0                                             ; disable Telnet
M575 P1 S1 B57600                                      ; enable support for PanelDue
;
; =========================================================================================================
; Drives
; =========================================================================================================
;
M569 P1 S1 D3 V10                                					; X drive @1- inversed
M569 P2 S0 D3 V10                                					; Y drive @2- 
M569 P0 S1 D3 V100                               					; Z left drive @0- inversed
M569 P4 S1 D3 V100                               					; Z right drive  @4- inversed
M569 P3 S0 D3 V1000                               					; E drive @3

;
; Motor Configuration
;
M584 X1 Y2 Z0:4 E3                     								; set drive mapping
M671 X-37:287 Y0:0 S10                                     			; define dual driven z-axis 
;
; set Microsteps and steps / mm
;
M350 X16 Y16 Z16 E16 I1                                ; configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E140.00                    ; set steps per mm
;
; set motor currents
;
M906 X800 Y800 Z650 E800 I40                         ; set motor currents (mA) and motor idle factor in per cent
M84 S60                                                ; Set idle timeout
;
; set speeds
;
;M201 X500.00 Y500.00 Z100.00 E500.00                   ; set accelerations (mm/s^2)
;M203 X9000.00 Y9000.00 Z1000.00 E3600.00               ; set maximum speeds (mm/min)
;M204 P500.0 T500.0                                     ; set print and travel accelerations (mm(s^2)
;M566 X480.00 Y480.00 Z48.00 E300.00                    ; set maximum instantaneous speed changes (mm/min)
;
; Speed tests more aressive
M201 X1500.00 Y1500.00 Z100.00 E500.00                   ; set accelerations (mm/s^2)
M203 X9000.00 Y9000.00 Z1000.00 E3600.00               ; set maximum speeds (mm/min)
M204 P1200.0 T5000.0                                     ; set print and travel accelerations (mm(s^2)
M566 E400						;300	  ; Set maximum instantaneous speed changes (JERKS) (mm/min) ONLY EXTRUDER
;M566 X480.00 Y480.00 Z48.00                     ; set maximum instantaneous speed changes (mm/min)
M205 X8 Y8 Z8							; Set maximum instantaneous speed changes (JERKS) (mm/seg) XYZ . USE this for Marlin COMPATIBILITY
;
M564 H0                                                ; allow unhomed movement
;


; =========================================================================================================
; Axis Limits
; =========================================================================================================
;
M208 X-0.1 Y-4.5 Z0 S1                                   ; set axis minima
M208 X252.6 Y211.5 Z213.50 S0                            ; set axis maxima
;
; =========================================================================================================
; Endstops
; =========================================================================================================
;
M574 X1 S3                                             ; configure sensorless endstop for low end on X
M574 Y1 S3                                             ; configure sensorless endstop for low end on Y
M574 Z1 S2                                             ; configure Z-probe endstop for low end on Z
M574 Z2 S3                                             ; configure sensorless endstop for high end on Z
;
; =========================================================================================================
;
; SuperPINDA 
;
M558 P5 C"io2.in" H1.5 F600 T8000 A3 S0.03              ; set z probe to SuperPINDA
;M557 X23:235 Y5:186 S30.25:30                               ; define mesh grid
M557 X23:225 Y3.5:210 P6; P4                              ; define mesh grid (P4 for nylock mod mesh)
;
; =========================================================================================================
;
; Stallguard Sensitivy
;
M915 X S2 F0 H400 R0                                   ; set X axis Sensitivity
M915 Y S1 F0 H400 R0                                   ; set Y axis Sensitivity
M915 Z S0 F0 H200 R0                                   ; set Z axis Sensitivity
;
; =========================================================================================================
; Heater & Fans
; =========================================================================================================
;
; heated bed
; =========================================================================================================
;
M308 S0 P"temp1" Y"thermistor" T100000 B4092 A"Bed"  ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"out0" Q50 T0                                    ; create bed heater output on bedheat and map it to sensor 0
M140 H0                                                      ; map heated bed to heater 0
M143 H0 P0 S120 A2                                      ; disable temporarily H0 if temp exceeds 120C
M143 H0 P0 S130 A0                                      ; heater fault H0 if temp exceeds 130C
M307 H0 B0 S1.00                                     ; disable bang-bang mode for the bed heater and set PWM limit
M570 H0 P60 T15 S0                                      ; heater fault for 60seg of 15ºC excursion
M307 H0 R0.231 C516.154:516.154 D9.66 S1.00 V23.9 B0 I0      ; PID backup
;
; extruder
; =========================================================================================================
;
; Hotend (V6 with E3d Thermistor) 
;
M308 S1 P"temp0" Y"thermistor" T100000 B4725 C7.060000e-8 A"Nozzle E1"  ; E3d configure sensor 0 as thermistor on pin e0temp
;M308 S1 P"temp0" Y"thermistor" T100000 B4092 A"Nozzle E1"				; EPCOS 100K configure sensor 0 as thermistor on pin e0temp
M950 H1 C"out1" T1                                        ; create nozzle heater output on e0heat and map it to sensor 2
M143 H1 S285 A2                                         ; disable temporarily H1 if temp exceeds 285C
M143 H1 S295 A0                                         ; heater fault H1 if temp exceeds 295C
M307 H1 B0 S1.00                                        ; disable bang-bang mode for heater  and set PWM limit
M570 H1 P10 T30 S0                                      ; heater fault for 10 seg of 30ºC excursion
M307 H1 R2.980 C251.722:153.686 D6.26 S1.00 V24.0 B0 I0      ; PID backup
;
; =========================================================================================================
; Fans
; =========================================================================================================
;
; extruder fan (temerature controlled)
;
M950 F1 C"out6" Q500                                   ; create fan 1 on pin fan0 and set its frequency
M106 P1 H1 T45                                         ; fan turns on at 45°C
;
; radial fan
;
M950 F0 C"out5" Q500 ;Q160                                   ; create fan 0 on pin fan1 and set its frequency
M106 P0 S0 H-1                                         ; set fan 0 value. Thermostatic control is turned off
;
; =========================================================================================================
;
; Drivers and MCU temp sensors and electronic fan
;
M308 S4 P"mcu-temp" Y"mcu-temp" A"MCU"                 ; set virtual heater for MCU
M308 S5 P"drivers" Y"drivers" A"Driver"                ; set virtual heater for stepper drivers
M950 F2 C"out4" Q500									; create fan 2 on pin out4 - alternative with tacho M950 F2 C"!fan2+^pb6"
M106 P2 H3:4 L.3 B.5 X1 T40:65 					; Set fan 2 PWR fan. Turns on when MCU temperature, hits 45C and full when the MCU temperature reaches 65C or any TMC2660 alarms
;
; =========================================================================================================
;
; ========================================================================================================
; Tools
; =========================================================================================================
;
M563 P0 D0 H1 F0 S"T0"                                       ; define tool 0
G10 P0 X0 Y0 Z0                                        ; set tool 0 axis offsets
G10 P0 S-274 R-274                                     ; turn on tool 0, set active and standby temperature to 0K
M302 S180 R180                                         ; allow extrusion starting from 180°C and retractions already from 180°C
;
; =========================================================================================================
; other settings
; =========================================================================================================
;
M18 XY                                                 ; release / unlock X, Y
M501                                                   ; use config-override (for Thermistor Parameters and other settings)
G90                                                    ; send absolute coordinates...
M83                                                    ; ... but relative extruder moves
T0                                                     ; Select first tool (Extruder 0)
M911 S23 R24 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"      ; set voltage thresholds and actions to run on power loss
M579 X1.005 Y1.005                                      ; Scale Cartesian axe
;
; =========================================================================================================
;  filament handling
; =========================================================================================================
; firmware retraction
;
M207 S0.85 R0 F2400 Z0								; Firmware retraction
;
; execute macros that has the status of the filament sensor
;
M98 P"0:/sys/00-Functions/FilamentsensorStatus"
M572 D0 S0.05                       ; set pressure advance in case not loaded on M703 Filament
M404 N1.75									; Define filament diameter for print monitor
;
; =========================================================================================================
;
; =========================================================================================================
;
; Offsets - place off-sets for x and y here. z-offsets are handled in the print sheet macros
;
G31 P1000 X23 Y5
;
; =========================================================================================================
;
