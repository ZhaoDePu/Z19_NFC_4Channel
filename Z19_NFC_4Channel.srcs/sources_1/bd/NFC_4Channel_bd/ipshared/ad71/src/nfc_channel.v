`timescale 1ns / 1ps
/**
* OCOWFC: Open-Channel Open-Way Flash Controller
* Copyright (C) 2021 ustc_fy
* Contributed by ustc_fy
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

//////////////////////////////////////////////////////////////////////////////////
// Company:  ustc_fy
// Engineer: ustc_fy
//
// Create Date: 09/08/2020 03:19:53 PM
// Design Name:
// Module Name: nfc_channel_1
// Project Name:
// Target Devices:
// Tool Versions:
// Description: Single-way NFC channel module (host-controlled mode)
//              - req_gen assembles 256-bit request from AXI-Lite parameters
//              - AXI-Stream interfaces for program/read data (external connection)
//              - Response latch with ACK handshake
//              - CDC synchronizers for cross-clock-domain signals
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Simplified to 1-way version for fcc_top_1way
// Revision 0.03 - Rewritten: removed nfc_test/req_batch/res_check,
//                 added AXI-Stream passthrough + response latch + CDC
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module nfc_channel#(
    parameter DATA_WIDTH = 32,
    parameter PATCH      = "FALSE"
)(
    // Host Clock Domain (sys_clk, e.g. 100MHz)
    input                         user_clk,
    input                         user_resetn,

    // NAND Flash Clock Domain
    input                         nand_clk_fast,
    input                         nand_clk_rst,
    input                         nand_usr_rstn,
    input                         nand_usr_clk,

    // Command Control (from regfile, s_axil_aclk domain — CDC handled here)
    input  [15:0]                 i_cmd_opc,      // NAND opcode (quasi-static)
    input                         i_cmd_valid,    // command trigger pulse (needs CDC)
    input  [47:0]                 i_lba,          // NAND address (quasi-static)
    input  [23:0]                 i_len,          // data length in bytes (quasi-static)

    // Status (to regfile, cross-clock-domain — regfile syncs these)
    (* mark_debug = "true" *) output                        o_req_ready,    // req_gen ready for new command
    output                        o_res_valid,    // response available
    output [79:0]                 o_res_data,     // response data + CID
    output                        o_done,         // done status

    // Response Acknowledge (from regfile, s_axil_aclk domain — CDC handled here)
    input                         i_res_ack,      // response ACK pulse (needs CDC)

    // Write Data AXI-Stream Slave (external → NAND, user_clk domain)
    (* mark_debug = "true" *) input                         s_axis_tvalid,
    (* mark_debug = "true" *) output                        s_axis_tready,
    (* mark_debug = "true" *) input  [DATA_WIDTH-1:0]       s_axis_tdata,
    (* mark_debug = "true" *) input                         s_axis_tlast,
    output [23:0]                 s_data_avail,

    // Read Data AXI-Stream Master (NAND → external, user_clk domain)
    (* mark_debug = "true" *) output                        m_axis_tvalid,
    (* mark_debug = "true" *) input                         m_axis_tready,
    (* mark_debug = "true" *) output [DATA_WIDTH-1:0]       m_axis_tdata,
    output [DATA_WIDTH/8-1:0]     m_axis_tkeep,
    (* mark_debug = "true" *) output                        m_axis_tlast,
    output [15:0]                 m_axis_tid,
    output [3:0]                  m_axis_tuser,

    // NAND Flash Physical Interfaces
    output                        O_NAND_CE_N,
    input                         I_NAND_RB_N,
    output                        O_NAND_WE_N,
    output                        O_NAND_CLE,
    output                        O_NAND_ALE,
    output                        O_NAND_WP_N,
    output                        O_NAND_RE_P,
    output                        O_NAND_RE_N,
    inout                         IO_NAND_DQS_P,
    inout                         IO_NAND_DQS_N,
    inout                [7:0]    IO_NAND_DQ
);


// ============================================================================
// CDC: cmd_valid (s_axil_aclk → user_clk) — 2-FF synchronizer + edge detect
// ============================================================================
reg cmd_valid_sync1, cmd_valid_sync2, cmd_valid_sync3;

always @(posedge user_clk or negedge user_resetn) begin
    if (!user_resetn)
        {cmd_valid_sync3, cmd_valid_sync2, cmd_valid_sync1} <= 3'b0;
    else
        {cmd_valid_sync3, cmd_valid_sync2, cmd_valid_sync1} <= {cmd_valid_sync2, cmd_valid_sync1, i_cmd_valid};
end

(* mark_debug = "true" *) wire cmd_valid_pulse = cmd_valid_sync2 & ~cmd_valid_sync3;


// ============================================================================
// CDC: res_ack (s_axil_aclk → user_clk) — 2-FF synchronizer + edge detect
// ============================================================================
reg res_ack_sync1, res_ack_sync2, res_ack_sync3;

always @(posedge user_clk or negedge user_resetn) begin
    if (!user_resetn)
        {res_ack_sync3, res_ack_sync2, res_ack_sync1} <= 3'b0;
    else
        {res_ack_sync3, res_ack_sync2, res_ack_sync1} <= {res_ack_sync2, res_ack_sync1, i_res_ack};
end

wire res_ack_pulse = res_ack_sync2 & ~res_ack_sync3;


// ============================================================================
// Request Path: req_gen → fcc_top_1way
// ============================================================================
(* mark_debug = "true" *) wire        req_fifo_ready;
(* mark_debug = "true" *) wire        req_fifo_valid;
(* mark_debug = "true" *) wire [255:0] req_fifo_data;

req_gen #(
    .DATA_WIDTH(DATA_WIDTH)
) req_gen_inst (
    .clk          (user_clk        ),
    .rst_n        (user_resetn     ),
    .o_ready      (o_req_ready     ),
    .i_valid      (cmd_valid_pulse ),
    .i_opc        (i_cmd_opc       ),
    .i_lba        (i_lba           ),
    .i_len        (i_len           ),
    .i_req_ready  (req_fifo_ready  ),
    .o_req_valid  (req_fifo_valid  ),
    .o_req_data   (req_fifo_data   )
);


// ============================================================================
// Response Latch: fcc_top_1way response → latch → regfile readback
// ============================================================================
(* mark_debug = "true" *) wire        fcc_res_valid;
wire [79:0] fcc_res_data;

(* mark_debug = "true" *) reg         res_valid_reg;
reg  [79:0] res_data_reg;
reg         res_fifo_ready;

always @(posedge user_clk or negedge user_resetn) begin
    if (!user_resetn) begin
        res_valid_reg  <= 1'b0;
        res_data_reg   <= 80'h0;
        res_fifo_ready <= 1'b0;
    end else begin
        res_fifo_ready <= 1'b0;  // default: single-cycle pulse

        if (res_ack_pulse && res_valid_reg) begin
            // PS acknowledged — clear latch
            res_valid_reg <= 1'b0;
        end else if (fcc_res_valid && !res_valid_reg) begin
            // New response arrived and latch is empty — capture and ACK FIFO
            res_valid_reg  <= 1'b1;
            res_data_reg   <= fcc_res_data;
            res_fifo_ready <= 1'b1;
        end
    end
end

assign o_res_valid = res_valid_reg;
assign o_res_data  = res_data_reg;
assign o_done      = o_req_ready;


// ============================================================================
// FCC Top (Single-Way Flash Channel Controller)
// ============================================================================
fcc_top_1way #(
    .DATA_WIDTH           (DATA_WIDTH           ),
    .PATCH                (PATCH                )
) fcc_top_1way_inst (
    .clk                  (user_clk             ),
    .rst_n                (user_resetn          ),
    .nand_clk_fast        (nand_clk_fast        ),
    .nand_clk_reset       (nand_clk_rst         ),
    .nand_usr_rstn        (nand_usr_rstn        ),
    .nand_usr_clk         (nand_usr_clk         ),

    // Request FIFO (from req_gen)
    .o_req_fifo_ready_0   (req_fifo_ready       ),
    .i_req_fifo_valid_0   (req_fifo_valid       ),
    .i_req_fifo_data_0    (req_fifo_data        ),

    // Response FIFO (to response latch)
    .i_res_fifo_ready_0   (res_fifo_ready       ),
    .o_res_fifo_valid_0   (fcc_res_valid        ),
    .o_res_fifo_data_0    (fcc_res_data         ),

    // Write Data AXI-Stream (direct passthrough from external)
    .s_data_avail_0       (s_data_avail         ),
    .s_axis_tready_0      (s_axis_tready        ),
    .s_axis_tvalid_0      (s_axis_tvalid        ),
    .s_axis_tdata_0       (s_axis_tdata         ),
    .s_axis_tlast_0       (s_axis_tlast         ),

    // Read Data AXI-Stream (direct passthrough to external)
    .m_axis_tready_0      (m_axis_tready        ),
    .m_axis_tvalid_0      (m_axis_tvalid        ),
    .m_axis_tdata_0       (m_axis_tdata         ),
    .m_axis_tkeep_0       (m_axis_tkeep         ),
    .m_axis_tlast_0       (m_axis_tlast         ),
    .m_axis_tid_0         (m_axis_tid           ),
    .m_axis_tuser_0       (m_axis_tuser         ),

    // NAND Physical Pins
    .O_NAND_CE_N          (O_NAND_CE_N          ),
    .I_NAND_RB_N          (I_NAND_RB_N          ),
    .O_NAND_WE_N          (O_NAND_WE_N          ),
    .O_NAND_CLE           (O_NAND_CLE           ),
    .O_NAND_ALE           (O_NAND_ALE           ),
    .O_NAND_WP_N          (O_NAND_WP_N          ),
    .O_NAND_RE_P          (O_NAND_RE_P          ),
    .O_NAND_RE_N          (O_NAND_RE_N          ),
    .IO_NAND_DQS_P        (IO_NAND_DQS_P        ),
    .IO_NAND_DQS_N        (IO_NAND_DQS_N        ),
    .IO_NAND_DQ           (IO_NAND_DQ           )
);

endmodule
