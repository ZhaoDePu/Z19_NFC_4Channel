`timescale 1ns / 1ps
/**
* OCOWFC: Open-Channel Open-Way Flash Controller
* Copyright (C) 2021 ustc_fy
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*/

//////////////////////////////////////////////////////////////////////////////////
// Module Name: nfc_top
// Description: 4-Channel NFC Top Module (host-controlled mode)
//              - One AXI4-Lite slave for command control + response readback
//              - Four independent AXI-Stream pairs (one per NAND channel)
//              - Four independent NAND physical interfaces
//              - CHAN_EN[3:0] register at 0x100 gates per-channel cmd_valid
//
// NAND physical pin assignment:
//   CE_N / RB_N / WE_N / CLE / ALE / WP_N / RE_P / RE_N :
//       [3:0] — bit i belongs to channel i
//   IO_NAND_DQS_P / DQS_N :
//       [3:0] — bit i belongs to channel i
//   IO_NAND_DQ :
//       [31:0] — bits [8*i+7 : 8*i] belong to channel i
//
// Register map: see axil_regfile.v header
//////////////////////////////////////////////////////////////////////////////////

module nfc_top #(
    parameter DATA_WIDTH = 32,
    parameter CHAN_NUM   = 4
)(
    // NAND Clock Inputs (from external Clocking Wizard in BD)
    input        nand_clk_fast,      // 400 MHz, SERDES reference
    input        nand_clk_slow,      // 100 MHz, SERDES parallel clock from MMCM
    input        nand_usr_clk,       //  50 MHz, NAND execution logic
    input        nand_clk_locked,    // MMCM locked from Clocking Wizard

    // AXI-Lite Clock and Reset
    input                             s_axil_aclk,
    input                             s_axil_aresetn,

    // AXI-Lite Write Address Channel
    input  [31:0]                     s_axil_awaddr,
    input  [2:0]                      s_axil_awprot,
    input                             s_axil_awvalid,
    output                            s_axil_awready,

    // AXI-Lite Write Data Channel
    input  [31:0]                     s_axil_wdata,
    input  [3:0]                      s_axil_wstrb,
    input                             s_axil_wvalid,
    output                            s_axil_wready,

    // AXI-Lite Write Response Channel
    output [1:0]                      s_axil_bresp,
    output                            s_axil_bvalid,
    input                             s_axil_bready,

    // AXI-Lite Read Address Channel
    input  [31:0]                     s_axil_araddr,
    input  [2:0]                      s_axil_arprot,
    input                             s_axil_arvalid,
    output                            s_axil_arready,

    // AXI-Lite Read Data Channel
    output [31:0]                     s_axil_rdata,
    output [1:0]                      s_axil_rresp,
    output                            s_axil_rvalid,
    input                             s_axil_rready,

    // ---- AXI-Stream Channel 0 ----
    // Write (PS DMA → NAND)
    input                             s_axis_tvalid_0,
    output                            s_axis_tready_0,
    input  [DATA_WIDTH-1:0]           s_axis_tdata_0,
    input                             s_axis_tlast_0,
    // Read (NAND → PS DMA)
    output                            m_axis_tvalid_0,
    input                             m_axis_tready_0,
    output [DATA_WIDTH-1:0]           m_axis_tdata_0,
    output [DATA_WIDTH/8-1:0]         m_axis_tkeep_0,
    output                            m_axis_tlast_0,
    output [15:0]                     m_axis_tid_0,
    output [3:0]                      m_axis_tuser_0,

    // ---- AXI-Stream Channel 1 ----
    input                             s_axis_tvalid_1,
    output                            s_axis_tready_1,
    input  [DATA_WIDTH-1:0]           s_axis_tdata_1,
    input                             s_axis_tlast_1,
    output                            m_axis_tvalid_1,
    input                             m_axis_tready_1,
    output [DATA_WIDTH-1:0]           m_axis_tdata_1,
    output [DATA_WIDTH/8-1:0]         m_axis_tkeep_1,
    output                            m_axis_tlast_1,
    output [15:0]                     m_axis_tid_1,
    output [3:0]                      m_axis_tuser_1,

    // ---- AXI-Stream Channel 2 ----
    input                             s_axis_tvalid_2,
    output                            s_axis_tready_2,
    input  [DATA_WIDTH-1:0]           s_axis_tdata_2,
    input                             s_axis_tlast_2,
    output                            m_axis_tvalid_2,
    input                             m_axis_tready_2,
    output [DATA_WIDTH-1:0]           m_axis_tdata_2,
    output [DATA_WIDTH/8-1:0]         m_axis_tkeep_2,
    output                            m_axis_tlast_2,
    output [15:0]                     m_axis_tid_2,
    output [3:0]                      m_axis_tuser_2,

    // ---- AXI-Stream Channel 3 ----
    input                             s_axis_tvalid_3,
    output                            s_axis_tready_3,
    input  [DATA_WIDTH-1:0]           s_axis_tdata_3,
    input                             s_axis_tlast_3,
    output                            m_axis_tvalid_3,
    input                             m_axis_tready_3,
    output [DATA_WIDTH-1:0]           m_axis_tdata_3,
    output [DATA_WIDTH/8-1:0]         m_axis_tkeep_3,
    output                            m_axis_tlast_3,
    output [15:0]                     m_axis_tid_3,
    output [3:0]                      m_axis_tuser_3,

    // ---- NAND Physical Interfaces (4 channels) ----
    output [3:0]                      O_NAND_CE_N,
    input  [3:0]                      I_NAND_RB_N,
    output [3:0]                      O_NAND_WE_N,
    output [3:0]                      O_NAND_CLE,
    output [3:0]                      O_NAND_ALE,
    output [3:0]                      O_NAND_WP_N,
    output [3:0]                      O_NAND_RE_P,
    output [3:0]                      O_NAND_RE_N,
    inout  [3:0]                      IO_NAND_DQS_P,
    inout  [3:0]                      IO_NAND_DQS_N,
    inout  [31:0]                     IO_NAND_DQ    // [8*i+7:8*i] = channel i
);

//------------------------------------------------------------
// Clocks / resets
//------------------------------------------------------------
wire nand_clk_rst  = ~nand_clk_locked;
wire nand_usr_rstn =  nand_clk_locked;

//------------------------------------------------------------
// Regfile → Channel command wires
//------------------------------------------------------------
wire [15:0] nfc_cmd_opc_0, nfc_cmd_opc_1, nfc_cmd_opc_2, nfc_cmd_opc_3;
wire        nfc_cmd_valid_0, nfc_cmd_valid_1, nfc_cmd_valid_2, nfc_cmd_valid_3;
wire [63:0] nfc_lba_0, nfc_lba_1, nfc_lba_2, nfc_lba_3;
wire [31:0] nfc_len_0, nfc_len_1, nfc_len_2, nfc_len_3;
wire        res_ack_0, res_ack_1, res_ack_2, res_ack_3;
wire [3:0]  chan_en;

// Channel → Regfile status wires
wire        ch_req_ready_0, ch_req_ready_1, ch_req_ready_2, ch_req_ready_3;
wire        ch_res_valid_0, ch_res_valid_1, ch_res_valid_2, ch_res_valid_3;
wire [79:0] ch_res_data_0,  ch_res_data_1,  ch_res_data_2,  ch_res_data_3;
wire        ch_done_0,      ch_done_1,      ch_done_2,      ch_done_3;

// CHAN_EN gates cmd_valid before it reaches each nfc_channel
wire nfc_cmd_valid_0_g = nfc_cmd_valid_0 & chan_en[0];
wire nfc_cmd_valid_1_g = nfc_cmd_valid_1 & chan_en[1];
wire nfc_cmd_valid_2_g = nfc_cmd_valid_2 & chan_en[2];
wire nfc_cmd_valid_3_g = nfc_cmd_valid_3 & chan_en[3];

// Internal: s_data_avail (unused externally, kept for fcc interface completeness)
wire [23:0] s_data_avail_0, s_data_avail_1, s_data_avail_2, s_data_avail_3;


//============================================================
// AXI-Lite Register File
//============================================================
axil_regfile #(
    .AXIL_ADDR_WIDTH (16),
    .AXIL_DATA_WIDTH (32),
    .CHAN_NUM         (4)
) axil_regfile_inst (
    .s_axi_aclk      (s_axil_aclk         ),
    .s_axi_aresetn   (s_axil_aresetn      ),
    .s_axi_awaddr    (s_axil_awaddr[15:0] ),
    .s_axi_awprot    (s_axil_awprot       ),
    .s_axi_awvalid   (s_axil_awvalid      ),
    .s_axi_awready   (s_axil_awready      ),
    .s_axi_wdata     (s_axil_wdata        ),
    .s_axi_wstrb     (s_axil_wstrb        ),
    .s_axi_wvalid    (s_axil_wvalid       ),
    .s_axi_wready    (s_axil_wready       ),
    .s_axi_bresp     (s_axil_bresp        ),
    .s_axi_bvalid    (s_axil_bvalid       ),
    .s_axi_bready    (s_axil_bready       ),
    .s_axi_araddr    (s_axil_araddr[15:0] ),
    .s_axi_arprot    (s_axil_arprot       ),
    .s_axi_arvalid   (s_axil_arvalid      ),
    .s_axi_arready   (s_axil_arready      ),
    .s_axi_rdata     (s_axil_rdata        ),
    .s_axi_rresp     (s_axil_rresp        ),
    .s_axi_rvalid    (s_axil_rvalid       ),
    .s_axi_rready    (s_axil_rready       ),
    // Command outputs
    .nfc_cmd_opc_0   (nfc_cmd_opc_0       ),
    .nfc_cmd_valid_0 (nfc_cmd_valid_0     ),
    .nfc_lba_0       (nfc_lba_0           ),
    .nfc_len_0       (nfc_len_0           ),
    .o_res_ack_0     (res_ack_0           ),
    .nfc_cmd_opc_1   (nfc_cmd_opc_1       ),
    .nfc_cmd_valid_1 (nfc_cmd_valid_1     ),
    .nfc_lba_1       (nfc_lba_1           ),
    .nfc_len_1       (nfc_len_1           ),
    .o_res_ack_1     (res_ack_1           ),
    .nfc_cmd_opc_2   (nfc_cmd_opc_2       ),
    .nfc_cmd_valid_2 (nfc_cmd_valid_2     ),
    .nfc_lba_2       (nfc_lba_2           ),
    .nfc_len_2       (nfc_len_2           ),
    .o_res_ack_2     (res_ack_2           ),
    .nfc_cmd_opc_3   (nfc_cmd_opc_3       ),
    .nfc_cmd_valid_3 (nfc_cmd_valid_3     ),
    .nfc_lba_3       (nfc_lba_3           ),
    .nfc_len_3       (nfc_len_3           ),
    .o_res_ack_3     (res_ack_3           ),
    .o_chan_en       (chan_en             ),
    // Status inputs
    .i_req_ready_0   (ch_req_ready_0      ),
    .i_res_valid_0   (ch_res_valid_0      ),
    .i_done_0        (ch_done_0           ),
    .i_res_data_0    (ch_res_data_0       ),
    .i_req_ready_1   (ch_req_ready_1      ),
    .i_res_valid_1   (ch_res_valid_1      ),
    .i_done_1        (ch_done_1           ),
    .i_res_data_1    (ch_res_data_1       ),
    .i_req_ready_2   (ch_req_ready_2      ),
    .i_res_valid_2   (ch_res_valid_2      ),
    .i_done_2        (ch_done_2           ),
    .i_res_data_2    (ch_res_data_2       ),
    .i_req_ready_3   (ch_req_ready_3      ),
    .i_res_valid_3   (ch_res_valid_3      ),
    .i_done_3        (ch_done_3           ),
    .i_res_data_3    (ch_res_data_3       )
);


//============================================================
// NFC Channel 0
//============================================================
nfc_channel #(
    .DATA_WIDTH (DATA_WIDTH),
    .PATCH      ("FALSE"   )
) nfc_channel_inst_0 (
    .user_clk      (s_axil_aclk        ),
    .user_resetn   (s_axil_aresetn     ),
    .nand_clk_fast (nand_clk_fast      ),
    .nand_clk_slow(nand_clk_slow      ),
    .nand_clk_rst (nand_clk_rst       ),
    .nand_usr_rstn (nand_usr_rstn      ),
    .nand_usr_clk  (nand_usr_clk       ),
    .i_cmd_opc     (nfc_cmd_opc_0      ),
    .i_cmd_valid   (nfc_cmd_valid_0_g  ),
    .i_lba         (nfc_lba_0[47:0]    ),
    .i_len         (nfc_len_0[23:0]    ),
    .o_req_ready   (ch_req_ready_0     ),
    .o_res_valid   (ch_res_valid_0     ),
    .o_res_data    (ch_res_data_0      ),
    .o_done        (ch_done_0          ),
    .i_res_ack     (res_ack_0          ),
    .s_axis_tvalid (s_axis_tvalid_0    ),
    .s_axis_tready (s_axis_tready_0    ),
    .s_axis_tdata  (s_axis_tdata_0     ),
    .s_axis_tlast  (s_axis_tlast_0     ),
    .s_data_avail  (s_data_avail_0     ),
    .m_axis_tvalid (m_axis_tvalid_0    ),
    .m_axis_tready (m_axis_tready_0    ),
    .m_axis_tdata  (m_axis_tdata_0     ),
    .m_axis_tkeep  (m_axis_tkeep_0     ),
    .m_axis_tlast  (m_axis_tlast_0     ),
    .m_axis_tid    (m_axis_tid_0       ),
    .m_axis_tuser  (m_axis_tuser_0     ),
    .O_NAND_CE_N   (O_NAND_CE_N[0]    ),
    .I_NAND_RB_N   (I_NAND_RB_N[0]    ),
    .O_NAND_WE_N   (O_NAND_WE_N[0]    ),
    .O_NAND_CLE    (O_NAND_CLE[0]     ),
    .O_NAND_ALE    (O_NAND_ALE[0]     ),
    .O_NAND_WP_N   (O_NAND_WP_N[0]   ),
    .O_NAND_RE_P   (O_NAND_RE_P[0]   ),
    .O_NAND_RE_N   (O_NAND_RE_N[0]   ),
    .IO_NAND_DQS_P (IO_NAND_DQS_P[0] ),
    .IO_NAND_DQS_N (IO_NAND_DQS_N[0] ),
    .IO_NAND_DQ    (IO_NAND_DQ[7:0]  )
);


//============================================================
// NFC Channel 1
//============================================================
nfc_channel #(
    .DATA_WIDTH (DATA_WIDTH),
    .PATCH      ("FALSE"   )
) nfc_channel_inst_1 (
    .user_clk      (s_axil_aclk        ),
    .user_resetn   (s_axil_aresetn     ),
    .nand_clk_fast (nand_clk_fast      ),
    .nand_clk_slow(nand_clk_slow      ),
    .nand_clk_rst (nand_clk_rst       ),
    .nand_usr_rstn (nand_usr_rstn      ),
    .nand_usr_clk  (nand_usr_clk       ),
    .i_cmd_opc     (nfc_cmd_opc_1      ),
    .i_cmd_valid   (nfc_cmd_valid_1_g  ),
    .i_lba         (nfc_lba_1[47:0]    ),
    .i_len         (nfc_len_1[23:0]    ),
    .o_req_ready   (ch_req_ready_1     ),
    .o_res_valid   (ch_res_valid_1     ),
    .o_res_data    (ch_res_data_1      ),
    .o_done        (ch_done_1          ),
    .i_res_ack     (res_ack_1          ),
    .s_axis_tvalid (s_axis_tvalid_1    ),
    .s_axis_tready (s_axis_tready_1    ),
    .s_axis_tdata  (s_axis_tdata_1     ),
    .s_axis_tlast  (s_axis_tlast_1     ),
    .s_data_avail  (s_data_avail_1     ),
    .m_axis_tvalid (m_axis_tvalid_1    ),
    .m_axis_tready (m_axis_tready_1    ),
    .m_axis_tdata  (m_axis_tdata_1     ),
    .m_axis_tkeep  (m_axis_tkeep_1     ),
    .m_axis_tlast  (m_axis_tlast_1     ),
    .m_axis_tid    (m_axis_tid_1       ),
    .m_axis_tuser  (m_axis_tuser_1     ),
    .O_NAND_CE_N   (O_NAND_CE_N[1]    ),
    .I_NAND_RB_N   (I_NAND_RB_N[1]    ),
    .O_NAND_WE_N   (O_NAND_WE_N[1]    ),
    .O_NAND_CLE    (O_NAND_CLE[1]     ),
    .O_NAND_ALE    (O_NAND_ALE[1]     ),
    .O_NAND_WP_N   (O_NAND_WP_N[1]   ),
    .O_NAND_RE_P   (O_NAND_RE_P[1]   ),
    .O_NAND_RE_N   (O_NAND_RE_N[1]   ),
    .IO_NAND_DQS_P (IO_NAND_DQS_P[1] ),
    .IO_NAND_DQS_N (IO_NAND_DQS_N[1] ),
    .IO_NAND_DQ    (IO_NAND_DQ[15:8] )
);


//============================================================
// NFC Channel 2
//============================================================
nfc_channel #(
    .DATA_WIDTH (DATA_WIDTH),
    .PATCH      ("FALSE"   )
) nfc_channel_inst_2 (
    .user_clk      (s_axil_aclk        ),
    .user_resetn   (s_axil_aresetn     ),
    .nand_clk_fast (nand_clk_fast      ),
    .nand_clk_slow(nand_clk_slow      ),
    .nand_clk_rst (nand_clk_rst       ),
    .nand_usr_rstn (nand_usr_rstn      ),
    .nand_usr_clk  (nand_usr_clk       ),
    .i_cmd_opc     (nfc_cmd_opc_2      ),
    .i_cmd_valid   (nfc_cmd_valid_2_g  ),
    .i_lba         (nfc_lba_2[47:0]    ),
    .i_len         (nfc_len_2[23:0]    ),
    .o_req_ready   (ch_req_ready_2     ),
    .o_res_valid   (ch_res_valid_2     ),
    .o_res_data    (ch_res_data_2      ),
    .o_done        (ch_done_2          ),
    .i_res_ack     (res_ack_2          ),
    .s_axis_tvalid (s_axis_tvalid_2    ),
    .s_axis_tready (s_axis_tready_2    ),
    .s_axis_tdata  (s_axis_tdata_2     ),
    .s_axis_tlast  (s_axis_tlast_2     ),
    .s_data_avail  (s_data_avail_2     ),
    .m_axis_tvalid (m_axis_tvalid_2    ),
    .m_axis_tready (m_axis_tready_2    ),
    .m_axis_tdata  (m_axis_tdata_2     ),
    .m_axis_tkeep  (m_axis_tkeep_2     ),
    .m_axis_tlast  (m_axis_tlast_2     ),
    .m_axis_tid    (m_axis_tid_2       ),
    .m_axis_tuser  (m_axis_tuser_2     ),
    .O_NAND_CE_N   (O_NAND_CE_N[2]    ),
    .I_NAND_RB_N   (I_NAND_RB_N[2]    ),
    .O_NAND_WE_N   (O_NAND_WE_N[2]    ),
    .O_NAND_CLE    (O_NAND_CLE[2]     ),
    .O_NAND_ALE    (O_NAND_ALE[2]     ),
    .O_NAND_WP_N   (O_NAND_WP_N[2]   ),
    .O_NAND_RE_P   (O_NAND_RE_P[2]   ),
    .O_NAND_RE_N   (O_NAND_RE_N[2]   ),
    .IO_NAND_DQS_P (IO_NAND_DQS_P[2] ),
    .IO_NAND_DQS_N (IO_NAND_DQS_N[2] ),
    .IO_NAND_DQ    (IO_NAND_DQ[23:16])
);


//============================================================
// NFC Channel 3
//============================================================
nfc_channel #(
    .DATA_WIDTH (DATA_WIDTH),
    .PATCH      ("TRUE"    )   // DQS3 pinmap swap on FMC
) nfc_channel_inst_3 (
    .user_clk      (s_axil_aclk        ),
    .user_resetn   (s_axil_aresetn     ),
    .nand_clk_fast (nand_clk_fast      ),
    .nand_clk_slow(nand_clk_slow      ),
    .nand_clk_rst (nand_clk_rst       ),
    .nand_usr_rstn (nand_usr_rstn      ),
    .nand_usr_clk  (nand_usr_clk       ),
    .i_cmd_opc     (nfc_cmd_opc_3      ),
    .i_cmd_valid   (nfc_cmd_valid_3_g  ),
    .i_lba         (nfc_lba_3[47:0]    ),
    .i_len         (nfc_len_3[23:0]    ),
    .o_req_ready   (ch_req_ready_3     ),
    .o_res_valid   (ch_res_valid_3     ),
    .o_res_data    (ch_res_data_3      ),
    .o_done        (ch_done_3          ),
    .i_res_ack     (res_ack_3          ),
    .s_axis_tvalid (s_axis_tvalid_3    ),
    .s_axis_tready (s_axis_tready_3    ),
    .s_axis_tdata  (s_axis_tdata_3     ),
    .s_axis_tlast  (s_axis_tlast_3     ),
    .s_data_avail  (s_data_avail_3     ),
    .m_axis_tvalid (m_axis_tvalid_3    ),
    .m_axis_tready (m_axis_tready_3    ),
    .m_axis_tdata  (m_axis_tdata_3     ),
    .m_axis_tkeep  (m_axis_tkeep_3     ),
    .m_axis_tlast  (m_axis_tlast_3     ),
    .m_axis_tid    (m_axis_tid_3       ),
    .m_axis_tuser  (m_axis_tuser_3     ),
    .O_NAND_CE_N   (O_NAND_CE_N[3]    ),
    .I_NAND_RB_N   (I_NAND_RB_N[3]    ),
    .O_NAND_WE_N   (O_NAND_WE_N[3]    ),
    .O_NAND_CLE    (O_NAND_CLE[3]     ),
    .O_NAND_ALE    (O_NAND_ALE[3]     ),
    .O_NAND_WP_N   (O_NAND_WP_N[3]   ),
    .O_NAND_RE_P   (O_NAND_RE_P[3]   ),
    .O_NAND_RE_N   (O_NAND_RE_N[3]   ),
    .IO_NAND_DQS_P (IO_NAND_DQS_P[3] ),
    .IO_NAND_DQS_N (IO_NAND_DQS_N[3] ),
    .IO_NAND_DQ    (IO_NAND_DQ[31:24])
);

endmodule
