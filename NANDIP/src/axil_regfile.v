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
// Module Name: axil_regfile
// Description: AXI4-Lite Slave Register File — 4-channel NFC controller
//
// Address Map:
//   addr[8] = 0 : Per-channel registers
//     addr[7:6] = channel select (0-3)
//     addr[5:0] = register offset (same layout as single-channel version)
//       0x00  NFC_CMD_OPC    [15:0]  RW   NAND opcode
//       0x04  NFC_CMD_VALID  [0]     RW1C Write 1 to trigger (self-clearing)
//       0x08  NFC_STATUS     [2:0]   RO   [0]=req_ready [1]=res_valid [2]=done
//       0x10  NFC_LBA_L      [31:0]  RW   NAND address [31:0]
//       0x14  NFC_LBA_H      [15:0]  RW   NAND address [47:32]
//       0x18  NFC_LEN        [23:0]  RW   Data length in bytes
//       0x20  NFC_RES_DATA_L [31:0]  RO   Response data [31:0]
//       0x24  NFC_RES_DATA_H [31:0]  RO   Response data [63:32]
//       0x28  NFC_RES_CID    [15:0]  RO   Response CID
//       0x2C  NFC_RES_ACK    [0]     RW1C Write 1 to acknowledge (self-clearing)
//
//   addr[8] = 1 : Global registers
//       0x100 CHAN_EN        [3:0]   RW   Channel enable mask (default 4'b1111)
//
// Channel examples:
//   CH0: 0x000  CH1: 0x040  CH2: 0x080  CH3: 0x0C0
//////////////////////////////////////////////////////////////////////////////////

module axil_regfile #(
    parameter AXIL_ADDR_WIDTH = 16,
    parameter AXIL_DATA_WIDTH = 32,
    parameter CHAN_NUM         = 4
)(
    input                               s_axi_aclk,
    input                               s_axi_aresetn,

    // AXI4-Lite Write Address Channel
    input  [AXIL_ADDR_WIDTH-1:0]        s_axi_awaddr,
    input  [2:0]                        s_axi_awprot,
    input                               s_axi_awvalid,
    output reg                          s_axi_awready,

    // AXI4-Lite Write Data Channel
    input  [AXIL_DATA_WIDTH-1:0]        s_axi_wdata,
    input  [AXIL_DATA_WIDTH/8-1:0]      s_axi_wstrb,
    input                               s_axi_wvalid,
    output reg                          s_axi_wready,

    // AXI4-Lite Write Response Channel
    output reg [1:0]                    s_axi_bresp,
    output reg                          s_axi_bvalid,
    input                               s_axi_bready,

    // AXI4-Lite Read Address Channel
    input  [AXIL_ADDR_WIDTH-1:0]        s_axi_araddr,
    input  [2:0]                        s_axi_arprot,
    input                               s_axi_arvalid,
    output reg                          s_axi_arready,

    // AXI4-Lite Read Data Channel
    output reg [AXIL_DATA_WIDTH-1:0]    s_axi_rdata,
    output reg [1:0]                    s_axi_rresp,
    output reg                          s_axi_rvalid,
    input                               s_axi_rready,

    // ---- Command outputs: Channel 0 ----
    output [15:0]                       nfc_cmd_opc_0,
    output                              nfc_cmd_valid_0,
    output [63:0]                       nfc_lba_0,
    output [31:0]                       nfc_len_0,
    output                              o_res_ack_0,

    // ---- Command outputs: Channel 1 ----
    output [15:0]                       nfc_cmd_opc_1,
    output                              nfc_cmd_valid_1,
    output [63:0]                       nfc_lba_1,
    output [31:0]                       nfc_len_1,
    output                              o_res_ack_1,

    // ---- Command outputs: Channel 2 ----
    output [15:0]                       nfc_cmd_opc_2,
    output                              nfc_cmd_valid_2,
    output [63:0]                       nfc_lba_2,
    output [31:0]                       nfc_len_2,
    output                              o_res_ack_2,

    // ---- Command outputs: Channel 3 ----
    output [15:0]                       nfc_cmd_opc_3,
    output                              nfc_cmd_valid_3,
    output [63:0]                       nfc_lba_3,
    output [31:0]                       nfc_len_3,
    output                              o_res_ack_3,

    // ---- Global channel enable ----
    output [3:0]                        o_chan_en,

    // ---- Status inputs: Channel 0 ----
    input                               i_req_ready_0,
    input                               i_res_valid_0,
    input                               i_done_0,
    input  [79:0]                       i_res_data_0,

    // ---- Status inputs: Channel 1 ----
    input                               i_req_ready_1,
    input                               i_res_valid_1,
    input                               i_done_1,
    input  [79:0]                       i_res_data_1,

    // ---- Status inputs: Channel 2 ----
    input                               i_req_ready_2,
    input                               i_res_valid_2,
    input                               i_done_2,
    input  [79:0]                       i_res_data_2,

    // ---- Status inputs: Channel 3 ----
    input                               i_req_ready_3,
    input                               i_res_valid_3,
    input                               i_done_3,
    input  [79:0]                       i_res_data_3
);

