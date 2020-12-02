############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project my_hardware_accelerator
set_top hardware_accelerator
add_files my_hardware_accelerator/my_code.cpp
open_solution "my_hardware_accelerator"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./my_hardware_accelerator/my_hardware_accelerator/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -flow impl -rtl vhdl -format ip_catalog
