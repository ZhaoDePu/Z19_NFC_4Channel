-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed Apr 22 16:49:25 2026
-- Host        : DESKTOP-TRF6PNO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ NFC_4Channel_bd_nfc_top_0_0_stub.vhdl
-- Design      : NFC_4Channel_bd_nfc_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu19eg-ffvc1760-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    nand_clk_fast : in STD_LOGIC;
    nand_usr_clk : in STD_LOGIC;
    nand_clk_locked : in STD_LOGIC;
    s_axil_aclk : in STD_LOGIC;
    s_axil_aresetn : in STD_LOGIC;
    s_axil_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axil_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axil_awvalid : in STD_LOGIC;
    s_axil_awready : out STD_LOGIC;
    s_axil_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axil_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axil_wvalid : in STD_LOGIC;
    s_axil_wready : out STD_LOGIC;
    s_axil_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axil_bvalid : out STD_LOGIC;
    s_axil_bready : in STD_LOGIC;
    s_axil_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axil_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axil_arvalid : in STD_LOGIC;
    s_axil_arready : out STD_LOGIC;
    s_axil_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axil_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axil_rvalid : out STD_LOGIC;
    s_axil_rready : in STD_LOGIC;
    s_axis_tvalid_0 : in STD_LOGIC;
    s_axis_tready_0 : out STD_LOGIC;
    s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast_0 : in STD_LOGIC;
    m_axis_tvalid_0 : out STD_LOGIC;
    m_axis_tready_0 : in STD_LOGIC;
    m_axis_tdata_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast_0 : out STD_LOGIC;
    m_axis_tid_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tvalid_1 : in STD_LOGIC;
    s_axis_tready_1 : out STD_LOGIC;
    s_axis_tdata_1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast_1 : in STD_LOGIC;
    m_axis_tvalid_1 : out STD_LOGIC;
    m_axis_tready_1 : in STD_LOGIC;
    m_axis_tdata_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast_1 : out STD_LOGIC;
    m_axis_tid_1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser_1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tvalid_2 : in STD_LOGIC;
    s_axis_tready_2 : out STD_LOGIC;
    s_axis_tdata_2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast_2 : in STD_LOGIC;
    m_axis_tvalid_2 : out STD_LOGIC;
    m_axis_tready_2 : in STD_LOGIC;
    m_axis_tdata_2 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast_2 : out STD_LOGIC;
    m_axis_tid_2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser_2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_tvalid_3 : in STD_LOGIC;
    s_axis_tready_3 : out STD_LOGIC;
    s_axis_tdata_3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_tlast_3 : in STD_LOGIC;
    m_axis_tvalid_3 : out STD_LOGIC;
    m_axis_tready_3 : in STD_LOGIC;
    m_axis_tdata_3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tkeep_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tlast_3 : out STD_LOGIC;
    m_axis_tid_3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_tuser_3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_CE_N : out STD_LOGIC_VECTOR ( 3 downto 0 );
    I_NAND_RB_N : in STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_WE_N : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_CLE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_ALE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_WP_N : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_RE_P : out STD_LOGIC_VECTOR ( 3 downto 0 );
    O_NAND_RE_N : out STD_LOGIC_VECTOR ( 3 downto 0 );
    IO_NAND_DQS_P : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    IO_NAND_DQS_N : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    IO_NAND_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "nand_clk_fast,nand_usr_clk,nand_clk_locked,s_axil_aclk,s_axil_aresetn,s_axil_awaddr[31:0],s_axil_awprot[2:0],s_axil_awvalid,s_axil_awready,s_axil_wdata[31:0],s_axil_wstrb[3:0],s_axil_wvalid,s_axil_wready,s_axil_bresp[1:0],s_axil_bvalid,s_axil_bready,s_axil_araddr[31:0],s_axil_arprot[2:0],s_axil_arvalid,s_axil_arready,s_axil_rdata[31:0],s_axil_rresp[1:0],s_axil_rvalid,s_axil_rready,s_axis_tvalid_0,s_axis_tready_0,s_axis_tdata_0[31:0],s_axis_tlast_0,m_axis_tvalid_0,m_axis_tready_0,m_axis_tdata_0[31:0],m_axis_tkeep_0[3:0],m_axis_tlast_0,m_axis_tid_0[15:0],m_axis_tuser_0[3:0],s_axis_tvalid_1,s_axis_tready_1,s_axis_tdata_1[31:0],s_axis_tlast_1,m_axis_tvalid_1,m_axis_tready_1,m_axis_tdata_1[31:0],m_axis_tkeep_1[3:0],m_axis_tlast_1,m_axis_tid_1[15:0],m_axis_tuser_1[3:0],s_axis_tvalid_2,s_axis_tready_2,s_axis_tdata_2[31:0],s_axis_tlast_2,m_axis_tvalid_2,m_axis_tready_2,m_axis_tdata_2[31:0],m_axis_tkeep_2[3:0],m_axis_tlast_2,m_axis_tid_2[15:0],m_axis_tuser_2[3:0],s_axis_tvalid_3,s_axis_tready_3,s_axis_tdata_3[31:0],s_axis_tlast_3,m_axis_tvalid_3,m_axis_tready_3,m_axis_tdata_3[31:0],m_axis_tkeep_3[3:0],m_axis_tlast_3,m_axis_tid_3[15:0],m_axis_tuser_3[3:0],O_NAND_CE_N[3:0],I_NAND_RB_N[3:0],O_NAND_WE_N[3:0],O_NAND_CLE[3:0],O_NAND_ALE[3:0],O_NAND_WP_N[3:0],O_NAND_RE_P[3:0],O_NAND_RE_N[3:0],IO_NAND_DQS_P[3:0],IO_NAND_DQS_N[3:0],IO_NAND_DQ[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "nfc_top,Vivado 2019.2";
begin
end;