//------------------------------------------------------------
// Register offset constants (addr[5:0] within each channel)
//------------------------------------------------------------
localparam [5:0]
    OFF_CMD_OPC    = 6'h00,
    OFF_CMD_VALID  = 6'h04,
    OFF_STATUS     = 6'h08,
    OFF_LBA_L      = 6'h10,
    OFF_LBA_H      = 6'h14,
    OFF_LEN        = 6'h18,
    OFF_RES_DATA_L = 6'h20,
    OFF_RES_DATA_H = 6'h24,
    OFF_RES_CID    = 6'h28,
    OFF_RES_ACK    = 6'h2C;

//------------------------------------------------------------
// Write/Read FSM states
//------------------------------------------------------------
localparam WR_IDLE = 2'd0, WR_ADDR = 2'd1, WR_DATA = 2'd2, WR_RESP = 2'd3;
localparam RD_IDLE = 2'd0, RD_ADDR = 2'd1, RD_DATA = 2'd2;

reg [1:0] wr_state, rd_state;
reg [AXIL_ADDR_WIDTH-1:0] wr_addr_reg, rd_addr_reg;
reg [AXIL_DATA_WIDTH-1:0] wr_data_reg;
reg [AXIL_DATA_WIDTH/8-1:0] wr_strb_reg;

wire [31:0] wr_mask = {{8{wr_strb_reg[3]}}, {8{wr_strb_reg[2]}},
                       {8{wr_strb_reg[1]}}, {8{wr_strb_reg[0]}}};

// Address decode wires
wire [1:0] wr_ch_sel  = wr_addr_reg[7:6];
wire [1:0] rd_ch_sel  = rd_addr_reg[7:6];
wire       wr_global  = wr_addr_reg[8];
wire       rd_global  = rd_addr_reg[8];
wire [5:0] wr_reg_off = wr_addr_reg[5:0];
wire [5:0] rd_reg_off = rd_addr_reg[5:0];

// Per-channel and global write strobes
wire wr_en = (wr_state == WR_RESP) && !s_axi_bvalid;

