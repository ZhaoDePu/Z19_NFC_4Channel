// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:nfc_top:2.0
// IP Revision: 34

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module NFC_4Channel_bd_nfc_top_0_0 (
  nand_clk_fast,
  nand_usr_clk,
  nand_clk_locked,
  s_axil_aclk,
  s_axil_aresetn,
  s_axil_awaddr,
  s_axil_awprot,
  s_axil_awvalid,
  s_axil_awready,
  s_axil_wdata,
  s_axil_wstrb,
  s_axil_wvalid,
  s_axil_wready,
  s_axil_bresp,
  s_axil_bvalid,
  s_axil_bready,
  s_axil_araddr,
  s_axil_arprot,
  s_axil_arvalid,
  s_axil_arready,
  s_axil_rdata,
  s_axil_rresp,
  s_axil_rvalid,
  s_axil_rready,
  s_axis_tvalid_0,
  s_axis_tready_0,
  s_axis_tdata_0,
  s_axis_tlast_0,
  m_axis_tvalid_0,
  m_axis_tready_0,
  m_axis_tdata_0,
  m_axis_tkeep_0,
  m_axis_tlast_0,
  m_axis_tid_0,
  m_axis_tuser_0,
  s_axis_tvalid_1,
  s_axis_tready_1,
  s_axis_tdata_1,
  s_axis_tlast_1,
  m_axis_tvalid_1,
  m_axis_tready_1,
  m_axis_tdata_1,
  m_axis_tkeep_1,
  m_axis_tlast_1,
  m_axis_tid_1,
  m_axis_tuser_1,
  s_axis_tvalid_2,
  s_axis_tready_2,
  s_axis_tdata_2,
  s_axis_tlast_2,
  m_axis_tvalid_2,
  m_axis_tready_2,
  m_axis_tdata_2,
  m_axis_tkeep_2,
  m_axis_tlast_2,
  m_axis_tid_2,
  m_axis_tuser_2,
  s_axis_tvalid_3,
  s_axis_tready_3,
  s_axis_tdata_3,
  s_axis_tlast_3,
  m_axis_tvalid_3,
  m_axis_tready_3,
  m_axis_tdata_3,
  m_axis_tkeep_3,
  m_axis_tlast_3,
  m_axis_tid_3,
  m_axis_tuser_3,
  O_NAND_CE_N,
  I_NAND_RB_N,
  O_NAND_WE_N,
  O_NAND_CLE,
  O_NAND_ALE,
  O_NAND_WP_N,
  O_NAND_RE_P,
  O_NAND_RE_N,
  IO_NAND_DQS_P,
  IO_NAND_DQS_N,
  IO_NAND_DQ
);

