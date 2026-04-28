################################################################################
# NAND Flash Controller Pin Constraints for Z19 (4 channels)
# Source:
# - REF_DOC/FMC2_pinlist.xlsx (nand0 + nand1 sheets)
# - REF_DOC/Z19_BD.xdc (single-channel timing intent)
################################################################################

# -----------------------------------------------------------------------------
# CDC and SERDES timing exceptions (from single-channel reference, generalized)
# -----------------------------------------------------------------------------
set_false_path -to   [get_pins -hier -quiet *sync_flop*/D]
set_false_path -from [get_pins -hier -quiet *sync_flop*/C]
set_false_path -to   [get_pins -hier -quiet *ISERDESE3_*/D]

set_false_path \
    -from [get_cells -hierarchical -quiet -filter {REF_NAME == OSERDESE3}] \
    -to   [get_cells -hierarchical -quiet -filter {REF_NAME == ISERDESE3}]

# fast(400M) and slow(100M) are synchronous (same MMCM),
# both asynchronous to ctrl_50 domain through async FIFOs.
set_clock_groups -name nand_vs_ctrl_async -asynchronous \
    -group [get_clocks -quiet -include_generated_clocks nand_clk_fast_*] \
    -group [get_clocks -quiet -include_generated_clocks clk_ctrl_50_*]

