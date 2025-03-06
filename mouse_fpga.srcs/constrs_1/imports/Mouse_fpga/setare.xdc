## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports clk]

## Reset Button
set_property PACKAGE_PIN C17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## PS2 Mouse Inputs
set_property PACKAGE_PIN F15 [get_ports PC]
set_property IOSTANDARD LVCMOS33 [get_ports PC]

set_property PACKAGE_PIN F14 [get_ports PD]
set_property IOSTANDARD LVCMOS33 [get_ports PD]

## Invers Signal (Switch)
set_property PACKAGE_PIN A8 [get_ports invers]
set_property IOSTANDARD LVCMOS33 [get_ports invers]

## Outputs for LED Indicators
set_property PACKAGE_PIN U16 [get_ports is_left]
set_property IOSTANDARD LVCMOS33 [get_ports is_left]

set_property PACKAGE_PIN V16 [get_ports up]
set_property IOSTANDARD LVCMOS33 [get_ports up]

## 7-Segment Display Anode Control
set_property PACKAGE_PIN T10 [get_ports {Anod[0]}]
set_property PACKAGE_PIN R10 [get_ports {Anod[1]}]
set_property PACKAGE_PIN N10 [get_ports {Anod[2]}]
set_property PACKAGE_PIN M10 [get_ports {Anod[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anod[*]}]

## 7-Segment Display Cathode Control
set_property PACKAGE_PIN L14 [get_ports {Catod[0]}]
set_property PACKAGE_PIN H14 [get_ports {Catod[1]}]
set_property PACKAGE_PIN N14 [get_ports {Catod[2]}]
set_property PACKAGE_PIN P14 [get_ports {Catod[3]}]
set_property PACKAGE_PIN T14 [get_ports {Catod[4]}]
set_property PACKAGE_PIN U14 [get_ports {Catod[5]}]
set_property PACKAGE_PIN V14 [get_ports {Catod[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Catod[*]}]
