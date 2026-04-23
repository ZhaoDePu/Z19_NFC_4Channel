-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed Apr 22 16:48:41 2026
-- Host        : DESKTOP-TRF6PNO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx_2019_2/RTL_prj/OCOWFC_Z19/OCOWFC_Z19/Z19_NFC_4Chanel/Z19_NFC_4Channel/Z19_NFC_4Channel.srcs/sources_1/bd/NFC_4Channel_bd/ip/NFC_4Channel_bd_clk_wiz_0_0/NFC_4Channel_bd_clk_wiz_0_0_stub.vhdl
-- Design      : NFC_4Channel_bd_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu19eg-ffvc1760-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NFC_4Channel_bd_clk_wiz_0_0 is
  Port ( 
    nand_clk_fast : out STD_LOGIC;
    clk_ref : out STD_LOGIC;
    clk_ctrl_50 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end NFC_4Channel_bd_clk_wiz_0_0;

architecture stub of NFC_4Channel_bd_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "nand_clk_fast,clk_ref,clk_ctrl_50,resetn,locked,clk_in1";
begin
end;