# -----------------------------------------------------------------------------
# IOSTANDARD policy
# -----------------------------------------------------------------------------
set_property IOSTANDARD LVCMOS18        [get_ports {O_NAND_CE_N_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {I_NAND_RB_N_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {O_NAND_WE_N_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {O_NAND_CLE_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {O_NAND_ALE_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {O_NAND_WP_N_0[*]}]
set_property IOSTANDARD LVCMOS18        [get_ports {IO_NAND_DQ_0[*]}]
set_property IOSTANDARD DIFF_HSTL_I_18  [get_ports {O_NAND_RE_P_0[*]}]
set_property IOSTANDARD DIFF_HSTL_I_18  [get_ports {IO_NAND_DQS_P_0[*]}]

set_property PULLUP true [get_ports {I_NAND_RB_N_0[*]}]

# DDR data rate for SERDES I/O (DQ via ISERDES/OSERDES, DQS/RE differential)
set_property DATA_RATE DDR [get_ports {IO_NAND_DQ_0[*]}]
set_property DATA_RATE DDR [get_ports {IO_NAND_DQS_P_0[*]}]
set_property DATA_RATE DDR [get_ports {O_NAND_RE_P_0[*]}]

# Board clock pin
set_property PACKAGE_PIN H21             [get_ports clk_in1_0]
set_property IOSTANDARD LVCMOS18         [get_ports clk_in1_0]

# -----------------------------------------------------------------------------
# Channel 0 (nand0)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AV28 [get_ports {IO_NAND_DQ_0[0]}]   ;# DQ0_0
set_property PACKAGE_PIN AU28 [get_ports {IO_NAND_DQ_0[1]}]   ;# DQ1_0
set_property PACKAGE_PIN AT27 [get_ports {IO_NAND_DQ_0[2]}]   ;# DQ2_0
set_property PACKAGE_PIN AR27 [get_ports {IO_NAND_DQ_0[3]}]   ;# DQ3_0
set_property PACKAGE_PIN AU26 [get_ports {IO_NAND_DQ_0[4]}]   ;# DQ4_0
set_property PACKAGE_PIN AU25 [get_ports {IO_NAND_DQ_0[5]}]   ;# DQ5_0
set_property PACKAGE_PIN AW27 [get_ports {IO_NAND_DQ_0[6]}]   ;# DQ6_0
set_property PACKAGE_PIN AV27 [get_ports {IO_NAND_DQ_0[7]}]   ;# DQ7_0

set_property PACKAGE_PIN AV26 [get_ports {IO_NAND_DQS_P_0[0]}] ;# DQS_0_P
set_property PACKAGE_PIN AW26 [get_ports {IO_NAND_DQS_N_0[0]}] ;# DQS_0_N
set_property PACKAGE_PIN BA28 [get_ports {O_NAND_RE_P_0[0]}]   ;# RE_0_P
set_property PACKAGE_PIN BB28 [get_ports {O_NAND_RE_N_0[0]}]   ;# RE_0_N

set_property PACKAGE_PIN AM28 [get_ports {O_NAND_CE_N_0[0]}]  ;# CE0_0_N
set_property PACKAGE_PIN AN28 [get_ports {I_NAND_RB_N_0[0]}]  ;# RB0_0_N
set_property PACKAGE_PIN AU24 [get_ports {O_NAND_WE_N_0[0]}]  ;# WE_0_N
set_property PACKAGE_PIN AP27 [get_ports {O_NAND_CLE_0[0]}]   ;# CLE_0
set_property PACKAGE_PIN BB24 [get_ports {O_NAND_ALE_0[0]}]   ;# ALE_0
set_property PACKAGE_PIN AY24 [get_ports {O_NAND_WP_N_0[0]}]  ;# WP_0_N




# -----------------------------------------------------------------------------
# Channel 1 (nand0)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AR24 [get_ports {IO_NAND_DQ_0[8]}]   ;# DQ0_1
set_property PACKAGE_PIN AR28 [get_ports {IO_NAND_DQ_0[9]}]   ;# DQ1_1
set_property PACKAGE_PIN AR25 [get_ports {IO_NAND_DQ_0[10]}]  ;# DQ2_1
set_property PACKAGE_PIN AT28 [get_ports {IO_NAND_DQ_0[11]}]  ;# DQ3_1
set_property PACKAGE_PIN AY25 [get_ports {IO_NAND_DQ_0[12]}]  ;# DQ4_1
set_property PACKAGE_PIN BA26 [get_ports {IO_NAND_DQ_0[13]}]  ;# DQ5_1
set_property PACKAGE_PIN BA25 [get_ports {IO_NAND_DQ_0[14]}]  ;# DQ6_1
set_property PACKAGE_PIN BB26 [get_ports {IO_NAND_DQ_0[15]}]  ;# DQ7_1

set_property PACKAGE_PIN AT25 [get_ports {IO_NAND_DQS_P_0[1]}] ;# DQS_1_P
set_property PACKAGE_PIN AT26 [get_ports {IO_NAND_DQS_N_0[1]}] ;# DQS_1_N
set_property PACKAGE_PIN AY27 [get_ports {O_NAND_RE_P_0[1]}]   ;# RE_1_P
set_property PACKAGE_PIN AY28 [get_ports {O_NAND_RE_N_0[1]}]   ;# RE_1_N

set_property PACKAGE_PIN BB25 [get_ports {O_NAND_CE_N_0[1]}]  ;# CE0_1_N
set_property PACKAGE_PIN AW24 [get_ports {I_NAND_RB_N_0[1]}]  ;# RB0_1_N
set_property PACKAGE_PIN AN26 [get_ports {O_NAND_WE_N_0[1]}]  ;# WE_1_N
set_property PACKAGE_PIN AM26 [get_ports {O_NAND_CLE_0[1]}]   ;# CLE_1
set_property PACKAGE_PIN AV24 [get_ports {O_NAND_ALE_0[1]}]   ;# ALE_1
set_property PACKAGE_PIN AN27 [get_ports {O_NAND_WP_N_0[1]}]  ;# WP_1_N

# -----------------------------------------------------------------------------
# Channel 2 (nand1)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AR20 [get_ports {IO_NAND_DQ_0[16]}]  ;# DQ0_2
set_property PACKAGE_PIN AP22 [get_ports {IO_NAND_DQ_0[17]}]  ;# DQ1_2
set_property PACKAGE_PIN AN22 [get_ports {IO_NAND_DQ_0[18]}]  ;# DQ2_2
set_property PACKAGE_PIN BB20 [get_ports {IO_NAND_DQ_0[19]}]  ;# DQ3_2
set_property PACKAGE_PIN BA20 [get_ports {IO_NAND_DQ_0[20]}]  ;# DQ4_2
set_property PACKAGE_PIN AY20 [get_ports {IO_NAND_DQ_0[21]}]  ;# DQ5_2
set_property PACKAGE_PIN AR19 [get_ports {IO_NAND_DQ_0[22]}]  ;# DQ6_2
set_property PACKAGE_PIN AP19 [get_ports {IO_NAND_DQ_0[23]}]  ;# DQ7_2

set_property PACKAGE_PIN BA22 [get_ports {IO_NAND_DQS_P_0[2]}] ;# DQS_2_P
set_property PACKAGE_PIN BA21 [get_ports {IO_NAND_DQS_N_0[2]}] ;# DQS_2_N
set_property PACKAGE_PIN AJ22 [get_ports {O_NAND_RE_P_0[2]}]   ;# RE_2_P
set_property PACKAGE_PIN AK22 [get_ports {O_NAND_RE_N_0[2]}]   ;# RE_2_N

set_property PACKAGE_PIN AM21 [get_ports {O_NAND_CE_N_0[2]}]  ;# CE1_0_N
set_property PACKAGE_PIN AM20 [get_ports {I_NAND_RB_N_0[2]}]  ;# RB1_0_N
set_property PACKAGE_PIN BB19 [get_ports {O_NAND_WE_N_0[2]}]  ;# WE_2_N
set_property PACKAGE_PIN AL21 [get_ports {O_NAND_CLE_0[2]}]   ;# CLE_2
set_property PACKAGE_PIN AW22 [get_ports {O_NAND_ALE_0[2]}]   ;# ALE_2
set_property PACKAGE_PIN AV22 [get_ports {O_NAND_WP_N_0[2]}]  ;# WP_2_N

# -----------------------------------------------------------------------------
# Channel 3 (nand1)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN AN21 [get_ports {IO_NAND_DQ_0[24]}]  ;# DQ0_3
set_property PACKAGE_PIN AJ21 [get_ports {IO_NAND_DQ_0[25]}]  ;# DQ1_3
set_property PACKAGE_PIN AP21 [get_ports {IO_NAND_DQ_0[26]}]  ;# DQ2_3
set_property PACKAGE_PIN AJ20 [get_ports {IO_NAND_DQ_0[27]}]  ;# DQ3_3
set_property PACKAGE_PIN AW20 [get_ports {IO_NAND_DQ_0[28]}]  ;# DQ4_3
set_property PACKAGE_PIN AU21 [get_ports {IO_NAND_DQ_0[29]}]  ;# DQ5_3
set_property PACKAGE_PIN AW19 [get_ports {IO_NAND_DQ_0[30]}]  ;# DQ6_3
set_property PACKAGE_PIN AV21 [get_ports {IO_NAND_DQ_0[31]}]  ;# DQ7_3

set_property PACKAGE_PIN AK20 [get_ports {IO_NAND_DQS_P_0[3]}] ;# DQS_3_P
set_property PACKAGE_PIN AK19 [get_ports {IO_NAND_DQS_N_0[3]}] ;# DQS_3_N
set_property PACKAGE_PIN AU23 [get_ports {O_NAND_RE_P_0[3]}]   ;# RE_3_P
set_property PACKAGE_PIN AV23 [get_ports {O_NAND_RE_N_0[3]}]   ;# RE_3_N

set_property PACKAGE_PIN AY19 [get_ports {O_NAND_CE_N_0[3]}]  ;# CE1_1_N
set_property PACKAGE_PIN AY18 [get_ports {I_NAND_RB_N_0[3]}]  ;# RB1_1_N
set_property PACKAGE_PIN AP20 [get_ports {O_NAND_WE_N_0[3]}]  ;# WE_3_N
set_property PACKAGE_PIN AM19 [get_ports {O_NAND_CLE_0[3]}]   ;# CLE_3
set_property PACKAGE_PIN AL22 [get_ports {O_NAND_ALE_0[3]}]   ;# ALE_3
set_property PACKAGE_PIN AN19 [get_ports {O_NAND_WP_N_0[3]}]  ;# WP_3_N

# -----------------------------------------------------------------------------
# Channel 3 floorplan v3
# - Keep scope on CH3 PHY hierarchy to reduce cross-channel perturbation
# - Use legal, moderate region ranges on this device
# - Keep routing containment disabled to avoid over-constraining global routing
# -----------------------------------------------------------------------------
create_pblock pblock_nfc_ch3
resize_pblock [get_pblocks pblock_nfc_ch3] -add {SLICE_X38Y24:SLICE_X58Y96}
resize_pblock [get_pblocks pblock_nfc_ch3] -add {RAMB36_X4Y20:RAMB36_X6Y30}
add_cells_to_pblock [get_pblocks pblock_nfc_ch3] \
    [get_cells -hierarchical -quiet {NFC_4Channel_bd_i/nfc_top_0/inst/nfc_channel_inst_3/fcc_top_1way_inst/fcc_core/fcc_phy*}]
set_property CONTAIN_ROUTING false [get_pblocks pblock_nfc_ch3]
