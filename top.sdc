###################################################################

# Created by write_sdc on Sat Nov 18 22:12:37 2017

###################################################################
set sdc_version 2.0

set_units -time ps -resistance kOhm -capacitance fF -power mW -voltage V       \
-current mA
set_driving_cell -lib_cell inv_1 [get_ports clk]
set_driving_cell -lib_cell inv_1 [get_ports reset]
create_clock [get_ports clk]  -period 50000  -waveform {0 25000}
