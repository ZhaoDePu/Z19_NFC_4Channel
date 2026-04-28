// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Apr 28 16:49:32 2026
// Host        : DESKTOP-TRF6PNO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ NFC_4Channel_bd_nfc_top_0_0_stub.v
// Design      : NFC_4Channel_bd_nfc_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu19eg-ffvc1760-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "nfc_top,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(nand_clk_fast, nand_clk_slow, nand_usr_clk, 
  nand_clk_locked, s_axil_aclk, s_axil_aresetn, s_axil_awaddr, s_axil_awprot, s_axil_awvalid, 
  s_axil_awready, s_axil_wdata, s_axil_wstrb, s_axil_wvalid, s_axil_wready, s_axil_bresp, 
  s_axil_bvalid, s_axil_bready, s_axil_araddr, s_axil_arprot, s_axil_arvalid, s_axil_arready, 
  s_axil_rdata, s_axil_rresp, s_axil_rvalid, s_axil_rready, s_axis_tvalid_0, s_axis_tready_0, 
  s_axis_tdata_0, s_axis_tlast_0, m_axis_tvalid_0, m_axis_tready_0, m_axis_tdata_0, 
  m_axis_tkeep_0, m_axis_tlast_0, m_axis_tid_0, m_axis_tuser_0, s_axis_tvalid_1, 
  s_axis_tready_1, s_axis_tdata_1, s_axis_tlast_1, m_axis_tvalid_1, m_axis_tready_1, 
  m_axis_tdata_1, m_axis_tkeep_1, m_axis_tlast_1, m_axis_tid_1, m_axis_tuser_1, 
  s_axis_tvalid_2, s_axis_tready_2, s_axis_tdata_2, s_axis_tlast_2, m_axis_tvalid_2, 
  m_axis_tready_2, m_axis_tdata_2, m_axis_tkeep_2, m_axis_tlast_2, m_axis_tid_2, 
  m_axis_tuser_2, s_axis_tvalid_3, s_axis_tready_3, s_axis_tdata_3, s_axis_tlast_3, 
  m_axis_tvalid_3, m_axis_tready_3, m_axis_tdata_3, m_axis_tkeep_3, m_axis_tlast_3, 
  m_axis_tid_3, m_axis_tuser_3, O_NAND_CE_N, I_NAND_RB_N, O_NAND_WE_N, O_NAND_CLE, O_NAND_ALE, 
  O_NAND_WP_N, O_NAND_RE_P, O_NAND_RE_N, IO_NAND_DQS_P, IO_NAND_DQS_N, IO_NAND_DQ)
