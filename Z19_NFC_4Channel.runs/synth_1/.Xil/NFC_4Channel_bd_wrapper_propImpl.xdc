set_property SRC_FILE_INFO {cfile:D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/Z19_NFC_4Channel.srcs/constrs_1/new/pin_constrain.xdc rfile:../../../Z19_NFC_4Channel.srcs/constrs_1/new/pin_constrain.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to   [get_pins -hier -quiet *sync_flop*/D]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_pins -hier -quiet *sync_flop*/C]
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to   [get_pins -hier -quiet *ISERDESE3_*/D]
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -from [get_cells -hierarchical -quiet -filter {REF_NAME == OSERDESE3}] -to   [get_cells -hierarchical -quiet -filter {REF_NAME == ISERDESE3}]
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_clock_groups -name nand_vs_ctrl_async -asynchronous -group [get_clocks -quiet -include_generated_clocks nand_clk_fast_*] -group [get_clocks -quiet -include_generated_clocks clk_ctrl_50_*]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN H21             [get_ports clk_in1_0]
set_property src_info {type:XDC file:1 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV28 [get_ports {IO_NAND_DQ_0[0]}]   ;# DQ0_0
set_property src_info {type:XDC file:1 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU28 [get_ports {IO_NAND_DQ_0[1]}]   ;# DQ1_0
set_property src_info {type:XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AT27 [get_ports {IO_NAND_DQ_0[2]}]   ;# DQ2_0
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR27 [get_ports {IO_NAND_DQ_0[3]}]   ;# DQ3_0
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU26 [get_ports {IO_NAND_DQ_0[4]}]   ;# DQ4_0
set_property src_info {type:XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU25 [get_ports {IO_NAND_DQ_0[5]}]   ;# DQ5_0
set_property src_info {type:XDC file:1 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW27 [get_ports {IO_NAND_DQ_0[6]}]   ;# DQ6_0
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV27 [get_ports {IO_NAND_DQ_0[7]}]   ;# DQ7_0
set_property src_info {type:XDC file:1 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV26 [get_ports {IO_NAND_DQS_P_0[0]}] ;# DQS_0_P
set_property src_info {type:XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW26 [get_ports {IO_NAND_DQS_N_0[0]}] ;# DQS_0_N
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA28 [get_ports {O_NAND_RE_P_0[0]}]   ;# RE_0_P
set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB28 [get_ports {O_NAND_RE_N_0[0]}]   ;# RE_0_N
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM28 [get_ports {O_NAND_CE_N_0[0]}]  ;# CE0_0_N
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN28 [get_ports {I_NAND_RB_N_0[0]}]  ;# RB0_0_N
set_property src_info {type:XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU24 [get_ports {O_NAND_WE_N_0[0]}]  ;# WE_0_N
set_property src_info {type:XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AP27 [get_ports {O_NAND_CLE_0[0]}]   ;# CLE_0
set_property src_info {type:XDC file:1 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB24 [get_ports {O_NAND_ALE_0[0]}]   ;# ALE_0
set_property src_info {type:XDC file:1 line:71 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY24 [get_ports {O_NAND_WP_N_0[0]}]  ;# WP_0_N
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR24 [get_ports {IO_NAND_DQ_0[8]}]   ;# DQ0_1
set_property src_info {type:XDC file:1 line:80 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR28 [get_ports {IO_NAND_DQ_0[9]}]   ;# DQ1_1
set_property src_info {type:XDC file:1 line:81 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR25 [get_ports {IO_NAND_DQ_0[10]}]  ;# DQ2_1
set_property src_info {type:XDC file:1 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AT28 [get_ports {IO_NAND_DQ_0[11]}]  ;# DQ3_1
set_property src_info {type:XDC file:1 line:83 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY25 [get_ports {IO_NAND_DQ_0[12]}]  ;# DQ4_1
set_property src_info {type:XDC file:1 line:84 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA26 [get_ports {IO_NAND_DQ_0[13]}]  ;# DQ5_1
set_property src_info {type:XDC file:1 line:85 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA25 [get_ports {IO_NAND_DQ_0[14]}]  ;# DQ6_1
set_property src_info {type:XDC file:1 line:86 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB26 [get_ports {IO_NAND_DQ_0[15]}]  ;# DQ7_1
set_property src_info {type:XDC file:1 line:88 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AT25 [get_ports {IO_NAND_DQS_P_0[1]}] ;# DQS_1_P
set_property src_info {type:XDC file:1 line:89 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AT26 [get_ports {IO_NAND_DQS_N_0[1]}] ;# DQS_1_N
set_property src_info {type:XDC file:1 line:90 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY27 [get_ports {O_NAND_RE_P_0[1]}]   ;# RE_1_P
set_property src_info {type:XDC file:1 line:91 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY28 [get_ports {O_NAND_RE_N_0[1]}]   ;# RE_1_N
set_property src_info {type:XDC file:1 line:93 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB25 [get_ports {O_NAND_CE_N_0[1]}]  ;# CE0_1_N
set_property src_info {type:XDC file:1 line:94 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW24 [get_ports {I_NAND_RB_N_0[1]}]  ;# RB0_1_N
set_property src_info {type:XDC file:1 line:95 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN26 [get_ports {O_NAND_WE_N_0[1]}]  ;# WE_1_N
set_property src_info {type:XDC file:1 line:96 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM26 [get_ports {O_NAND_CLE_0[1]}]   ;# CLE_1
set_property src_info {type:XDC file:1 line:97 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV24 [get_ports {O_NAND_ALE_0[1]}]   ;# ALE_1
set_property src_info {type:XDC file:1 line:98 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN27 [get_ports {O_NAND_WP_N_0[1]}]  ;# WP_1_N
set_property src_info {type:XDC file:1 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR20 [get_ports {IO_NAND_DQ_0[16]}]  ;# DQ0_2
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AP22 [get_ports {IO_NAND_DQ_0[17]}]  ;# DQ1_2
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN22 [get_ports {IO_NAND_DQ_0[18]}]  ;# DQ2_2
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB20 [get_ports {IO_NAND_DQ_0[19]}]  ;# DQ3_2
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA20 [get_ports {IO_NAND_DQ_0[20]}]  ;# DQ4_2
set_property src_info {type:XDC file:1 line:108 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY20 [get_ports {IO_NAND_DQ_0[21]}]  ;# DQ5_2
set_property src_info {type:XDC file:1 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AR19 [get_ports {IO_NAND_DQ_0[22]}]  ;# DQ6_2
set_property src_info {type:XDC file:1 line:110 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AP19 [get_ports {IO_NAND_DQ_0[23]}]  ;# DQ7_2
set_property src_info {type:XDC file:1 line:112 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA22 [get_ports {IO_NAND_DQS_P_0[2]}] ;# DQS_2_P
set_property src_info {type:XDC file:1 line:113 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BA21 [get_ports {IO_NAND_DQS_N_0[2]}] ;# DQS_2_N
set_property src_info {type:XDC file:1 line:114 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AJ22 [get_ports {O_NAND_RE_P_0[2]}]   ;# RE_2_P
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AK22 [get_ports {O_NAND_RE_N_0[2]}]   ;# RE_2_N
set_property src_info {type:XDC file:1 line:117 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM21 [get_ports {O_NAND_CE_N_0[2]}]  ;# CE1_0_N
set_property src_info {type:XDC file:1 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM20 [get_ports {I_NAND_RB_N_0[2]}]  ;# RB1_0_N
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN BB19 [get_ports {O_NAND_WE_N_0[2]}]  ;# WE_2_N
set_property src_info {type:XDC file:1 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AL21 [get_ports {O_NAND_CLE_0[2]}]   ;# CLE_2
set_property src_info {type:XDC file:1 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW22 [get_ports {O_NAND_ALE_0[2]}]   ;# ALE_2
set_property src_info {type:XDC file:1 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV22 [get_ports {O_NAND_WP_N_0[2]}]  ;# WP_2_N
set_property src_info {type:XDC file:1 line:127 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN21 [get_ports {IO_NAND_DQ_0[24]}]  ;# DQ0_3
set_property src_info {type:XDC file:1 line:128 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AJ21 [get_ports {IO_NAND_DQ_0[25]}]  ;# DQ1_3
set_property src_info {type:XDC file:1 line:129 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AP21 [get_ports {IO_NAND_DQ_0[26]}]  ;# DQ2_3
set_property src_info {type:XDC file:1 line:130 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AJ20 [get_ports {IO_NAND_DQ_0[27]}]  ;# DQ3_3
set_property src_info {type:XDC file:1 line:131 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW20 [get_ports {IO_NAND_DQ_0[28]}]  ;# DQ4_3
set_property src_info {type:XDC file:1 line:132 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU21 [get_ports {IO_NAND_DQ_0[29]}]  ;# DQ5_3
set_property src_info {type:XDC file:1 line:133 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AW19 [get_ports {IO_NAND_DQ_0[30]}]  ;# DQ6_3
set_property src_info {type:XDC file:1 line:134 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV21 [get_ports {IO_NAND_DQ_0[31]}]  ;# DQ7_3
set_property src_info {type:XDC file:1 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AK20 [get_ports {IO_NAND_DQS_P_0[3]}] ;# DQS_3_P
set_property src_info {type:XDC file:1 line:137 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AK19 [get_ports {IO_NAND_DQS_N_0[3]}] ;# DQS_3_N
set_property src_info {type:XDC file:1 line:138 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AU23 [get_ports {O_NAND_RE_P_0[3]}]   ;# RE_3_P
set_property src_info {type:XDC file:1 line:139 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AV23 [get_ports {O_NAND_RE_N_0[3]}]   ;# RE_3_N
set_property src_info {type:XDC file:1 line:141 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY19 [get_ports {O_NAND_CE_N_0[3]}]  ;# CE1_1_N
set_property src_info {type:XDC file:1 line:142 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AY18 [get_ports {I_NAND_RB_N_0[3]}]  ;# RB1_1_N
set_property src_info {type:XDC file:1 line:143 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AP20 [get_ports {O_NAND_WE_N_0[3]}]  ;# WE_3_N
set_property src_info {type:XDC file:1 line:144 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AM19 [get_ports {O_NAND_CLE_0[3]}]   ;# CLE_3
set_property src_info {type:XDC file:1 line:145 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AL22 [get_ports {O_NAND_ALE_0[3]}]   ;# ALE_3
set_property src_info {type:XDC file:1 line:146 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN AN19 [get_ports {O_NAND_WP_N_0[3]}]  ;# WP_3_N
