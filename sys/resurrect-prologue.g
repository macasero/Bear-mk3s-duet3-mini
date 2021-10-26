M116 ; wait for temperatures
G28 ; home all towers
M83 ; relative extrusion
G1 E4 F3600 ; undo the retraction that was done in the M911 power fail script
M291 S3 R"RESUME!!!!" P"Clean Nozzle NOW!!!! then press OK"

