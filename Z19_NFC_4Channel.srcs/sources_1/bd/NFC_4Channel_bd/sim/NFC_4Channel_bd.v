//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Fri Apr 24 14:42:35 2026
//Host        : DESKTOP-TRF6PNO running 64-bit major release  (build 9200)
//Command     : generate_target NFC_4Channel_bd.bd
//Design      : NFC_4Channel_bd
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "NFC_4Channel_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=NFC_4Channel_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=9,da_board_cnt=3,da_bram_cntlr_cnt=8,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "NFC_4Channel_bd.hwdef" *) 
module NFC_4Channel_bd
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN NFC_4Channel_bd_clk_in1_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_in1_0;

  wire [3:0]I_NAND_RB_N_0_1;
  wire [31:0]Net;
  wire [3:0]Net1;
  wire [3:0]Net2;
  wire [14:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [14:0]axi_bram_ctrl_0_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTB_EN;
  wire axi_bram_ctrl_0_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTB_WE;
  wire [14:0]axi_bram_ctrl_1_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_1_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_1_BRAM_PORTA_EN;
  wire axi_bram_ctrl_1_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_1_BRAM_PORTA_WE;
  wire [14:0]axi_bram_ctrl_1_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_1_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_1_BRAM_PORTB_EN;
  wire axi_bram_ctrl_1_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_1_BRAM_PORTB_WE;
  wire [14:0]axi_bram_ctrl_2_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_2_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_2_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_2_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_2_BRAM_PORTA_EN;
  wire axi_bram_ctrl_2_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_2_BRAM_PORTA_WE;
  wire [14:0]axi_bram_ctrl_2_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_2_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_2_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_2_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_2_BRAM_PORTB_EN;
  wire axi_bram_ctrl_2_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_2_BRAM_PORTB_WE;
  wire [14:0]axi_bram_ctrl_3_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_3_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_3_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_3_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_3_BRAM_PORTA_EN;
  wire axi_bram_ctrl_3_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_3_BRAM_PORTA_WE;
  wire [14:0]axi_bram_ctrl_3_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_3_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_3_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_3_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_3_BRAM_PORTB_EN;
  wire axi_bram_ctrl_3_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_3_BRAM_PORTB_WE;
  wire [31:0]axi_dma_0_M_AXIS_MM2S_TDATA;
  wire axi_dma_0_M_AXIS_MM2S_TLAST;
  wire axi_dma_0_M_AXIS_MM2S_TREADY;
  wire axi_dma_0_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma_0_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_0_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_0_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_0_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_0_M_AXI_MM2S_ARPROT;
  wire axi_dma_0_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_0_M_AXI_MM2S_ARSIZE;
  wire axi_dma_0_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma_0_M_AXI_MM2S_RDATA;
  wire axi_dma_0_M_AXI_MM2S_RLAST;
  wire axi_dma_0_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_0_M_AXI_MM2S_RRESP;
  wire axi_dma_0_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_0_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWPROT;
  wire axi_dma_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_0_M_AXI_S2MM_AWSIZE;
  wire axi_dma_0_M_AXI_S2MM_AWVALID;
  wire axi_dma_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_0_M_AXI_S2MM_BRESP;
  wire axi_dma_0_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_0_M_AXI_S2MM_WDATA;
  wire axi_dma_0_M_AXI_S2MM_WLAST;
  wire axi_dma_0_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_0_M_AXI_S2MM_WSTRB;
  wire axi_dma_0_M_AXI_S2MM_WVALID;
  wire [31:0]axi_dma_1_M_AXIS_MM2S_TDATA;
  wire axi_dma_1_M_AXIS_MM2S_TLAST;
  wire axi_dma_1_M_AXIS_MM2S_TREADY;
  wire axi_dma_1_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma_1_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_1_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_1_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_1_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_1_M_AXI_MM2S_ARPROT;
  wire axi_dma_1_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_1_M_AXI_MM2S_ARSIZE;
  wire axi_dma_1_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma_1_M_AXI_MM2S_RDATA;
  wire axi_dma_1_M_AXI_MM2S_RLAST;
  wire axi_dma_1_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_1_M_AXI_MM2S_RRESP;
  wire axi_dma_1_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma_1_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_1_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_1_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_1_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_1_M_AXI_S2MM_AWPROT;
  wire axi_dma_1_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_1_M_AXI_S2MM_AWSIZE;
  wire axi_dma_1_M_AXI_S2MM_AWVALID;
  wire axi_dma_1_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_1_M_AXI_S2MM_BRESP;
  wire axi_dma_1_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_1_M_AXI_S2MM_WDATA;
  wire axi_dma_1_M_AXI_S2MM_WLAST;
  wire axi_dma_1_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_1_M_AXI_S2MM_WSTRB;
  wire axi_dma_1_M_AXI_S2MM_WVALID;
  wire [31:0]axi_dma_2_M_AXIS_MM2S_TDATA;
  wire axi_dma_2_M_AXIS_MM2S_TLAST;
  wire axi_dma_2_M_AXIS_MM2S_TREADY;
  wire axi_dma_2_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma_2_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_2_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_2_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_2_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_2_M_AXI_MM2S_ARPROT;
  wire axi_dma_2_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_2_M_AXI_MM2S_ARSIZE;
  wire axi_dma_2_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma_2_M_AXI_MM2S_RDATA;
  wire axi_dma_2_M_AXI_MM2S_RLAST;
  wire axi_dma_2_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_2_M_AXI_MM2S_RRESP;
  wire axi_dma_2_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma_2_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_2_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_2_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_2_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_2_M_AXI_S2MM_AWPROT;
  wire axi_dma_2_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_2_M_AXI_S2MM_AWSIZE;
  wire axi_dma_2_M_AXI_S2MM_AWVALID;
  wire axi_dma_2_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_2_M_AXI_S2MM_BRESP;
  wire axi_dma_2_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_2_M_AXI_S2MM_WDATA;
  wire axi_dma_2_M_AXI_S2MM_WLAST;
  wire axi_dma_2_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_2_M_AXI_S2MM_WSTRB;
  wire axi_dma_2_M_AXI_S2MM_WVALID;
  wire [31:0]axi_dma_3_M_AXIS_MM2S_TDATA;
  wire axi_dma_3_M_AXIS_MM2S_TLAST;
  wire axi_dma_3_M_AXIS_MM2S_TREADY;
  wire axi_dma_3_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_dma_3_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_dma_3_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_dma_3_M_AXI_MM2S_ARCACHE;
  wire [7:0]axi_dma_3_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_dma_3_M_AXI_MM2S_ARPROT;
  wire axi_dma_3_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_dma_3_M_AXI_MM2S_ARSIZE;
  wire axi_dma_3_M_AXI_MM2S_ARVALID;
  wire [31:0]axi_dma_3_M_AXI_MM2S_RDATA;
  wire axi_dma_3_M_AXI_MM2S_RLAST;
  wire axi_dma_3_M_AXI_MM2S_RREADY;
  wire [1:0]axi_dma_3_M_AXI_MM2S_RRESP;
  wire axi_dma_3_M_AXI_MM2S_RVALID;
  wire [31:0]axi_dma_3_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_dma_3_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_dma_3_M_AXI_S2MM_AWCACHE;
  wire [7:0]axi_dma_3_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_dma_3_M_AXI_S2MM_AWPROT;
  wire axi_dma_3_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_dma_3_M_AXI_S2MM_AWSIZE;
  wire axi_dma_3_M_AXI_S2MM_AWVALID;
  wire axi_dma_3_M_AXI_S2MM_BREADY;
  wire [1:0]axi_dma_3_M_AXI_S2MM_BRESP;
  wire axi_dma_3_M_AXI_S2MM_BVALID;
  wire [31:0]axi_dma_3_M_AXI_S2MM_WDATA;
  wire axi_dma_3_M_AXI_S2MM_WLAST;
  wire axi_dma_3_M_AXI_S2MM_WREADY;
  wire [3:0]axi_dma_3_M_AXI_S2MM_WSTRB;
  wire axi_dma_3_M_AXI_S2MM_WVALID;
  wire clk_in1_0_1;
  wire clk_wiz_0_clk_ctrl_50;
  wire clk_wiz_0_locked;
  wire clk_wiz_0_nand_clk_fast;
  wire [3:0]nfc_top_0_O_NAND_ALE;
  wire [3:0]nfc_top_0_O_NAND_CE_N;
  wire [3:0]nfc_top_0_O_NAND_CLE;
  wire [3:0]nfc_top_0_O_NAND_RE_N;
  wire [3:0]nfc_top_0_O_NAND_RE_P;
  wire [3:0]nfc_top_0_O_NAND_WE_N;
  wire [3:0]nfc_top_0_O_NAND_WP_N;
  wire [31:0]nfc_top_0_m_axis_0_TDATA;
  wire [3:0]nfc_top_0_m_axis_0_TKEEP;
  wire nfc_top_0_m_axis_0_TLAST;
  wire nfc_top_0_m_axis_0_TREADY;
  wire nfc_top_0_m_axis_0_TVALID;
  wire [31:0]nfc_top_0_m_axis_1_TDATA;
  wire [3:0]nfc_top_0_m_axis_1_TKEEP;
  wire nfc_top_0_m_axis_1_TLAST;
  wire nfc_top_0_m_axis_1_TREADY;
  wire nfc_top_0_m_axis_1_TVALID;
  wire [31:0]nfc_top_0_m_axis_2_TDATA;
  wire [3:0]nfc_top_0_m_axis_2_TKEEP;
  wire nfc_top_0_m_axis_2_TLAST;
  wire nfc_top_0_m_axis_2_TREADY;
  wire nfc_top_0_m_axis_2_TVALID;
  wire [31:0]nfc_top_0_m_axis_3_TDATA;
  wire [3:0]nfc_top_0_m_axis_3_TKEEP;
  wire nfc_top_0_m_axis_3_TLAST;
  wire nfc_top_0_m_axis_3_TREADY;
  wire nfc_top_0_m_axis_3_TVALID;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire [9:0]smartconnect_0_M00_AXI_ARADDR;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [9:0]smartconnect_0_M00_AXI_AWADDR;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WREADY;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [9:0]smartconnect_0_M01_AXI_ARADDR;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [9:0]smartconnect_0_M01_AXI_AWADDR;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [31:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [31:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WREADY;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [9:0]smartconnect_0_M02_AXI_ARADDR;
  wire smartconnect_0_M02_AXI_ARREADY;
  wire smartconnect_0_M02_AXI_ARVALID;
  wire [9:0]smartconnect_0_M02_AXI_AWADDR;
  wire smartconnect_0_M02_AXI_AWREADY;
  wire smartconnect_0_M02_AXI_AWVALID;
  wire smartconnect_0_M02_AXI_BREADY;
  wire [1:0]smartconnect_0_M02_AXI_BRESP;
  wire smartconnect_0_M02_AXI_BVALID;
  wire [31:0]smartconnect_0_M02_AXI_RDATA;
  wire smartconnect_0_M02_AXI_RREADY;
  wire [1:0]smartconnect_0_M02_AXI_RRESP;
  wire smartconnect_0_M02_AXI_RVALID;
  wire [31:0]smartconnect_0_M02_AXI_WDATA;
  wire smartconnect_0_M02_AXI_WREADY;
  wire smartconnect_0_M02_AXI_WVALID;
  wire [9:0]smartconnect_0_M03_AXI_ARADDR;
  wire smartconnect_0_M03_AXI_ARREADY;
  wire smartconnect_0_M03_AXI_ARVALID;
  wire [9:0]smartconnect_0_M03_AXI_AWADDR;
  wire smartconnect_0_M03_AXI_AWREADY;
  wire smartconnect_0_M03_AXI_AWVALID;
  wire smartconnect_0_M03_AXI_BREADY;
  wire [1:0]smartconnect_0_M03_AXI_BRESP;
  wire smartconnect_0_M03_AXI_BVALID;
  wire [31:0]smartconnect_0_M03_AXI_RDATA;
  wire smartconnect_0_M03_AXI_RREADY;
  wire [1:0]smartconnect_0_M03_AXI_RRESP;
  wire smartconnect_0_M03_AXI_RVALID;
  wire [31:0]smartconnect_0_M03_AXI_WDATA;
  wire smartconnect_0_M03_AXI_WREADY;
  wire smartconnect_0_M03_AXI_WVALID;
  wire [31:0]smartconnect_0_M04_AXI_ARADDR;
  wire [2:0]smartconnect_0_M04_AXI_ARPROT;
  wire smartconnect_0_M04_AXI_ARREADY;
  wire smartconnect_0_M04_AXI_ARVALID;
  wire [31:0]smartconnect_0_M04_AXI_AWADDR;
  wire [2:0]smartconnect_0_M04_AXI_AWPROT;
  wire smartconnect_0_M04_AXI_AWREADY;
  wire smartconnect_0_M04_AXI_AWVALID;
  wire smartconnect_0_M04_AXI_BREADY;
  wire [1:0]smartconnect_0_M04_AXI_BRESP;
  wire smartconnect_0_M04_AXI_BVALID;
  wire [31:0]smartconnect_0_M04_AXI_RDATA;
  wire smartconnect_0_M04_AXI_RREADY;
  wire [1:0]smartconnect_0_M04_AXI_RRESP;
  wire smartconnect_0_M04_AXI_RVALID;
  wire [31:0]smartconnect_0_M04_AXI_WDATA;
  wire smartconnect_0_M04_AXI_WREADY;
  wire [3:0]smartconnect_0_M04_AXI_WSTRB;
  wire smartconnect_0_M04_AXI_WVALID;
  wire [14:0]smartconnect_1_M00_AXI_ARADDR;
  wire [1:0]smartconnect_1_M00_AXI_ARBURST;
  wire [3:0]smartconnect_1_M00_AXI_ARCACHE;
  wire [7:0]smartconnect_1_M00_AXI_ARLEN;
  wire [0:0]smartconnect_1_M00_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M00_AXI_ARPROT;
  wire smartconnect_1_M00_AXI_ARREADY;
  wire [2:0]smartconnect_1_M00_AXI_ARSIZE;
  wire smartconnect_1_M00_AXI_ARVALID;
  wire [14:0]smartconnect_1_M00_AXI_AWADDR;
  wire [1:0]smartconnect_1_M00_AXI_AWBURST;
  wire [3:0]smartconnect_1_M00_AXI_AWCACHE;
  wire [7:0]smartconnect_1_M00_AXI_AWLEN;
  wire [0:0]smartconnect_1_M00_AXI_AWLOCK;
  wire [2:0]smartconnect_1_M00_AXI_AWPROT;
  wire smartconnect_1_M00_AXI_AWREADY;
  wire [2:0]smartconnect_1_M00_AXI_AWSIZE;
  wire smartconnect_1_M00_AXI_AWVALID;
  wire smartconnect_1_M00_AXI_BREADY;
  wire [1:0]smartconnect_1_M00_AXI_BRESP;
  wire smartconnect_1_M00_AXI_BVALID;
  wire [31:0]smartconnect_1_M00_AXI_RDATA;
  wire smartconnect_1_M00_AXI_RLAST;
  wire smartconnect_1_M00_AXI_RREADY;
  wire [1:0]smartconnect_1_M00_AXI_RRESP;
  wire smartconnect_1_M00_AXI_RVALID;
  wire [31:0]smartconnect_1_M00_AXI_WDATA;
  wire smartconnect_1_M00_AXI_WLAST;
  wire smartconnect_1_M00_AXI_WREADY;
  wire [3:0]smartconnect_1_M00_AXI_WSTRB;
  wire smartconnect_1_M00_AXI_WVALID;
  wire [14:0]smartconnect_1_M01_AXI_ARADDR;
  wire [1:0]smartconnect_1_M01_AXI_ARBURST;
  wire [3:0]smartconnect_1_M01_AXI_ARCACHE;
  wire [7:0]smartconnect_1_M01_AXI_ARLEN;
  wire [0:0]smartconnect_1_M01_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M01_AXI_ARPROT;
  wire smartconnect_1_M01_AXI_ARREADY;
  wire [2:0]smartconnect_1_M01_AXI_ARSIZE;
  wire smartconnect_1_M01_AXI_ARVALID;
  wire [14:0]smartconnect_1_M01_AXI_AWADDR;
  wire [1:0]smartconnect_1_M01_AXI_AWBURST;
  wire [3:0]smartconnect_1_M01_AXI_AWCACHE;
  wire [7:0]smartconnect_1_M01_AXI_AWLEN;
  wire [0:0]smartconnect_1_M01_AXI_AWLOCK;
  wire [2:0]smartconnect_1_M01_AXI_AWPROT;
  wire smartconnect_1_M01_AXI_AWREADY;
  wire [2:0]smartconnect_1_M01_AXI_AWSIZE;
  wire smartconnect_1_M01_AXI_AWVALID;
  wire smartconnect_1_M01_AXI_BREADY;
  wire [1:0]smartconnect_1_M01_AXI_BRESP;
  wire smartconnect_1_M01_AXI_BVALID;
  wire [31:0]smartconnect_1_M01_AXI_RDATA;
  wire smartconnect_1_M01_AXI_RLAST;
  wire smartconnect_1_M01_AXI_RREADY;
  wire [1:0]smartconnect_1_M01_AXI_RRESP;
  wire smartconnect_1_M01_AXI_RVALID;
  wire [31:0]smartconnect_1_M01_AXI_WDATA;
  wire smartconnect_1_M01_AXI_WLAST;
  wire smartconnect_1_M01_AXI_WREADY;
  wire [3:0]smartconnect_1_M01_AXI_WSTRB;
  wire smartconnect_1_M01_AXI_WVALID;
  wire [14:0]smartconnect_1_M02_AXI_ARADDR;
  wire [1:0]smartconnect_1_M02_AXI_ARBURST;
  wire [3:0]smartconnect_1_M02_AXI_ARCACHE;
  wire [7:0]smartconnect_1_M02_AXI_ARLEN;
  wire [0:0]smartconnect_1_M02_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M02_AXI_ARPROT;
  wire smartconnect_1_M02_AXI_ARREADY;
  wire [2:0]smartconnect_1_M02_AXI_ARSIZE;
  wire smartconnect_1_M02_AXI_ARVALID;
  wire [14:0]smartconnect_1_M02_AXI_AWADDR;
  wire [1:0]smartconnect_1_M02_AXI_AWBURST;
  wire [3:0]smartconnect_1_M02_AXI_AWCACHE;
  wire [7:0]smartconnect_1_M02_AXI_AWLEN;
  wire [0:0]smartconnect_1_M02_AXI_AWLOCK;
  wire [2:0]smartconnect_1_M02_AXI_AWPROT;
  wire smartconnect_1_M02_AXI_AWREADY;
  wire [2:0]smartconnect_1_M02_AXI_AWSIZE;
  wire smartconnect_1_M02_AXI_AWVALID;
  wire smartconnect_1_M02_AXI_BREADY;
  wire [1:0]smartconnect_1_M02_AXI_BRESP;
  wire smartconnect_1_M02_AXI_BVALID;
  wire [31:0]smartconnect_1_M02_AXI_RDATA;
  wire smartconnect_1_M02_AXI_RLAST;
  wire smartconnect_1_M02_AXI_RREADY;
  wire [1:0]smartconnect_1_M02_AXI_RRESP;
  wire smartconnect_1_M02_AXI_RVALID;
  wire [31:0]smartconnect_1_M02_AXI_WDATA;
  wire smartconnect_1_M02_AXI_WLAST;
  wire smartconnect_1_M02_AXI_WREADY;
  wire [3:0]smartconnect_1_M02_AXI_WSTRB;
  wire smartconnect_1_M02_AXI_WVALID;
  wire [14:0]smartconnect_1_M03_AXI_ARADDR;
  wire [1:0]smartconnect_1_M03_AXI_ARBURST;
  wire [3:0]smartconnect_1_M03_AXI_ARCACHE;
  wire [7:0]smartconnect_1_M03_AXI_ARLEN;
  wire [0:0]smartconnect_1_M03_AXI_ARLOCK;
  wire [2:0]smartconnect_1_M03_AXI_ARPROT;
  wire smartconnect_1_M03_AXI_ARREADY;
  wire [2:0]smartconnect_1_M03_AXI_ARSIZE;
  wire smartconnect_1_M03_AXI_ARVALID;
  wire [14:0]smartconnect_1_M03_AXI_AWADDR;
  wire [1:0]smartconnect_1_M03_AXI_AWBURST;
  wire [3:0]smartconnect_1_M03_AXI_AWCACHE;
  wire [7:0]smartconnect_1_M03_AXI_AWLEN;
  wire [0:0]smartconnect_1_M03_AXI_AWLOCK;
  wire [2:0]smartconnect_1_M03_AXI_AWPROT;
  wire smartconnect_1_M03_AXI_AWREADY;
  wire [2:0]smartconnect_1_M03_AXI_AWSIZE;
  wire smartconnect_1_M03_AXI_AWVALID;
  wire smartconnect_1_M03_AXI_BREADY;
  wire [1:0]smartconnect_1_M03_AXI_BRESP;
  wire smartconnect_1_M03_AXI_BVALID;
  wire [31:0]smartconnect_1_M03_AXI_RDATA;
  wire smartconnect_1_M03_AXI_RLAST;
  wire smartconnect_1_M03_AXI_RREADY;
  wire [1:0]smartconnect_1_M03_AXI_RRESP;
  wire smartconnect_1_M03_AXI_RVALID;
  wire [31:0]smartconnect_1_M03_AXI_WDATA;
  wire smartconnect_1_M03_AXI_WLAST;
  wire smartconnect_1_M03_AXI_WREADY;
  wire [3:0]smartconnect_1_M03_AXI_WSTRB;
  wire smartconnect_1_M03_AXI_WVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID;
  wire [127:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID;
  wire [39:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID;
  wire [7:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY;
  wire [2:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWUSER;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID;
  wire [31:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA;
  wire [15:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY;
  wire [1:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID;
  wire [31:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY;
  wire [3:0]zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB;
  wire zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID;
  wire zynq_ultra_ps_e_0_pl_resetn0;

  assign I_NAND_RB_N_0_1 = I_NAND_RB_N_0[3:0];
  assign O_NAND_ALE_0[3:0] = nfc_top_0_O_NAND_ALE;
  assign O_NAND_CE_N_0[3:0] = nfc_top_0_O_NAND_CE_N;
  assign O_NAND_CLE_0[3:0] = nfc_top_0_O_NAND_CLE;
  assign O_NAND_RE_N_0[3:0] = nfc_top_0_O_NAND_RE_N;
  assign O_NAND_RE_P_0[3:0] = nfc_top_0_O_NAND_RE_P;
  assign O_NAND_WE_N_0[3:0] = nfc_top_0_O_NAND_WE_N;
  assign O_NAND_WP_N_0[3:0] = nfc_top_0_O_NAND_WP_N;
  assign clk_in1_0_1 = clk_in1_0;
  NFC_4Channel_bd_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_0_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_araddr(smartconnect_1_M00_AXI_ARADDR),
        .s_axi_arburst(smartconnect_1_M00_AXI_ARBURST),
        .s_axi_arcache(smartconnect_1_M00_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(smartconnect_1_M00_AXI_ARLEN),
        .s_axi_arlock(smartconnect_1_M00_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_1_M00_AXI_ARPROT),
        .s_axi_arready(smartconnect_1_M00_AXI_ARREADY),
        .s_axi_arsize(smartconnect_1_M00_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_1_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_1_M00_AXI_AWADDR),
        .s_axi_awburst(smartconnect_1_M00_AXI_AWBURST),
        .s_axi_awcache(smartconnect_1_M00_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_1_M00_AXI_AWLEN),
        .s_axi_awlock(smartconnect_1_M00_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_1_M00_AXI_AWPROT),
        .s_axi_awready(smartconnect_1_M00_AXI_AWREADY),
        .s_axi_awsize(smartconnect_1_M00_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_1_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_1_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_1_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_1_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_1_M00_AXI_RDATA),
        .s_axi_rlast(smartconnect_1_M00_AXI_RLAST),
        .s_axi_rready(smartconnect_1_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_1_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_1_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_1_M00_AXI_WDATA),
        .s_axi_wlast(smartconnect_1_M00_AXI_WLAST),
        .s_axi_wready(smartconnect_1_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_1_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_1_M00_AXI_WVALID));
  NFC_4Channel_bd_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTB_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_0_BRAM_PORTB_WE));
  NFC_4Channel_bd_axi_bram_ctrl_0_1 axi_bram_ctrl_1
       (.bram_addr_a(axi_bram_ctrl_1_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_1_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_1_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_1_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_1_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_1_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_1_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_1_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_1_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_araddr(smartconnect_1_M01_AXI_ARADDR),
        .s_axi_arburst(smartconnect_1_M01_AXI_ARBURST),
        .s_axi_arcache(smartconnect_1_M01_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(smartconnect_1_M01_AXI_ARLEN),
        .s_axi_arlock(smartconnect_1_M01_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_1_M01_AXI_ARPROT),
        .s_axi_arready(smartconnect_1_M01_AXI_ARREADY),
        .s_axi_arsize(smartconnect_1_M01_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_1_M01_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_1_M01_AXI_AWADDR),
        .s_axi_awburst(smartconnect_1_M01_AXI_AWBURST),
        .s_axi_awcache(smartconnect_1_M01_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_1_M01_AXI_AWLEN),
        .s_axi_awlock(smartconnect_1_M01_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_1_M01_AXI_AWPROT),
        .s_axi_awready(smartconnect_1_M01_AXI_AWREADY),
        .s_axi_awsize(smartconnect_1_M01_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_1_M01_AXI_AWVALID),
        .s_axi_bready(smartconnect_1_M01_AXI_BREADY),
        .s_axi_bresp(smartconnect_1_M01_AXI_BRESP),
        .s_axi_bvalid(smartconnect_1_M01_AXI_BVALID),
        .s_axi_rdata(smartconnect_1_M01_AXI_RDATA),
        .s_axi_rlast(smartconnect_1_M01_AXI_RLAST),
        .s_axi_rready(smartconnect_1_M01_AXI_RREADY),
        .s_axi_rresp(smartconnect_1_M01_AXI_RRESP),
        .s_axi_rvalid(smartconnect_1_M01_AXI_RVALID),
        .s_axi_wdata(smartconnect_1_M01_AXI_WDATA),
        .s_axi_wlast(smartconnect_1_M01_AXI_WLAST),
        .s_axi_wready(smartconnect_1_M01_AXI_WREADY),
        .s_axi_wstrb(smartconnect_1_M01_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_1_M01_AXI_WVALID));
  NFC_4Channel_bd_axi_bram_ctrl_1_bram_0 axi_bram_ctrl_1_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_1_BRAM_PORTA_ADDR}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_1_BRAM_PORTB_ADDR}),
        .clka(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_1_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_1_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_1_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_1_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_1_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_1_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_1_BRAM_PORTB_WE));
  NFC_4Channel_bd_axi_bram_ctrl_0_2 axi_bram_ctrl_2
       (.bram_addr_a(axi_bram_ctrl_2_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_2_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_2_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_2_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_2_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_2_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_2_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_2_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_2_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_2_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_2_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_2_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_2_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_2_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_araddr(smartconnect_1_M02_AXI_ARADDR),
        .s_axi_arburst(smartconnect_1_M02_AXI_ARBURST),
        .s_axi_arcache(smartconnect_1_M02_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(smartconnect_1_M02_AXI_ARLEN),
        .s_axi_arlock(smartconnect_1_M02_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_1_M02_AXI_ARPROT),
        .s_axi_arready(smartconnect_1_M02_AXI_ARREADY),
        .s_axi_arsize(smartconnect_1_M02_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_1_M02_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_1_M02_AXI_AWADDR),
        .s_axi_awburst(smartconnect_1_M02_AXI_AWBURST),
        .s_axi_awcache(smartconnect_1_M02_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_1_M02_AXI_AWLEN),
        .s_axi_awlock(smartconnect_1_M02_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_1_M02_AXI_AWPROT),
        .s_axi_awready(smartconnect_1_M02_AXI_AWREADY),
        .s_axi_awsize(smartconnect_1_M02_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_1_M02_AXI_AWVALID),
        .s_axi_bready(smartconnect_1_M02_AXI_BREADY),
        .s_axi_bresp(smartconnect_1_M02_AXI_BRESP),
        .s_axi_bvalid(smartconnect_1_M02_AXI_BVALID),
        .s_axi_rdata(smartconnect_1_M02_AXI_RDATA),
        .s_axi_rlast(smartconnect_1_M02_AXI_RLAST),
        .s_axi_rready(smartconnect_1_M02_AXI_RREADY),
        .s_axi_rresp(smartconnect_1_M02_AXI_RRESP),
        .s_axi_rvalid(smartconnect_1_M02_AXI_RVALID),
        .s_axi_wdata(smartconnect_1_M02_AXI_WDATA),
        .s_axi_wlast(smartconnect_1_M02_AXI_WLAST),
        .s_axi_wready(smartconnect_1_M02_AXI_WREADY),
        .s_axi_wstrb(smartconnect_1_M02_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_1_M02_AXI_WVALID));
  NFC_4Channel_bd_axi_bram_ctrl_2_bram_0 axi_bram_ctrl_2_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_2_BRAM_PORTA_ADDR}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_2_BRAM_PORTB_ADDR}),
        .clka(axi_bram_ctrl_2_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_2_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_2_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_2_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_2_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_2_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_2_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_2_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_2_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_2_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_2_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_2_BRAM_PORTB_WE));
  NFC_4Channel_bd_axi_bram_ctrl_0_3 axi_bram_ctrl_3
       (.bram_addr_a(axi_bram_ctrl_3_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_3_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_3_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_3_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_3_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_3_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_3_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_3_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_3_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_3_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_3_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_3_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_3_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_3_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_araddr(smartconnect_1_M03_AXI_ARADDR),
        .s_axi_arburst(smartconnect_1_M03_AXI_ARBURST),
        .s_axi_arcache(smartconnect_1_M03_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arlen(smartconnect_1_M03_AXI_ARLEN),
        .s_axi_arlock(smartconnect_1_M03_AXI_ARLOCK),
        .s_axi_arprot(smartconnect_1_M03_AXI_ARPROT),
        .s_axi_arready(smartconnect_1_M03_AXI_ARREADY),
        .s_axi_arsize(smartconnect_1_M03_AXI_ARSIZE),
        .s_axi_arvalid(smartconnect_1_M03_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_1_M03_AXI_AWADDR),
        .s_axi_awburst(smartconnect_1_M03_AXI_AWBURST),
        .s_axi_awcache(smartconnect_1_M03_AXI_AWCACHE),
        .s_axi_awlen(smartconnect_1_M03_AXI_AWLEN),
        .s_axi_awlock(smartconnect_1_M03_AXI_AWLOCK),
        .s_axi_awprot(smartconnect_1_M03_AXI_AWPROT),
        .s_axi_awready(smartconnect_1_M03_AXI_AWREADY),
        .s_axi_awsize(smartconnect_1_M03_AXI_AWSIZE),
        .s_axi_awvalid(smartconnect_1_M03_AXI_AWVALID),
        .s_axi_bready(smartconnect_1_M03_AXI_BREADY),
        .s_axi_bresp(smartconnect_1_M03_AXI_BRESP),
        .s_axi_bvalid(smartconnect_1_M03_AXI_BVALID),
        .s_axi_rdata(smartconnect_1_M03_AXI_RDATA),
        .s_axi_rlast(smartconnect_1_M03_AXI_RLAST),
        .s_axi_rready(smartconnect_1_M03_AXI_RREADY),
        .s_axi_rresp(smartconnect_1_M03_AXI_RRESP),
        .s_axi_rvalid(smartconnect_1_M03_AXI_RVALID),
        .s_axi_wdata(smartconnect_1_M03_AXI_WDATA),
        .s_axi_wlast(smartconnect_1_M03_AXI_WLAST),
        .s_axi_wready(smartconnect_1_M03_AXI_WREADY),
        .s_axi_wstrb(smartconnect_1_M03_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_1_M03_AXI_WVALID));
  NFC_4Channel_bd_axi_bram_ctrl_3_bram_0 axi_bram_ctrl_3_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_3_BRAM_PORTA_ADDR}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_3_BRAM_PORTB_ADDR}),
        .clka(axi_bram_ctrl_3_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_3_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_3_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_3_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_3_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_3_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_3_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_3_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_3_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_3_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_3_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_3_BRAM_PORTB_WE));
  NFC_4Channel_bd_axi_dma_0_0 axi_dma_0
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_mm2s_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_mm2s_araddr(axi_dma_0_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_0_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_0_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_0_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_0_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_0_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_0_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_0_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_0_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_0_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_0_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_0_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_0_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_s2mm_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma_0_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tlast(axi_dma_0_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma_0_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_0_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_lite_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_lite_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_lite_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_lite_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_lite_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_lite_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_lite_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_lite_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_lite_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_lite_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_lite_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_lite_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_lite_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_lite_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_lite_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_lite_wvalid(smartconnect_0_M00_AXI_WVALID),
        .s_axis_s2mm_tdata(nfc_top_0_m_axis_0_TDATA),
        .s_axis_s2mm_tkeep(nfc_top_0_m_axis_0_TKEEP),
        .s_axis_s2mm_tlast(nfc_top_0_m_axis_0_TLAST),
        .s_axis_s2mm_tready(nfc_top_0_m_axis_0_TREADY),
        .s_axis_s2mm_tvalid(nfc_top_0_m_axis_0_TVALID));
  NFC_4Channel_bd_axi_dma_0_2 axi_dma_1
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_mm2s_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_mm2s_araddr(axi_dma_1_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_1_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_1_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_1_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_1_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_1_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_1_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_1_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_1_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_1_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_1_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_1_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_1_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_s2mm_awaddr(axi_dma_1_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_1_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_1_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_1_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_1_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_1_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_1_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_1_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_1_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_1_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_1_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_1_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_1_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_1_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_1_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_1_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma_1_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tlast(axi_dma_1_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma_1_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_1_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_lite_araddr(smartconnect_0_M01_AXI_ARADDR),
        .s_axi_lite_arready(smartconnect_0_M01_AXI_ARREADY),
        .s_axi_lite_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .s_axi_lite_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .s_axi_lite_awready(smartconnect_0_M01_AXI_AWREADY),
        .s_axi_lite_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .s_axi_lite_bready(smartconnect_0_M01_AXI_BREADY),
        .s_axi_lite_bresp(smartconnect_0_M01_AXI_BRESP),
        .s_axi_lite_bvalid(smartconnect_0_M01_AXI_BVALID),
        .s_axi_lite_rdata(smartconnect_0_M01_AXI_RDATA),
        .s_axi_lite_rready(smartconnect_0_M01_AXI_RREADY),
        .s_axi_lite_rresp(smartconnect_0_M01_AXI_RRESP),
        .s_axi_lite_rvalid(smartconnect_0_M01_AXI_RVALID),
        .s_axi_lite_wdata(smartconnect_0_M01_AXI_WDATA),
        .s_axi_lite_wready(smartconnect_0_M01_AXI_WREADY),
        .s_axi_lite_wvalid(smartconnect_0_M01_AXI_WVALID),
        .s_axis_s2mm_tdata(nfc_top_0_m_axis_1_TDATA),
        .s_axis_s2mm_tkeep(nfc_top_0_m_axis_1_TKEEP),
        .s_axis_s2mm_tlast(nfc_top_0_m_axis_1_TLAST),
        .s_axis_s2mm_tready(nfc_top_0_m_axis_1_TREADY),
        .s_axis_s2mm_tvalid(nfc_top_0_m_axis_1_TVALID));
  NFC_4Channel_bd_axi_dma_0_3 axi_dma_2
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_mm2s_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_mm2s_araddr(axi_dma_2_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_2_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_2_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_2_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_2_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_2_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_2_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_2_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_2_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_2_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_2_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_2_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_2_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_s2mm_awaddr(axi_dma_2_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_2_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_2_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_2_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_2_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_2_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_2_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_2_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_2_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_2_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_2_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_2_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_2_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_2_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_2_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_2_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma_2_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tlast(axi_dma_2_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma_2_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_2_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_lite_araddr(smartconnect_0_M02_AXI_ARADDR),
        .s_axi_lite_arready(smartconnect_0_M02_AXI_ARREADY),
        .s_axi_lite_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .s_axi_lite_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .s_axi_lite_awready(smartconnect_0_M02_AXI_AWREADY),
        .s_axi_lite_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .s_axi_lite_bready(smartconnect_0_M02_AXI_BREADY),
        .s_axi_lite_bresp(smartconnect_0_M02_AXI_BRESP),
        .s_axi_lite_bvalid(smartconnect_0_M02_AXI_BVALID),
        .s_axi_lite_rdata(smartconnect_0_M02_AXI_RDATA),
        .s_axi_lite_rready(smartconnect_0_M02_AXI_RREADY),
        .s_axi_lite_rresp(smartconnect_0_M02_AXI_RRESP),
        .s_axi_lite_rvalid(smartconnect_0_M02_AXI_RVALID),
        .s_axi_lite_wdata(smartconnect_0_M02_AXI_WDATA),
        .s_axi_lite_wready(smartconnect_0_M02_AXI_WREADY),
        .s_axi_lite_wvalid(smartconnect_0_M02_AXI_WVALID),
        .s_axis_s2mm_tdata(nfc_top_0_m_axis_2_TDATA),
        .s_axis_s2mm_tkeep(nfc_top_0_m_axis_2_TKEEP),
        .s_axis_s2mm_tlast(nfc_top_0_m_axis_2_TLAST),
        .s_axis_s2mm_tready(nfc_top_0_m_axis_2_TREADY),
        .s_axis_s2mm_tvalid(nfc_top_0_m_axis_2_TVALID));
  NFC_4Channel_bd_axi_dma_0_4 axi_dma_3
       (.axi_resetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axi_mm2s_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_mm2s_araddr(axi_dma_3_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_dma_3_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_dma_3_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(axi_dma_3_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_dma_3_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_dma_3_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_dma_3_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(axi_dma_3_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_dma_3_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_dma_3_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_dma_3_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_dma_3_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_dma_3_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(clk_wiz_0_clk_ctrl_50),
        .m_axi_s2mm_awaddr(axi_dma_3_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_dma_3_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_dma_3_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(axi_dma_3_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_dma_3_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_dma_3_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_dma_3_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(axi_dma_3_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_dma_3_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_dma_3_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_dma_3_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_dma_3_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_dma_3_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_dma_3_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_dma_3_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_dma_3_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_tdata(axi_dma_3_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tlast(axi_dma_3_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_dma_3_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_dma_3_M_AXIS_MM2S_TVALID),
        .s_axi_lite_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axi_lite_araddr(smartconnect_0_M03_AXI_ARADDR),
        .s_axi_lite_arready(smartconnect_0_M03_AXI_ARREADY),
        .s_axi_lite_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .s_axi_lite_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .s_axi_lite_awready(smartconnect_0_M03_AXI_AWREADY),
        .s_axi_lite_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .s_axi_lite_bready(smartconnect_0_M03_AXI_BREADY),
        .s_axi_lite_bresp(smartconnect_0_M03_AXI_BRESP),
        .s_axi_lite_bvalid(smartconnect_0_M03_AXI_BVALID),
        .s_axi_lite_rdata(smartconnect_0_M03_AXI_RDATA),
        .s_axi_lite_rready(smartconnect_0_M03_AXI_RREADY),
        .s_axi_lite_rresp(smartconnect_0_M03_AXI_RRESP),
        .s_axi_lite_rvalid(smartconnect_0_M03_AXI_RVALID),
        .s_axi_lite_wdata(smartconnect_0_M03_AXI_WDATA),
        .s_axi_lite_wready(smartconnect_0_M03_AXI_WREADY),
        .s_axi_lite_wvalid(smartconnect_0_M03_AXI_WVALID),
        .s_axis_s2mm_tdata(nfc_top_0_m_axis_3_TDATA),
        .s_axis_s2mm_tkeep(nfc_top_0_m_axis_3_TKEEP),
        .s_axis_s2mm_tlast(nfc_top_0_m_axis_3_TLAST),
        .s_axis_s2mm_tready(nfc_top_0_m_axis_3_TREADY),
        .s_axis_s2mm_tvalid(nfc_top_0_m_axis_3_TVALID));
  NFC_4Channel_bd_clk_wiz_0_0 clk_wiz_0
       (.clk_ctrl_50(clk_wiz_0_clk_ctrl_50),
        .clk_in1(clk_in1_0_1),
        .locked(clk_wiz_0_locked),
        .nand_clk_fast(clk_wiz_0_nand_clk_fast),
        .resetn(zynq_ultra_ps_e_0_pl_resetn0));
  NFC_4Channel_bd_nfc_top_0_0 nfc_top_0
       (.IO_NAND_DQ(IO_NAND_DQ_0[31:0]),
        .IO_NAND_DQS_N(IO_NAND_DQS_N_0[3:0]),
        .IO_NAND_DQS_P(IO_NAND_DQS_P_0[3:0]),
        .I_NAND_RB_N(I_NAND_RB_N_0_1),
        .O_NAND_ALE(nfc_top_0_O_NAND_ALE),
        .O_NAND_CE_N(nfc_top_0_O_NAND_CE_N),
        .O_NAND_CLE(nfc_top_0_O_NAND_CLE),
        .O_NAND_RE_N(nfc_top_0_O_NAND_RE_N),
        .O_NAND_RE_P(nfc_top_0_O_NAND_RE_P),
        .O_NAND_WE_N(nfc_top_0_O_NAND_WE_N),
        .O_NAND_WP_N(nfc_top_0_O_NAND_WP_N),
        .m_axis_tdata_0(nfc_top_0_m_axis_0_TDATA),
        .m_axis_tdata_1(nfc_top_0_m_axis_1_TDATA),
        .m_axis_tdata_2(nfc_top_0_m_axis_2_TDATA),
        .m_axis_tdata_3(nfc_top_0_m_axis_3_TDATA),
        .m_axis_tkeep_0(nfc_top_0_m_axis_0_TKEEP),
        .m_axis_tkeep_1(nfc_top_0_m_axis_1_TKEEP),
        .m_axis_tkeep_2(nfc_top_0_m_axis_2_TKEEP),
        .m_axis_tkeep_3(nfc_top_0_m_axis_3_TKEEP),
        .m_axis_tlast_0(nfc_top_0_m_axis_0_TLAST),
        .m_axis_tlast_1(nfc_top_0_m_axis_1_TLAST),
        .m_axis_tlast_2(nfc_top_0_m_axis_2_TLAST),
        .m_axis_tlast_3(nfc_top_0_m_axis_3_TLAST),
        .m_axis_tready_0(nfc_top_0_m_axis_0_TREADY),
        .m_axis_tready_1(nfc_top_0_m_axis_1_TREADY),
        .m_axis_tready_2(nfc_top_0_m_axis_2_TREADY),
        .m_axis_tready_3(nfc_top_0_m_axis_3_TREADY),
        .m_axis_tvalid_0(nfc_top_0_m_axis_0_TVALID),
        .m_axis_tvalid_1(nfc_top_0_m_axis_1_TVALID),
        .m_axis_tvalid_2(nfc_top_0_m_axis_2_TVALID),
        .m_axis_tvalid_3(nfc_top_0_m_axis_3_TVALID),
        .nand_clk_fast(clk_wiz_0_nand_clk_fast),
        .nand_clk_locked(clk_wiz_0_locked),
        .nand_usr_clk(clk_wiz_0_clk_ctrl_50),
        .s_axil_aclk(clk_wiz_0_clk_ctrl_50),
        .s_axil_araddr(smartconnect_0_M04_AXI_ARADDR),
        .s_axil_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axil_arprot(smartconnect_0_M04_AXI_ARPROT),
        .s_axil_arready(smartconnect_0_M04_AXI_ARREADY),
        .s_axil_arvalid(smartconnect_0_M04_AXI_ARVALID),
        .s_axil_awaddr(smartconnect_0_M04_AXI_AWADDR),
        .s_axil_awprot(smartconnect_0_M04_AXI_AWPROT),
        .s_axil_awready(smartconnect_0_M04_AXI_AWREADY),
        .s_axil_awvalid(smartconnect_0_M04_AXI_AWVALID),
        .s_axil_bready(smartconnect_0_M04_AXI_BREADY),
        .s_axil_bresp(smartconnect_0_M04_AXI_BRESP),
        .s_axil_bvalid(smartconnect_0_M04_AXI_BVALID),
        .s_axil_rdata(smartconnect_0_M04_AXI_RDATA),
        .s_axil_rready(smartconnect_0_M04_AXI_RREADY),
        .s_axil_rresp(smartconnect_0_M04_AXI_RRESP),
        .s_axil_rvalid(smartconnect_0_M04_AXI_RVALID),
        .s_axil_wdata(smartconnect_0_M04_AXI_WDATA),
        .s_axil_wready(smartconnect_0_M04_AXI_WREADY),
        .s_axil_wstrb(smartconnect_0_M04_AXI_WSTRB),
        .s_axil_wvalid(smartconnect_0_M04_AXI_WVALID),
        .s_axis_tdata_0(axi_dma_0_M_AXIS_MM2S_TDATA),
        .s_axis_tdata_1(axi_dma_1_M_AXIS_MM2S_TDATA),
        .s_axis_tdata_2(axi_dma_2_M_AXIS_MM2S_TDATA),
        .s_axis_tdata_3(axi_dma_3_M_AXIS_MM2S_TDATA),
        .s_axis_tlast_0(axi_dma_0_M_AXIS_MM2S_TLAST),
        .s_axis_tlast_1(axi_dma_1_M_AXIS_MM2S_TLAST),
        .s_axis_tlast_2(axi_dma_2_M_AXIS_MM2S_TLAST),
        .s_axis_tlast_3(axi_dma_3_M_AXIS_MM2S_TLAST),
        .s_axis_tready_0(axi_dma_0_M_AXIS_MM2S_TREADY),
        .s_axis_tready_1(axi_dma_1_M_AXIS_MM2S_TREADY),
        .s_axis_tready_2(axi_dma_2_M_AXIS_MM2S_TREADY),
        .s_axis_tready_3(axi_dma_3_M_AXIS_MM2S_TREADY),
        .s_axis_tvalid_0(axi_dma_0_M_AXIS_MM2S_TVALID),
        .s_axis_tvalid_1(axi_dma_1_M_AXIS_MM2S_TVALID),
        .s_axis_tvalid_2(axi_dma_2_M_AXIS_MM2S_TVALID),
        .s_axis_tvalid_3(axi_dma_3_M_AXIS_MM2S_TVALID));
  NFC_4Channel_bd_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(zynq_ultra_ps_e_0_pl_resetn0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_ctrl_50));
  NFC_4Channel_bd_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .M02_AXI_araddr(smartconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arready(smartconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awready(smartconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(smartconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(smartconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(smartconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(smartconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(smartconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(smartconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(smartconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(smartconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(smartconnect_0_M02_AXI_WREADY),
        .M02_AXI_wvalid(smartconnect_0_M02_AXI_WVALID),
        .M03_AXI_araddr(smartconnect_0_M03_AXI_ARADDR),
        .M03_AXI_arready(smartconnect_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(smartconnect_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(smartconnect_0_M03_AXI_AWADDR),
        .M03_AXI_awready(smartconnect_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(smartconnect_0_M03_AXI_AWVALID),
        .M03_AXI_bready(smartconnect_0_M03_AXI_BREADY),
        .M03_AXI_bresp(smartconnect_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(smartconnect_0_M03_AXI_BVALID),
        .M03_AXI_rdata(smartconnect_0_M03_AXI_RDATA),
        .M03_AXI_rready(smartconnect_0_M03_AXI_RREADY),
        .M03_AXI_rresp(smartconnect_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(smartconnect_0_M03_AXI_RVALID),
        .M03_AXI_wdata(smartconnect_0_M03_AXI_WDATA),
        .M03_AXI_wready(smartconnect_0_M03_AXI_WREADY),
        .M03_AXI_wvalid(smartconnect_0_M03_AXI_WVALID),
        .M04_AXI_araddr(smartconnect_0_M04_AXI_ARADDR),
        .M04_AXI_arprot(smartconnect_0_M04_AXI_ARPROT),
        .M04_AXI_arready(smartconnect_0_M04_AXI_ARREADY),
        .M04_AXI_arvalid(smartconnect_0_M04_AXI_ARVALID),
        .M04_AXI_awaddr(smartconnect_0_M04_AXI_AWADDR),
        .M04_AXI_awprot(smartconnect_0_M04_AXI_AWPROT),
        .M04_AXI_awready(smartconnect_0_M04_AXI_AWREADY),
        .M04_AXI_awvalid(smartconnect_0_M04_AXI_AWVALID),
        .M04_AXI_bready(smartconnect_0_M04_AXI_BREADY),
        .M04_AXI_bresp(smartconnect_0_M04_AXI_BRESP),
        .M04_AXI_bvalid(smartconnect_0_M04_AXI_BVALID),
        .M04_AXI_rdata(smartconnect_0_M04_AXI_RDATA),
        .M04_AXI_rready(smartconnect_0_M04_AXI_RREADY),
        .M04_AXI_rresp(smartconnect_0_M04_AXI_RRESP),
        .M04_AXI_rvalid(smartconnect_0_M04_AXI_RVALID),
        .M04_AXI_wdata(smartconnect_0_M04_AXI_WDATA),
        .M04_AXI_wready(smartconnect_0_M04_AXI_WREADY),
        .M04_AXI_wstrb(smartconnect_0_M04_AXI_WSTRB),
        .M04_AXI_wvalid(smartconnect_0_M04_AXI_WVALID),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE),
        .S00_AXI_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARUSER),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE),
        .S00_AXI_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWUSER),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID),
        .aclk(clk_wiz_0_clk_ctrl_50),
        .aclk1(clk_wiz_0_clk_ctrl_50),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  NFC_4Channel_bd_smartconnect_0_1 smartconnect_1
       (.M00_AXI_araddr(smartconnect_1_M00_AXI_ARADDR),
        .M00_AXI_arburst(smartconnect_1_M00_AXI_ARBURST),
        .M00_AXI_arcache(smartconnect_1_M00_AXI_ARCACHE),
        .M00_AXI_arlen(smartconnect_1_M00_AXI_ARLEN),
        .M00_AXI_arlock(smartconnect_1_M00_AXI_ARLOCK),
        .M00_AXI_arprot(smartconnect_1_M00_AXI_ARPROT),
        .M00_AXI_arready(smartconnect_1_M00_AXI_ARREADY),
        .M00_AXI_arsize(smartconnect_1_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(smartconnect_1_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_1_M00_AXI_AWADDR),
        .M00_AXI_awburst(smartconnect_1_M00_AXI_AWBURST),
        .M00_AXI_awcache(smartconnect_1_M00_AXI_AWCACHE),
        .M00_AXI_awlen(smartconnect_1_M00_AXI_AWLEN),
        .M00_AXI_awlock(smartconnect_1_M00_AXI_AWLOCK),
        .M00_AXI_awprot(smartconnect_1_M00_AXI_AWPROT),
        .M00_AXI_awready(smartconnect_1_M00_AXI_AWREADY),
        .M00_AXI_awsize(smartconnect_1_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(smartconnect_1_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_1_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_1_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_1_M00_AXI_RDATA),
        .M00_AXI_rlast(smartconnect_1_M00_AXI_RLAST),
        .M00_AXI_rready(smartconnect_1_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_1_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_1_M00_AXI_WDATA),
        .M00_AXI_wlast(smartconnect_1_M00_AXI_WLAST),
        .M00_AXI_wready(smartconnect_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_1_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_1_M01_AXI_ARADDR),
        .M01_AXI_arburst(smartconnect_1_M01_AXI_ARBURST),
        .M01_AXI_arcache(smartconnect_1_M01_AXI_ARCACHE),
        .M01_AXI_arlen(smartconnect_1_M01_AXI_ARLEN),
        .M01_AXI_arlock(smartconnect_1_M01_AXI_ARLOCK),
        .M01_AXI_arprot(smartconnect_1_M01_AXI_ARPROT),
        .M01_AXI_arready(smartconnect_1_M01_AXI_ARREADY),
        .M01_AXI_arsize(smartconnect_1_M01_AXI_ARSIZE),
        .M01_AXI_arvalid(smartconnect_1_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_1_M01_AXI_AWADDR),
        .M01_AXI_awburst(smartconnect_1_M01_AXI_AWBURST),
        .M01_AXI_awcache(smartconnect_1_M01_AXI_AWCACHE),
        .M01_AXI_awlen(smartconnect_1_M01_AXI_AWLEN),
        .M01_AXI_awlock(smartconnect_1_M01_AXI_AWLOCK),
        .M01_AXI_awprot(smartconnect_1_M01_AXI_AWPROT),
        .M01_AXI_awready(smartconnect_1_M01_AXI_AWREADY),
        .M01_AXI_awsize(smartconnect_1_M01_AXI_AWSIZE),
        .M01_AXI_awvalid(smartconnect_1_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_1_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_1_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_1_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_1_M01_AXI_RDATA),
        .M01_AXI_rlast(smartconnect_1_M01_AXI_RLAST),
        .M01_AXI_rready(smartconnect_1_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_1_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_1_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_1_M01_AXI_WDATA),
        .M01_AXI_wlast(smartconnect_1_M01_AXI_WLAST),
        .M01_AXI_wready(smartconnect_1_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_1_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_1_M01_AXI_WVALID),
        .M02_AXI_araddr(smartconnect_1_M02_AXI_ARADDR),
        .M02_AXI_arburst(smartconnect_1_M02_AXI_ARBURST),
        .M02_AXI_arcache(smartconnect_1_M02_AXI_ARCACHE),
        .M02_AXI_arlen(smartconnect_1_M02_AXI_ARLEN),
        .M02_AXI_arlock(smartconnect_1_M02_AXI_ARLOCK),
        .M02_AXI_arprot(smartconnect_1_M02_AXI_ARPROT),
        .M02_AXI_arready(smartconnect_1_M02_AXI_ARREADY),
        .M02_AXI_arsize(smartconnect_1_M02_AXI_ARSIZE),
        .M02_AXI_arvalid(smartconnect_1_M02_AXI_ARVALID),
        .M02_AXI_awaddr(smartconnect_1_M02_AXI_AWADDR),
        .M02_AXI_awburst(smartconnect_1_M02_AXI_AWBURST),
        .M02_AXI_awcache(smartconnect_1_M02_AXI_AWCACHE),
        .M02_AXI_awlen(smartconnect_1_M02_AXI_AWLEN),
        .M02_AXI_awlock(smartconnect_1_M02_AXI_AWLOCK),
        .M02_AXI_awprot(smartconnect_1_M02_AXI_AWPROT),
        .M02_AXI_awready(smartconnect_1_M02_AXI_AWREADY),
        .M02_AXI_awsize(smartconnect_1_M02_AXI_AWSIZE),
        .M02_AXI_awvalid(smartconnect_1_M02_AXI_AWVALID),
        .M02_AXI_bready(smartconnect_1_M02_AXI_BREADY),
        .M02_AXI_bresp(smartconnect_1_M02_AXI_BRESP),
        .M02_AXI_bvalid(smartconnect_1_M02_AXI_BVALID),
        .M02_AXI_rdata(smartconnect_1_M02_AXI_RDATA),
        .M02_AXI_rlast(smartconnect_1_M02_AXI_RLAST),
        .M02_AXI_rready(smartconnect_1_M02_AXI_RREADY),
        .M02_AXI_rresp(smartconnect_1_M02_AXI_RRESP),
        .M02_AXI_rvalid(smartconnect_1_M02_AXI_RVALID),
        .M02_AXI_wdata(smartconnect_1_M02_AXI_WDATA),
        .M02_AXI_wlast(smartconnect_1_M02_AXI_WLAST),
        .M02_AXI_wready(smartconnect_1_M02_AXI_WREADY),
        .M02_AXI_wstrb(smartconnect_1_M02_AXI_WSTRB),
        .M02_AXI_wvalid(smartconnect_1_M02_AXI_WVALID),
        .M03_AXI_araddr(smartconnect_1_M03_AXI_ARADDR),
        .M03_AXI_arburst(smartconnect_1_M03_AXI_ARBURST),
        .M03_AXI_arcache(smartconnect_1_M03_AXI_ARCACHE),
        .M03_AXI_arlen(smartconnect_1_M03_AXI_ARLEN),
        .M03_AXI_arlock(smartconnect_1_M03_AXI_ARLOCK),
        .M03_AXI_arprot(smartconnect_1_M03_AXI_ARPROT),
        .M03_AXI_arready(smartconnect_1_M03_AXI_ARREADY),
        .M03_AXI_arsize(smartconnect_1_M03_AXI_ARSIZE),
        .M03_AXI_arvalid(smartconnect_1_M03_AXI_ARVALID),
        .M03_AXI_awaddr(smartconnect_1_M03_AXI_AWADDR),
        .M03_AXI_awburst(smartconnect_1_M03_AXI_AWBURST),
        .M03_AXI_awcache(smartconnect_1_M03_AXI_AWCACHE),
        .M03_AXI_awlen(smartconnect_1_M03_AXI_AWLEN),
        .M03_AXI_awlock(smartconnect_1_M03_AXI_AWLOCK),
        .M03_AXI_awprot(smartconnect_1_M03_AXI_AWPROT),
        .M03_AXI_awready(smartconnect_1_M03_AXI_AWREADY),
        .M03_AXI_awsize(smartconnect_1_M03_AXI_AWSIZE),
        .M03_AXI_awvalid(smartconnect_1_M03_AXI_AWVALID),
        .M03_AXI_bready(smartconnect_1_M03_AXI_BREADY),
        .M03_AXI_bresp(smartconnect_1_M03_AXI_BRESP),
        .M03_AXI_bvalid(smartconnect_1_M03_AXI_BVALID),
        .M03_AXI_rdata(smartconnect_1_M03_AXI_RDATA),
        .M03_AXI_rlast(smartconnect_1_M03_AXI_RLAST),
        .M03_AXI_rready(smartconnect_1_M03_AXI_RREADY),
        .M03_AXI_rresp(smartconnect_1_M03_AXI_RRESP),
        .M03_AXI_rvalid(smartconnect_1_M03_AXI_RVALID),
        .M03_AXI_wdata(smartconnect_1_M03_AXI_WDATA),
        .M03_AXI_wlast(smartconnect_1_M03_AXI_WLAST),
        .M03_AXI_wready(smartconnect_1_M03_AXI_WREADY),
        .M03_AXI_wstrb(smartconnect_1_M03_AXI_WSTRB),
        .M03_AXI_wvalid(smartconnect_1_M03_AXI_WVALID),
        .S00_AXI_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .S00_AXI_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .S00_AXI_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .S00_AXI_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .S00_AXI_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .S00_AXI_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .S00_AXI_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .S00_AXI_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .S00_AXI_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .S00_AXI_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .S00_AXI_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .S00_AXI_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .S00_AXI_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .S00_AXI_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .S00_AXI_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .S00_AXI_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .S00_AXI_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .S00_AXI_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .S00_AXI_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .S00_AXI_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .S00_AXI_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .S00_AXI_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .S00_AXI_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .S00_AXI_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .S00_AXI_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .S00_AXI_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .S00_AXI_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .S00_AXI_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .S00_AXI_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .S00_AXI_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .S00_AXI_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .S00_AXI_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .S00_AXI_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .S00_AXI_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .S00_AXI_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .S00_AXI_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .S00_AXI_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .S00_AXI_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .S00_AXI_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .S01_AXI_araddr(axi_dma_0_M_AXI_MM2S_ARADDR),
        .S01_AXI_arburst(axi_dma_0_M_AXI_MM2S_ARBURST),
        .S01_AXI_arcache(axi_dma_0_M_AXI_MM2S_ARCACHE),
        .S01_AXI_arlen(axi_dma_0_M_AXI_MM2S_ARLEN),
        .S01_AXI_arlock(1'b0),
        .S01_AXI_arprot(axi_dma_0_M_AXI_MM2S_ARPROT),
        .S01_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arready(axi_dma_0_M_AXI_MM2S_ARREADY),
        .S01_AXI_arsize(axi_dma_0_M_AXI_MM2S_ARSIZE),
        .S01_AXI_arvalid(axi_dma_0_M_AXI_MM2S_ARVALID),
        .S01_AXI_rdata(axi_dma_0_M_AXI_MM2S_RDATA),
        .S01_AXI_rlast(axi_dma_0_M_AXI_MM2S_RLAST),
        .S01_AXI_rready(axi_dma_0_M_AXI_MM2S_RREADY),
        .S01_AXI_rresp(axi_dma_0_M_AXI_MM2S_RRESP),
        .S01_AXI_rvalid(axi_dma_0_M_AXI_MM2S_RVALID),
        .S02_AXI_awaddr(axi_dma_0_M_AXI_S2MM_AWADDR),
        .S02_AXI_awburst(axi_dma_0_M_AXI_S2MM_AWBURST),
        .S02_AXI_awcache(axi_dma_0_M_AXI_S2MM_AWCACHE),
        .S02_AXI_awlen(axi_dma_0_M_AXI_S2MM_AWLEN),
        .S02_AXI_awlock(1'b0),
        .S02_AXI_awprot(axi_dma_0_M_AXI_S2MM_AWPROT),
        .S02_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awready(axi_dma_0_M_AXI_S2MM_AWREADY),
        .S02_AXI_awsize(axi_dma_0_M_AXI_S2MM_AWSIZE),
        .S02_AXI_awvalid(axi_dma_0_M_AXI_S2MM_AWVALID),
        .S02_AXI_bready(axi_dma_0_M_AXI_S2MM_BREADY),
        .S02_AXI_bresp(axi_dma_0_M_AXI_S2MM_BRESP),
        .S02_AXI_bvalid(axi_dma_0_M_AXI_S2MM_BVALID),
        .S02_AXI_wdata(axi_dma_0_M_AXI_S2MM_WDATA),
        .S02_AXI_wlast(axi_dma_0_M_AXI_S2MM_WLAST),
        .S02_AXI_wready(axi_dma_0_M_AXI_S2MM_WREADY),
        .S02_AXI_wstrb(axi_dma_0_M_AXI_S2MM_WSTRB),
        .S02_AXI_wvalid(axi_dma_0_M_AXI_S2MM_WVALID),
        .S03_AXI_araddr(axi_dma_1_M_AXI_MM2S_ARADDR),
        .S03_AXI_arburst(axi_dma_1_M_AXI_MM2S_ARBURST),
        .S03_AXI_arcache(axi_dma_1_M_AXI_MM2S_ARCACHE),
        .S03_AXI_arlen(axi_dma_1_M_AXI_MM2S_ARLEN),
        .S03_AXI_arlock(1'b0),
        .S03_AXI_arprot(axi_dma_1_M_AXI_MM2S_ARPROT),
        .S03_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arready(axi_dma_1_M_AXI_MM2S_ARREADY),
        .S03_AXI_arsize(axi_dma_1_M_AXI_MM2S_ARSIZE),
        .S03_AXI_arvalid(axi_dma_1_M_AXI_MM2S_ARVALID),
        .S03_AXI_rdata(axi_dma_1_M_AXI_MM2S_RDATA),
        .S03_AXI_rlast(axi_dma_1_M_AXI_MM2S_RLAST),
        .S03_AXI_rready(axi_dma_1_M_AXI_MM2S_RREADY),
        .S03_AXI_rresp(axi_dma_1_M_AXI_MM2S_RRESP),
        .S03_AXI_rvalid(axi_dma_1_M_AXI_MM2S_RVALID),
        .S04_AXI_awaddr(axi_dma_1_M_AXI_S2MM_AWADDR),
        .S04_AXI_awburst(axi_dma_1_M_AXI_S2MM_AWBURST),
        .S04_AXI_awcache(axi_dma_1_M_AXI_S2MM_AWCACHE),
        .S04_AXI_awlen(axi_dma_1_M_AXI_S2MM_AWLEN),
        .S04_AXI_awlock(1'b0),
        .S04_AXI_awprot(axi_dma_1_M_AXI_S2MM_AWPROT),
        .S04_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_awready(axi_dma_1_M_AXI_S2MM_AWREADY),
        .S04_AXI_awsize(axi_dma_1_M_AXI_S2MM_AWSIZE),
        .S04_AXI_awvalid(axi_dma_1_M_AXI_S2MM_AWVALID),
        .S04_AXI_bready(axi_dma_1_M_AXI_S2MM_BREADY),
        .S04_AXI_bresp(axi_dma_1_M_AXI_S2MM_BRESP),
        .S04_AXI_bvalid(axi_dma_1_M_AXI_S2MM_BVALID),
        .S04_AXI_wdata(axi_dma_1_M_AXI_S2MM_WDATA),
        .S04_AXI_wlast(axi_dma_1_M_AXI_S2MM_WLAST),
        .S04_AXI_wready(axi_dma_1_M_AXI_S2MM_WREADY),
        .S04_AXI_wstrb(axi_dma_1_M_AXI_S2MM_WSTRB),
        .S04_AXI_wvalid(axi_dma_1_M_AXI_S2MM_WVALID),
        .S05_AXI_araddr(axi_dma_2_M_AXI_MM2S_ARADDR),
        .S05_AXI_arburst(axi_dma_2_M_AXI_MM2S_ARBURST),
        .S05_AXI_arcache(axi_dma_2_M_AXI_MM2S_ARCACHE),
        .S05_AXI_arlen(axi_dma_2_M_AXI_MM2S_ARLEN),
        .S05_AXI_arlock(1'b0),
        .S05_AXI_arprot(axi_dma_2_M_AXI_MM2S_ARPROT),
        .S05_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_arready(axi_dma_2_M_AXI_MM2S_ARREADY),
        .S05_AXI_arsize(axi_dma_2_M_AXI_MM2S_ARSIZE),
        .S05_AXI_arvalid(axi_dma_2_M_AXI_MM2S_ARVALID),
        .S05_AXI_rdata(axi_dma_2_M_AXI_MM2S_RDATA),
        .S05_AXI_rlast(axi_dma_2_M_AXI_MM2S_RLAST),
        .S05_AXI_rready(axi_dma_2_M_AXI_MM2S_RREADY),
        .S05_AXI_rresp(axi_dma_2_M_AXI_MM2S_RRESP),
        .S05_AXI_rvalid(axi_dma_2_M_AXI_MM2S_RVALID),
        .S06_AXI_awaddr(axi_dma_2_M_AXI_S2MM_AWADDR),
        .S06_AXI_awburst(axi_dma_2_M_AXI_S2MM_AWBURST),
        .S06_AXI_awcache(axi_dma_2_M_AXI_S2MM_AWCACHE),
        .S06_AXI_awlen(axi_dma_2_M_AXI_S2MM_AWLEN),
        .S06_AXI_awlock(1'b0),
        .S06_AXI_awprot(axi_dma_2_M_AXI_S2MM_AWPROT),
        .S06_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S06_AXI_awready(axi_dma_2_M_AXI_S2MM_AWREADY),
        .S06_AXI_awsize(axi_dma_2_M_AXI_S2MM_AWSIZE),
        .S06_AXI_awvalid(axi_dma_2_M_AXI_S2MM_AWVALID),
        .S06_AXI_bready(axi_dma_2_M_AXI_S2MM_BREADY),
        .S06_AXI_bresp(axi_dma_2_M_AXI_S2MM_BRESP),
        .S06_AXI_bvalid(axi_dma_2_M_AXI_S2MM_BVALID),
        .S06_AXI_wdata(axi_dma_2_M_AXI_S2MM_WDATA),
        .S06_AXI_wlast(axi_dma_2_M_AXI_S2MM_WLAST),
        .S06_AXI_wready(axi_dma_2_M_AXI_S2MM_WREADY),
        .S06_AXI_wstrb(axi_dma_2_M_AXI_S2MM_WSTRB),
        .S06_AXI_wvalid(axi_dma_2_M_AXI_S2MM_WVALID),
        .S07_AXI_araddr(axi_dma_3_M_AXI_MM2S_ARADDR),
        .S07_AXI_arburst(axi_dma_3_M_AXI_MM2S_ARBURST),
        .S07_AXI_arcache(axi_dma_3_M_AXI_MM2S_ARCACHE),
        .S07_AXI_arlen(axi_dma_3_M_AXI_MM2S_ARLEN),
        .S07_AXI_arlock(1'b0),
        .S07_AXI_arprot(axi_dma_3_M_AXI_MM2S_ARPROT),
        .S07_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S07_AXI_arready(axi_dma_3_M_AXI_MM2S_ARREADY),
        .S07_AXI_arsize(axi_dma_3_M_AXI_MM2S_ARSIZE),
        .S07_AXI_arvalid(axi_dma_3_M_AXI_MM2S_ARVALID),
        .S07_AXI_rdata(axi_dma_3_M_AXI_MM2S_RDATA),
        .S07_AXI_rlast(axi_dma_3_M_AXI_MM2S_RLAST),
        .S07_AXI_rready(axi_dma_3_M_AXI_MM2S_RREADY),
        .S07_AXI_rresp(axi_dma_3_M_AXI_MM2S_RRESP),
        .S07_AXI_rvalid(axi_dma_3_M_AXI_MM2S_RVALID),
        .S08_AXI_awaddr(axi_dma_3_M_AXI_S2MM_AWADDR),
        .S08_AXI_awburst(axi_dma_3_M_AXI_S2MM_AWBURST),
        .S08_AXI_awcache(axi_dma_3_M_AXI_S2MM_AWCACHE),
        .S08_AXI_awlen(axi_dma_3_M_AXI_S2MM_AWLEN),
        .S08_AXI_awlock(1'b0),
        .S08_AXI_awprot(axi_dma_3_M_AXI_S2MM_AWPROT),
        .S08_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S08_AXI_awready(axi_dma_3_M_AXI_S2MM_AWREADY),
        .S08_AXI_awsize(axi_dma_3_M_AXI_S2MM_AWSIZE),
        .S08_AXI_awvalid(axi_dma_3_M_AXI_S2MM_AWVALID),
        .S08_AXI_bready(axi_dma_3_M_AXI_S2MM_BREADY),
        .S08_AXI_bresp(axi_dma_3_M_AXI_S2MM_BRESP),
        .S08_AXI_bvalid(axi_dma_3_M_AXI_S2MM_BVALID),
        .S08_AXI_wdata(axi_dma_3_M_AXI_S2MM_WDATA),
        .S08_AXI_wlast(axi_dma_3_M_AXI_S2MM_WLAST),
        .S08_AXI_wready(axi_dma_3_M_AXI_S2MM_WREADY),
        .S08_AXI_wstrb(axi_dma_3_M_AXI_S2MM_WSTRB),
        .S08_AXI_wvalid(axi_dma_3_M_AXI_S2MM_WVALID),
        .aclk(clk_wiz_0_clk_ctrl_50),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  NFC_4Channel_bd_zynq_ultra_ps_e_0_0 zynq_ultra_ps_e_0
       (.maxigp0_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARADDR),
        .maxigp0_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARBURST),
        .maxigp0_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARCACHE),
        .maxigp0_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARID),
        .maxigp0_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLEN),
        .maxigp0_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARLOCK),
        .maxigp0_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARPROT),
        .maxigp0_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARQOS),
        .maxigp0_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARREADY),
        .maxigp0_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARSIZE),
        .maxigp0_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARUSER),
        .maxigp0_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_ARVALID),
        .maxigp0_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWADDR),
        .maxigp0_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWBURST),
        .maxigp0_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWCACHE),
        .maxigp0_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWID),
        .maxigp0_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLEN),
        .maxigp0_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWLOCK),
        .maxigp0_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWPROT),
        .maxigp0_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWQOS),
        .maxigp0_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWREADY),
        .maxigp0_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWSIZE),
        .maxigp0_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWUSER),
        .maxigp0_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_AWVALID),
        .maxigp0_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BID),
        .maxigp0_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BREADY),
        .maxigp0_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BRESP),
        .maxigp0_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_BVALID),
        .maxigp0_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RDATA),
        .maxigp0_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RID),
        .maxigp0_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RLAST),
        .maxigp0_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RREADY),
        .maxigp0_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RRESP),
        .maxigp0_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_RVALID),
        .maxigp0_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WDATA),
        .maxigp0_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WLAST),
        .maxigp0_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WREADY),
        .maxigp0_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WSTRB),
        .maxigp0_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_FPD_WVALID),
        .maxigp2_araddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARADDR),
        .maxigp2_arburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARBURST),
        .maxigp2_arcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARCACHE),
        .maxigp2_arid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARID),
        .maxigp2_arlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLEN),
        .maxigp2_arlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARLOCK),
        .maxigp2_arprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARPROT),
        .maxigp2_arqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARQOS),
        .maxigp2_arready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARREADY),
        .maxigp2_arsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARSIZE),
        .maxigp2_aruser(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARUSER),
        .maxigp2_arvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_ARVALID),
        .maxigp2_awaddr(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWADDR),
        .maxigp2_awburst(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWBURST),
        .maxigp2_awcache(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWCACHE),
        .maxigp2_awid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWID),
        .maxigp2_awlen(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLEN),
        .maxigp2_awlock(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWLOCK),
        .maxigp2_awprot(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWPROT),
        .maxigp2_awqos(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWQOS),
        .maxigp2_awready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWREADY),
        .maxigp2_awsize(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWSIZE),
        .maxigp2_awuser(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWUSER),
        .maxigp2_awvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_AWVALID),
        .maxigp2_bid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BID),
        .maxigp2_bready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BREADY),
        .maxigp2_bresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BRESP),
        .maxigp2_bvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_BVALID),
        .maxigp2_rdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RDATA),
        .maxigp2_rid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RID),
        .maxigp2_rlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RLAST),
        .maxigp2_rready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RREADY),
        .maxigp2_rresp(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RRESP),
        .maxigp2_rvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_RVALID),
        .maxigp2_wdata(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WDATA),
        .maxigp2_wlast(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WLAST),
        .maxigp2_wready(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WREADY),
        .maxigp2_wstrb(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WSTRB),
        .maxigp2_wvalid(zynq_ultra_ps_e_0_M_AXI_HPM0_LPD_WVALID),
        .maxihpm0_fpd_aclk(clk_wiz_0_clk_ctrl_50),
        .maxihpm0_lpd_aclk(clk_wiz_0_clk_ctrl_50),
        .pl_resetn0(zynq_ultra_ps_e_0_pl_resetn0));
endmodule