wire ch0_wr = wr_en && !wr_global && (wr_ch_sel == 2'd0);
wire ch1_wr = wr_en && !wr_global && (wr_ch_sel == 2'd1);
wire ch2_wr = wr_en && !wr_global && (wr_ch_sel == 2'd2);
wire ch3_wr = wr_en && !wr_global && (wr_ch_sel == 2'd3);
wire glb_wr = wr_en &&  wr_global;


//============================================================
// Write FSM
//============================================================
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        wr_state      <= WR_IDLE;
        s_axi_awready <= 1'b0;
        s_axi_wready  <= 1'b0;
        s_axi_bvalid  <= 1'b0;
        s_axi_bresp   <= 2'b00;
        wr_addr_reg   <= {AXIL_ADDR_WIDTH{1'b0}};
        wr_data_reg   <= {AXIL_DATA_WIDTH{1'b0}};
        wr_strb_reg   <= {(AXIL_DATA_WIDTH/8){1'b0}};
    end else begin
        case (wr_state)
            WR_IDLE: begin
                s_axi_awready <= 1'b1;
                s_axi_wready  <= 1'b1;
                s_axi_bvalid  <= 1'b0;
                if (s_axi_awvalid && s_axi_awready) begin
                    wr_addr_reg <= s_axi_awaddr;
                    if (s_axi_wvalid && s_axi_wready) begin
                        wr_data_reg <= s_axi_wdata; wr_strb_reg <= s_axi_wstrb;
                        s_axi_awready <= 1'b0; s_axi_wready <= 1'b0;
                        wr_state <= WR_RESP;
                    end else begin
                        s_axi_awready <= 1'b0; wr_state <= WR_DATA;
                    end
                end else if (s_axi_wvalid && s_axi_wready) begin
                    wr_data_reg <= s_axi_wdata; wr_strb_reg <= s_axi_wstrb;
                    s_axi_wready <= 1'b0; wr_state <= WR_ADDR;
                end
            end
            WR_ADDR: begin
                if (s_axi_awvalid && s_axi_awready) begin
                    wr_addr_reg <= s_axi_awaddr;
                    s_axi_awready <= 1'b0; wr_state <= WR_RESP;
                end
            end
            WR_DATA: begin
                if (s_axi_wvalid && s_axi_wready) begin
                    wr_data_reg <= s_axi_wdata; wr_strb_reg <= s_axi_wstrb;
                    s_axi_wready <= 1'b0; wr_state <= WR_RESP;
                end
            end
            WR_RESP: begin
                s_axi_bvalid <= 1'b1; s_axi_bresp <= 2'b00;
                if (s_axi_bvalid && s_axi_bready) begin
                    s_axi_bvalid <= 1'b0; wr_state <= WR_IDLE;
                end
            end
            default: wr_state <= WR_IDLE;
        endcase
    end
end


//============================================================
// 2-FF Synchronizers for status inputs (per channel)
//============================================================
reg rr0, rv0, rd0;  // req_ready, res_valid, done — ch0 stage1
reg rr1, rv1, rd1;
reg rr2, rv2, rd2;
reg rr3, rv3, rd3;
reg rr0s, rv0s, rd0s;  // stage2 (synced)
reg rr1s, rv1s, rd1s;
reg rr2s, rv2s, rd2s;
reg rr3s, rv3s, rd3s;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        {rr0s,rr0} <= 2'b0; {rv0s,rv0} <= 2'b0; {rd0s,rd0} <= 2'b0;
        {rr1s,rr1} <= 2'b0; {rv1s,rv1} <= 2'b0; {rd1s,rd1} <= 2'b0;
        {rr2s,rr2} <= 2'b0; {rv2s,rv2} <= 2'b0; {rd2s,rd2} <= 2'b0;
        {rr3s,rr3} <= 2'b0; {rv3s,rv3} <= 2'b0; {rd3s,rd3} <= 2'b0;
    end else begin
        {rr0s,rr0} <= {rr0, i_req_ready_0}; {rv0s,rv0} <= {rv0, i_res_valid_0}; {rd0s,rd0} <= {rd0, i_done_0};
        {rr1s,rr1} <= {rr1, i_req_ready_1}; {rv1s,rv1} <= {rv1, i_res_valid_1}; {rd1s,rd1} <= {rd1, i_done_1};
        {rr2s,rr2} <= {rr2, i_req_ready_2}; {rv2s,rv2} <= {rv2, i_res_valid_2}; {rd2s,rd2} <= {rd2, i_done_2};
        {rr3s,rr3} <= {rr3, i_req_ready_3}; {rv3s,rv3} <= {rv3, i_res_valid_3}; {rd3s,rd3} <= {rd3, i_done_3};
    end
end

// Packed for easy mux indexing
wire [3:0] req_ready_synced = {rr3s, rr2s, rr1s, rr0s};
wire [3:0] res_valid_synced = {rv3s, rv2s, rv1s, rv0s};
wire [3:0] done_synced      = {rd3s, rd2s, rd1s, rd0s};


//============================================================
// Per-channel Register Storage
//============================================================

//--- CMD_OPC ---
reg [15:0] opc0, opc1, opc2, opc3;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) opc0 <= 16'h0;
    else if (ch0_wr && (wr_reg_off == OFF_CMD_OPC)) begin
        if (wr_strb_reg[0]) opc0[7:0]  <= wr_data_reg[7:0];
        if (wr_strb_reg[1]) opc0[15:8] <= wr_data_reg[15:8];
    end
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) opc1 <= 16'h0;
    else if (ch1_wr && (wr_reg_off == OFF_CMD_OPC)) begin
        if (wr_strb_reg[0]) opc1[7:0]  <= wr_data_reg[7:0];
        if (wr_strb_reg[1]) opc1[15:8] <= wr_data_reg[15:8];
    end
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) opc2 <= 16'h0;
    else if (ch2_wr && (wr_reg_off == OFF_CMD_OPC)) begin
        if (wr_strb_reg[0]) opc2[7:0]  <= wr_data_reg[7:0];
        if (wr_strb_reg[1]) opc2[15:8] <= wr_data_reg[15:8];
    end
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) opc3 <= 16'h0;
    else if (ch3_wr && (wr_reg_off == OFF_CMD_OPC)) begin
        if (wr_strb_reg[0]) opc3[7:0]  <= wr_data_reg[7:0];
        if (wr_strb_reg[1]) opc3[15:8] <= wr_data_reg[15:8];
    end
end


//--- CMD_VALID (self-clearing, rising-edge pulse) ---
reg [31:0] cv0_r, cv1_r, cv2_r, cv3_r;
reg [31:0] cv0_d, cv1_d, cv2_d, cv3_d;
reg        nfc_cv0, nfc_cv1, nfc_cv2, nfc_cv3;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) cv0_r <= 32'h0;
    else if (ch0_wr && (wr_reg_off == OFF_CMD_VALID))
        cv0_r <= (wr_data_reg & wr_mask) | (cv0_r & ~wr_mask);
    else cv0_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) cv1_r <= 32'h0;
    else if (ch1_wr && (wr_reg_off == OFF_CMD_VALID))
        cv1_r <= (wr_data_reg & wr_mask) | (cv1_r & ~wr_mask);
    else cv1_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) cv2_r <= 32'h0;
    else if (ch2_wr && (wr_reg_off == OFF_CMD_VALID))
        cv2_r <= (wr_data_reg & wr_mask) | (cv2_r & ~wr_mask);
    else cv2_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) cv3_r <= 32'h0;
    else if (ch3_wr && (wr_reg_off == OFF_CMD_VALID))
        cv3_r <= (wr_data_reg & wr_mask) | (cv3_r & ~wr_mask);
    else cv3_r <= 32'h0;
end

always @(posedge s_axi_aclk) begin
    cv0_d <= cv0_r; cv1_d <= cv1_r; cv2_d <= cv2_r; cv3_d <= cv3_r;
end

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        nfc_cv0 <= 1'b0; nfc_cv1 <= 1'b0; nfc_cv2 <= 1'b0; nfc_cv3 <= 1'b0;
    end else begin
        nfc_cv0 <= cv0_r[0] & ~cv0_d[0];
        nfc_cv1 <= cv1_r[0] & ~cv1_d[0];
        nfc_cv2 <= cv2_r[0] & ~cv2_d[0];
        nfc_cv3 <= cv3_r[0] & ~cv3_d[0];
    end
end


//--- LBA (64-bit, two writes) ---
reg [63:0] lba0, lba1, lba2, lba3;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) lba0 <= 64'h0;
    else if (ch0_wr) case (wr_reg_off)
        OFF_LBA_L: lba0[31:0]  <= (wr_data_reg & wr_mask) | (lba0[31:0]  & ~wr_mask);
        OFF_LBA_H: lba0[63:32] <= (wr_data_reg & wr_mask) | (lba0[63:32] & ~wr_mask);
    endcase
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) lba1 <= 64'h0;
    else if (ch1_wr) case (wr_reg_off)
        OFF_LBA_L: lba1[31:0]  <= (wr_data_reg & wr_mask) | (lba1[31:0]  & ~wr_mask);
        OFF_LBA_H: lba1[63:32] <= (wr_data_reg & wr_mask) | (lba1[63:32] & ~wr_mask);
    endcase
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) lba2 <= 64'h0;
    else if (ch2_wr) case (wr_reg_off)
        OFF_LBA_L: lba2[31:0]  <= (wr_data_reg & wr_mask) | (lba2[31:0]  & ~wr_mask);
        OFF_LBA_H: lba2[63:32] <= (wr_data_reg & wr_mask) | (lba2[63:32] & ~wr_mask);
    endcase
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) lba3 <= 64'h0;
    else if (ch3_wr) case (wr_reg_off)
        OFF_LBA_L: lba3[31:0]  <= (wr_data_reg & wr_mask) | (lba3[31:0]  & ~wr_mask);
        OFF_LBA_H: lba3[63:32] <= (wr_data_reg & wr_mask) | (lba3[63:32] & ~wr_mask);
    endcase
