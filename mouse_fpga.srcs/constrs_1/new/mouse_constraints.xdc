# PS/2 Mouse Clock (PC)
set_property PACKAGE_PIN C17 [get_ports PC]                        
set_property IOSTANDARD LVCMOS33 [get_ports PC]
set_property PULLUP true [get_ports PC]

# PS/2 Mouse Data (PD)
set_property PACKAGE_PIN B17 [get_ports PD]                    
set_property IOSTANDARD LVCMOS33 [get_ports PD]    
set_property PULLUP true [get_ports PD]

# Main System Clock
set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Reset Button
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {reset}]

# Invers Signal (Switch)
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {invers}]

# Outputs for LED Indicators
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {is_left}]

# Button for Left Click
set_property PACKAGE_PIN L1 [get_ports {buton_stanga}]					
set_property IOSTANDARD LVCMOS33 [get_ports {buton_stanga}]

# 7-Segment Display
set_property -dict { PACKAGE_PIN W7   IOSTANDARD LVCMOS33 } [get_ports {seg[0]}]
set_property -dict { PACKAGE_PIN W6   IOSTANDARD LVCMOS33 } [get_ports {seg[1]}]
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports {seg[2]}]
set_property -dict { PACKAGE_PIN V8   IOSTANDARD LVCMOS33 } [get_ports {seg[3]}]
set_property -dict { PACKAGE_PIN U5   IOSTANDARD LVCMOS33 } [get_ports {seg[4]}]
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports {seg[5]}]
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports {seg[6]}]

set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports dp]

set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports {an[0]}]
set_property -dict { PACKAGE_PIN U4   IOSTANDARD LVCMOS33 } [get_ports {an[1]}]
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports {an[2]}]
set_property -dict { PACKAGE_PIN W4   IOSTANDARD LVCMOS33 } [get_ports {an[3]}]