input wire nand_clk_fast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME nand_usr_clk, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 nand_usr_clk CLK" *)
input wire nand_usr_clk;
input wire nand_clk_locked;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axil_aclk, ASSOCIATED_BUSIF s_axil, ASSOCIATED_RESET s_axil_aresetn, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axil_aclk CLK" *)
input wire s_axil_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axil_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s_axil_aresetn RST" *)
input wire s_axil_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil AWADDR" *)
input wire [31 : 0] s_axil_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil AWPROT" *)
input wire [2 : 0] s_axil_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil AWVALID" *)
input wire s_axil_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil AWREADY" *)
output wire s_axil_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil WDATA" *)
input wire [31 : 0] s_axil_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil WSTRB" *)
input wire [3 : 0] s_axil_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil WVALID" *)
input wire s_axil_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil WREADY" *)
output wire s_axil_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil BRESP" *)
output wire [1 : 0] s_axil_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil BVALID" *)
output wire s_axil_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil BREADY" *)
input wire s_axil_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil ARADDR" *)
input wire [31 : 0] s_axil_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil ARPROT" *)
input wire [2 : 0] s_axil_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil ARVALID" *)
input wire s_axil_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil ARREADY" *)
output wire s_axil_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil RDATA" *)
output wire [31 : 0] s_axil_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil RRESP" *)
output wire [1 : 0] s_axil_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil RVALID" *)
output wire s_axil_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axil, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN NFC_4Channel_bd_clk_wiz_0_0_nand_clk_fast, NUM_READ_THREADS \
1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axil RREADY" *)
input wire s_axil_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TVALID" *)
input wire s_axis_tvalid_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TREADY" *)
output wire s_axis_tready_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TDATA" *)
input wire [31 : 0] s_axis_tdata_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_0 TLAST" *)
input wire s_axis_tlast_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *)
output wire m_axis_tvalid_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *)
input wire m_axis_tready_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *)
output wire [31 : 0] m_axis_tdata_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TKEEP" *)
output wire [3 : 0] m_axis_tkeep_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TLAST" *)
output wire m_axis_tlast_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TID" *)
output wire [15 : 0] m_axis_tid_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 16, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TUSER" *)
output wire [3 : 0] m_axis_tuser_0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TVALID" *)
input wire s_axis_tvalid_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TREADY" *)
output wire s_axis_tready_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TDATA" *)
input wire [31 : 0] s_axis_tdata_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_1 TLAST" *)
input wire s_axis_tlast_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TVALID" *)
output wire m_axis_tvalid_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TREADY" *)
input wire m_axis_tready_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TDATA" *)
output wire [31 : 0] m_axis_tdata_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TKEEP" *)
output wire [3 : 0] m_axis_tkeep_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TLAST" *)
output wire m_axis_tlast_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TID" *)
output wire [15 : 0] m_axis_tid_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_1, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 16, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TUSER" *)
output wire [3 : 0] m_axis_tuser_1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TVALID" *)
input wire s_axis_tvalid_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TREADY" *)
output wire s_axis_tready_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TDATA" *)
input wire [31 : 0] s_axis_tdata_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_2 TLAST" *)
input wire s_axis_tlast_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TVALID" *)
output wire m_axis_tvalid_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TREADY" *)
input wire m_axis_tready_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TDATA" *)
output wire [31 : 0] m_axis_tdata_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TKEEP" *)
output wire [3 : 0] m_axis_tkeep_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TLAST" *)
output wire m_axis_tlast_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TID" *)
output wire [15 : 0] m_axis_tid_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 16, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TUSER" *)
output wire [3 : 0] m_axis_tuser_2;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TVALID" *)
input wire s_axis_tvalid_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TREADY" *)
output wire s_axis_tready_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TDATA" *)
input wire [31 : 0] s_axis_tdata_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_3, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_3 TLAST" *)
input wire s_axis_tlast_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TVALID" *)
output wire m_axis_tvalid_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TREADY" *)
input wire m_axis_tready_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TDATA" *)
output wire [31 : 0] m_axis_tdata_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TKEEP" *)
output wire [3 : 0] m_axis_tkeep_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TLAST" *)
output wire m_axis_tlast_3;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TID" *)
output wire [15 : 0] m_axis_tid_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_3, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 16, TUSER_WIDTH 4, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 50000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TUSER" *)
output wire [3 : 0] m_axis_tuser_3;
output wire [3 : 0] O_NAND_CE_N;
input wire [3 : 0] I_NAND_RB_N;
output wire [3 : 0] O_NAND_WE_N;
output wire [3 : 0] O_NAND_CLE;
output wire [3 : 0] O_NAND_ALE;
output wire [3 : 0] O_NAND_WP_N;
output wire [3 : 0] O_NAND_RE_P;
output wire [3 : 0] O_NAND_RE_N;
inout wire [3 : 0] IO_NAND_DQS_P;
inout wire [3 : 0] IO_NAND_DQS_N;
inout wire [31 : 0] IO_NAND_DQ;

  nfc_top #(
    .DATA_WIDTH(32),
    .CHAN_NUM(4)
  ) inst (
    .nand_clk_fast(nand_clk_fast),
    .nand_usr_clk(nand_usr_clk),
    .nand_clk_locked(nand_clk_locked),
    .s_axil_aclk(s_axil_aclk),
    .s_axil_aresetn(s_axil_aresetn),
    .s_axil_awaddr(s_axil_awaddr),
    .s_axil_awprot(s_axil_awprot),
    .s_axil_awvalid(s_axil_awvalid),
    .s_axil_awready(s_axil_awready),
    .s_axil_wdata(s_axil_wdata),
    .s_axil_wstrb(s_axil_wstrb),
    .s_axil_wvalid(s_axil_wvalid),
    .s_axil_wready(s_axil_wready),
    .s_axil_bresp(s_axil_bresp),
    .s_axil_bvalid(s_axil_bvalid),
    .s_axil_bready(s_axil_bready),
    .s_axil_araddr(s_axil_araddr),
    .s_axil_arprot(s_axil_arprot),
    .s_axil_arvalid(s_axil_arvalid),
    .s_axil_arready(s_axil_arready),
    .s_axil_rdata(s_axil_rdata),
    .s_axil_rresp(s_axil_rresp),
    .s_axil_rvalid(s_axil_rvalid),
    .s_axil_rready(s_axil_rready),
    .s_axis_tvalid_0(s_axis_tvalid_0),
    .s_axis_tready_0(s_axis_tready_0),
    .s_axis_tdata_0(s_axis_tdata_0),
    .s_axis_tlast_0(s_axis_tlast_0),
    .m_axis_tvalid_0(m_axis_tvalid_0),
    .m_axis_tready_0(m_axis_tready_0),
    .m_axis_tdata_0(m_axis_tdata_0),
    .m_axis_tkeep_0(m_axis_tkeep_0),
    .m_axis_tlast_0(m_axis_tlast_0),
    .m_axis_tid_0(m_axis_tid_0),
    .m_axis_tuser_0(m_axis_tuser_0),
    .s_axis_tvalid_1(s_axis_tvalid_1),
    .s_axis_tready_1(s_axis_tready_1),
    .s_axis_tdata_1(s_axis_tdata_1),
    .s_axis_tlast_1(s_axis_tlast_1),
    .m_axis_tvalid_1(m_axis_tvalid_1),
    .m_axis_tready_1(m_axis_tready_1),
    .m_axis_tdata_1(m_axis_tdata_1),
    .m_axis_tkeep_1(m_axis_tkeep_1),
    .m_axis_tlast_1(m_axis_tlast_1),
    .m_axis_tid_1(m_axis_tid_1),
    .m_axis_tuser_1(m_axis_tuser_1),
    .s_axis_tvalid_2(s_axis_tvalid_2),
    .s_axis_tready_2(s_axis_tready_2),
    .s_axis_tdata_2(s_axis_tdata_2),
    .s_axis_tlast_2(s_axis_tlast_2),
    .m_axis_tvalid_2(m_axis_tvalid_2),
    .m_axis_tready_2(m_axis_tready_2),
    .m_axis_tdata_2(m_axis_tdata_2),
    .m_axis_tkeep_2(m_axis_tkeep_2),
    .m_axis_tlast_2(m_axis_tlast_2),
    .m_axis_tid_2(m_axis_tid_2),
    .m_axis_tuser_2(m_axis_tuser_2),
    .s_axis_tvalid_3(s_axis_tvalid_3),
    .s_axis_tready_3(s_axis_tready_3),
    .s_axis_tdata_3(s_axis_tdata_3),
    .s_axis_tlast_3(s_axis_tlast_3),
    .m_axis_tvalid_3(m_axis_tvalid_3),
    .m_axis_tready_3(m_axis_tready_3),
    .m_axis_tdata_3(m_axis_tdata_3),
    .m_axis_tkeep_3(m_axis_tkeep_3),
    .m_axis_tlast_3(m_axis_tlast_3),
    .m_axis_tid_3(m_axis_tid_3),
    .m_axis_tuser_3(m_axis_tuser_3),
    .O_NAND_CE_N(O_NAND_CE_N),
    .I_NAND_RB_N(I_NAND_RB_N),
    .O_NAND_WE_N(O_NAND_WE_N),
    .O_NAND_CLE(O_NAND_CLE),
    .O_NAND_ALE(O_NAND_ALE),
    .O_NAND_WP_N(O_NAND_WP_N),
    .O_NAND_RE_P(O_NAND_RE_P),
    .O_NAND_RE_N(O_NAND_RE_N),
    .IO_NAND_DQS_P(IO_NAND_DQS_P),
    .IO_NAND_DQS_N(IO_NAND_DQS_N),
    .IO_NAND_DQ(IO_NAND_DQ)
  );
endmodule