end


//--- LEN ---
reg [31:0] len0, len1, len2, len3;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) len0 <= 32'h0;
    else if (ch0_wr && (wr_reg_off == OFF_LEN))
        len0 <= (wr_data_reg & wr_mask) | (len0 & ~wr_mask);
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) len1 <= 32'h0;
    else if (ch1_wr && (wr_reg_off == OFF_LEN))
        len1 <= (wr_data_reg & wr_mask) | (len1 & ~wr_mask);
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) len2 <= 32'h0;
    else if (ch2_wr && (wr_reg_off == OFF_LEN))
        len2 <= (wr_data_reg & wr_mask) | (len2 & ~wr_mask);
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) len3 <= 32'h0;
    else if (ch3_wr && (wr_reg_off == OFF_LEN))
        len3 <= (wr_data_reg & wr_mask) | (len3 & ~wr_mask);
end


//--- RES_ACK (self-clearing, rising-edge pulse) ---
reg [31:0] ra0_r, ra1_r, ra2_r, ra3_r;
reg [31:0] ra0_d, ra1_d, ra2_d, ra3_d;
reg        nfc_ra0, nfc_ra1, nfc_ra2, nfc_ra3;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) ra0_r <= 32'h0;
    else if (ch0_wr && (wr_reg_off == OFF_RES_ACK))
        ra0_r <= (wr_data_reg & wr_mask) | (ra0_r & ~wr_mask);
    else ra0_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) ra1_r <= 32'h0;
    else if (ch1_wr && (wr_reg_off == OFF_RES_ACK))
        ra1_r <= (wr_data_reg & wr_mask) | (ra1_r & ~wr_mask);
    else ra1_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) ra2_r <= 32'h0;
    else if (ch2_wr && (wr_reg_off == OFF_RES_ACK))
        ra2_r <= (wr_data_reg & wr_mask) | (ra2_r & ~wr_mask);
    else ra2_r <= 32'h0;
