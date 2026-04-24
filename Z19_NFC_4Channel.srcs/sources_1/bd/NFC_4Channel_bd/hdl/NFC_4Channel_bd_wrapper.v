//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Apr 24 14:42:35 2026
//Host        : DESKTOP-TRF6PNO running 64-bit major release  (build 9200)
//Command     : generate_target NFC_4Channel_bd_wrapper.bd
//Design      : NFC_4Channel_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module NFC_4Channel_bd_wrapper
   (IO_NAND_DQS_N_0,
    IO_NAND_DQS_P_0,
    IO_NAND_DQ_0,
    I_NAND_RB_N_0,
    O_NAND_ALE_0,
    O_NAND_CE_N_0,
    O_NAND_CLE_0,
    O_NAND_RE_N_0,
    O_NAND_RE_P_0,
    O_NAND_WE_N_0,
    O_NAND_WP_N_0,
    clk_in1_0);
  inout [3:0]IO_NAND_DQS_N_0;
  inout [3:0]IO_NAND_DQS_P_0;
  inout [31:0]IO_NAND_DQ_0;
  input [3:0]I_NAND_RB_N_0;
  output [3:0]O_NAND_ALE_0;
  output [3:0]O_NAND_CE_N_0;
  output [3:0]O_NAND_CLE_0;
  output [3:0]O_NAND_RE_N_0;
  output [3:0]O_NAND_RE_P_0;
  output [3:0]O_NAND_WE_N_0;
  output [3:0]O_NAND_WP_N_0;
  input clk_in1_0;

  wire [3:0]IO_NAND_DQS_N_0;
  wire [3:0]IO_NAND_DQS_P_0;
  wire [31:0]IO_NAND_DQ_0;
  wire [3:0]I_NAND_RB_N_0;
  wire [3:0]O_NAND_ALE_0;
  wire [3:0]O_NAND_CE_N_0;
  wire [3:0]O_NAND_CLE_0;
  wire [3:0]O_NAND_RE_N_0;
  wire [3:0]O_NAND_RE_P_0;
  wire [3:0]O_NAND_WE_N_0;
  wire [3:0]O_NAND_WP_N_0;
  wire clk_in1_0;

  NFC_4Channel_bd NFC_4Channel_bd_i
       (.IO_NAND_DQS_N_0(IO_NAND_DQS_N_0),
        .IO_NAND_DQS_P_0(IO_NAND_DQS_P_0),
        .IO_NAND_DQ_0(IO_NAND_DQ_0),
        .I_NAND_RB_N_0(I_NAND_RB_N_0),
        .O_NAND_ALE_0(O_NAND_ALE_0),
        .O_NAND_CE_N_0(O_NAND_CE_N_0),
        .O_NAND_CLE_0(O_NAND_CLE_0),
        .O_NAND_RE_N_0(O_NAND_RE_N_0),
        .O_NAND_RE_P_0(O_NAND_RE_P_0),
        .O_NAND_WE_N_0(O_NAND_WE_N_0),
        .O_NAND_WP_N_0(O_NAND_WP_N_0),
        .clk_in1_0(clk_in1_0));
endmodule