/* synthesis syn_black_box black_box_pad_pin="nand_clk_fast,nand_clk_slow,nand_usr_clk,nand_clk_locked,s_axil_aclk,s_axil_aresetn,s_axil_awaddr[31:0],s_axil_awprot[2:0],s_axil_awvalid,s_axil_awready,s_axil_wdata[31:0],s_axil_wstrb[3:0],s_axil_wvalid,s_axil_wready,s_axil_bresp[1:0],s_axil_bvalid,s_axil_bready,s_axil_araddr[31:0],s_axil_arprot[2:0],s_axil_arvalid,s_axil_arready,s_axil_rdata[31:0],s_axil_rresp[1:0],s_axil_rvalid,s_axil_rready,s_axis_tvalid_0,s_axis_tready_0,s_axis_tdata_0[31:0],s_axis_tlast_0,m_axis_tvalid_0,m_axis_tready_0,m_axis_tdata_0[31:0],m_axis_tkeep_0[3:0],m_axis_tlast_0,m_axis_tid_0[15:0],m_axis_tuser_0[3:0],s_axis_tvalid_1,s_axis_tready_1,s_axis_tdata_1[31:0],s_axis_tlast_1,m_axis_tvalid_1,m_axis_tready_1,m_axis_tdata_1[31:0],m_axis_tkeep_1[3:0],m_axis_tlast_1,m_axis_tid_1[15:0],m_axis_tuser_1[3:0],s_axis_tvalid_2,s_axis_tready_2,s_axis_tdata_2[31:0],s_axis_tlast_2,m_axis_tvalid_2,m_axis_tready_2,m_axis_tdata_2[31:0],m_axis_tkeep_2[3:0],m_axis_tlast_2,m_axis_tid_2[15:0],m_axis_tuser_2[3:0],s_axis_tvalid_3,s_axis_tready_3,s_axis_tdata_3[31:0],s_axis_tlast_3,m_axis_tvalid_3,m_axis_tready_3,m_axis_tdata_3[31:0],m_axis_tkeep_3[3:0],m_axis_tlast_3,m_axis_tid_3[15:0],m_axis_tuser_3[3:0],O_NAND_CE_N[3:0],I_NAND_RB_N[3:0],O_NAND_WE_N[3:0],O_NAND_CLE[3:0],O_NAND_ALE[3:0],O_NAND_WP_N[3:0],O_NAND_RE_P[3:0],O_NAND_RE_N[3:0],IO_NAND_DQS_P[3:0],IO_NAND_DQS_N[3:0],IO_NAND_DQ[31:0]" */;
  input nand_clk_fast;
  input nand_clk_slow;
  input nand_usr_clk;
  input nand_clk_locked;
  input s_axil_aclk;
  input s_axil_aresetn;
  input [31:0]s_axil_awaddr;
  input [2:0]s_axil_awprot;
  input s_axil_awvalid;
  output s_axil_awready;
  input [31:0]s_axil_wdata;
  input [3:0]s_axil_wstrb;
  input s_axil_wvalid;
  output s_axil_wready;
  output [1:0]s_axil_bresp;
  output s_axil_bvalid;
  input s_axil_bready;
  input [31:0]s_axil_araddr;
  input [2:0]s_axil_arprot;
  input s_axil_arvalid;
  output s_axil_arready;
  output [31:0]s_axil_rdata;
  output [1:0]s_axil_rresp;
  output s_axil_rvalid;
  input s_axil_rready;
  input s_axis_tvalid_0;
  output s_axis_tready_0;
  input [31:0]s_axis_tdata_0;
  input s_axis_tlast_0;
  output m_axis_tvalid_0;
  input m_axis_tready_0;
  output [31:0]m_axis_tdata_0;
  output [3:0]m_axis_tkeep_0;
  output m_axis_tlast_0;
  output [15:0]m_axis_tid_0;
  output [3:0]m_axis_tuser_0;
  input s_axis_tvalid_1;
  output s_axis_tready_1;
  input [31:0]s_axis_tdata_1;
  input s_axis_tlast_1;
  output m_axis_tvalid_1;
  input m_axis_tready_1;
  output [31:0]m_axis_tdata_1;
  output [3:0]m_axis_tkeep_1;
  output m_axis_tlast_1;
  output [15:0]m_axis_tid_1;
  output [3:0]m_axis_tuser_1;
  input s_axis_tvalid_2;
  output s_axis_tready_2;
  input [31:0]s_axis_tdata_2;
  input s_axis_tlast_2;
  output m_axis_tvalid_2;
  input m_axis_tready_2;
  output [31:0]m_axis_tdata_2;
  output [3:0]m_axis_tkeep_2;
  output m_axis_tlast_2;
  output [15:0]m_axis_tid_2;
  output [3:0]m_axis_tuser_2;
  input s_axis_tvalid_3;
  output s_axis_tready_3;
  input [31:0]s_axis_tdata_3;
  input s_axis_tlast_3;
  output m_axis_tvalid_3;
  input m_axis_tready_3;
  output [31:0]m_axis_tdata_3;
  output [3:0]m_axis_tkeep_3;
  output m_axis_tlast_3;
  output [15:0]m_axis_tid_3;
  output [3:0]m_axis_tuser_3;
  output [3:0]O_NAND_CE_N;
  input [3:0]I_NAND_RB_N;
  output [3:0]O_NAND_WE_N;
  output [3:0]O_NAND_CLE;
  output [3:0]O_NAND_ALE;
  output [3:0]O_NAND_WP_N;
  output [3:0]O_NAND_RE_P;
  output [3:0]O_NAND_RE_N;
  inout [3:0]IO_NAND_DQS_P;
  inout [3:0]IO_NAND_DQS_N;
  inout [31:0]IO_NAND_DQ;
endmodule