end
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) ra3_r <= 32'h0;
    else if (ch3_wr && (wr_reg_off == OFF_RES_ACK))
        ra3_r <= (wr_data_reg & wr_mask) | (ra3_r & ~wr_mask);
    else ra3_r <= 32'h0;
end

always @(posedge s_axi_aclk) begin
    ra0_d <= ra0_r; ra1_d <= ra1_r; ra2_d <= ra2_r; ra3_d <= ra3_r;
end

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        nfc_ra0 <= 1'b0; nfc_ra1 <= 1'b0; nfc_ra2 <= 1'b0; nfc_ra3 <= 1'b0;
    end else begin
        nfc_ra0 <= ra0_r[0] & ~ra0_d[0];
        nfc_ra1 <= ra1_r[0] & ~ra1_d[0];
        nfc_ra2 <= ra2_r[0] & ~ra2_d[0];
        nfc_ra3 <= ra3_r[0] & ~ra3_d[0];
    end
end


//--- Global: CHAN_EN ---
reg [3:0] chan_en_r;

always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn)
        chan_en_r <= 4'hF;   // all channels enabled at reset
    else if (glb_wr && (wr_addr_reg[7:0] == 8'h00))
        chan_en_r <= (wr_data_reg[3:0] & wr_mask[3:0]) | (chan_en_r & ~wr_mask[3:0]);
end


//============================================================
// Read combinatorial muxes (select by rd_ch_sel)
//============================================================
wire [15:0] opc_mux  = (rd_ch_sel==2'd0) ? opc0  : (rd_ch_sel==2'd1) ? opc1  : (rd_ch_sel==2'd2) ? opc2  : opc3;
wire [63:0] lba_mux  = (rd_ch_sel==2'd0) ? lba0  : (rd_ch_sel==2'd1) ? lba1  : (rd_ch_sel==2'd2) ? lba2  : lba3;
wire [31:0] len_mux  = (rd_ch_sel==2'd0) ? len0  : (rd_ch_sel==2'd1) ? len1  : (rd_ch_sel==2'd2) ? len2  : len3;
wire [31:0] cv_mux   = (rd_ch_sel==2'd0) ? cv0_r : (rd_ch_sel==2'd1) ? cv1_r : (rd_ch_sel==2'd2) ? cv2_r : cv3_r;
wire [31:0] ra_mux   = (rd_ch_sel==2'd0) ? ra0_r : (rd_ch_sel==2'd1) ? ra1_r : (rd_ch_sel==2'd2) ? ra2_r : ra3_r;
wire [79:0] res_mux  = (rd_ch_sel==2'd0) ? i_res_data_0 :
                       (rd_ch_sel==2'd1) ? i_res_data_1 :
                       (rd_ch_sel==2'd2) ? i_res_data_2 : i_res_data_3;


//============================================================
// Read FSM
//============================================================
always @(posedge s_axi_aclk) begin
    if (!s_axi_aresetn) begin
        rd_state      <= RD_IDLE;
        s_axi_arready <= 1'b0;
        s_axi_rvalid  <= 1'b0;
        s_axi_rresp   <= 2'b00;
        s_axi_rdata   <= {AXIL_DATA_WIDTH{1'b0}};
        rd_addr_reg   <= {AXIL_ADDR_WIDTH{1'b0}};
    end else begin
        case (rd_state)
            RD_IDLE: begin
                s_axi_arready <= 1'b1;
                s_axi_rvalid  <= 1'b0;
                if (s_axi_arvalid && s_axi_arready) begin
                    rd_addr_reg   <= s_axi_araddr;
                    s_axi_arready <= 1'b0;
                    rd_state      <= RD_DATA;
                end
            end

            RD_DATA: begin
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= 2'b00;

                if (rd_global) begin
                    // Global register space
                    case (rd_addr_reg[7:0])
                        8'h00:   s_axi_rdata <= {28'h0, chan_en_r};
                        default: s_axi_rdata <= 32'hDEADBEEF;
                    endcase
                end else begin
                    // Per-channel register space
                    case (rd_reg_off)
                        OFF_CMD_OPC:    s_axi_rdata <= {16'h0, opc_mux};
                        OFF_CMD_VALID:  s_axi_rdata <= cv_mux;
                        OFF_STATUS:     s_axi_rdata <= {29'h0,
                                                        done_synced[rd_ch_sel],
                                                        res_valid_synced[rd_ch_sel],
                                                        req_ready_synced[rd_ch_sel]};
                        OFF_LBA_L:      s_axi_rdata <= lba_mux[31:0];
                        OFF_LBA_H:      s_axi_rdata <= lba_mux[63:32];
                        OFF_LEN:        s_axi_rdata <= len_mux;
                        OFF_RES_DATA_L: s_axi_rdata <= res_mux[31:0];
                        OFF_RES_DATA_H: s_axi_rdata <= res_mux[63:32];
                        OFF_RES_CID:    s_axi_rdata <= {16'h0, res_mux[79:64]};
                        OFF_RES_ACK:    s_axi_rdata <= ra_mux;
                        default:        s_axi_rdata <= 32'hDEADBEEF;
                    endcase
                end

                if (s_axi_rvalid && s_axi_rready) begin
                    s_axi_rvalid <= 1'b0;
                    rd_state     <= RD_IDLE;
                end
            end

            default: rd_state <= RD_IDLE;
        endcase
    end
end


//============================================================
// Output assignments
//============================================================
assign nfc_cmd_opc_0   = opc0;
assign nfc_cmd_opc_1   = opc1;
assign nfc_cmd_opc_2   = opc2;
assign nfc_cmd_opc_3   = opc3;

assign nfc_cmd_valid_0 = nfc_cv0;
assign nfc_cmd_valid_1 = nfc_cv1;
assign nfc_cmd_valid_2 = nfc_cv2;
assign nfc_cmd_valid_3 = nfc_cv3;

assign nfc_lba_0       = lba0;
assign nfc_lba_1       = lba1;
assign nfc_lba_2       = lba2;
assign nfc_lba_3       = lba3;

assign nfc_len_0       = len0;
assign nfc_len_1       = len1;
assign nfc_len_2       = len2;
assign nfc_len_3       = len3;

assign o_res_ack_0     = nfc_ra0;
assign o_res_ack_1     = nfc_ra1;
assign o_res_ack_2     = nfc_ra2;
assign o_res_ack_3     = nfc_ra3;

assign o_chan_en        = chan_en_r;

endmodule
