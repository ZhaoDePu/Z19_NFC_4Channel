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
// Create Date: 09/07/2020 03:02:06 PM
// Design Name:
// Module Name: req_gen
// Project Name:
// Target Devices:
// Tool Versions:
// Description: NFC Request Generator (simplified: request assembly only, no data gen)
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Simplified: removed write data generation (AXI-Stream now external)
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module req_gen#(
    parameter DATA_WIDTH = 32
)(
    input                          clk,
    input                          rst_n,

    output                         o_ready,
    input                          i_valid,
    input [15:0]                   i_opc, // operation code
    input [47:0]                   i_lba, // logical block address
    input [23:0]                   i_len, // transfer data length in bytes

    input                          i_req_ready,
    output reg                     o_req_valid,
    output reg [255:0]             o_req_data
);

// OPC:
// 00FFh: Reset
// 01EFh: Set Timing mode
// 02EFh: Set NVDDR2
// 00ECh: Get Parameter page
// 3000h: Read Page
// 1080h: Program page
// D060h: Erase Block

// Request Entry Format
// Dword 0   : [31 : 16] CID, Command ID
//             [15 : 0]  OPC, Opcode
// Dword 1-2 : [47 : 0]  nand address
//             [63 : 48] data length
// Dword 3-4 : [63 : 0]  metadata
// Dword 5   : [31 : 16] colum address
//             [15 : 0]  data length
// Dword 6   : [31 : 16] colum address
//             [15 : 0]  data length
// Dword 7  :  [ 7 : 0]  colum operation number


reg [15:0] cmd_id;

localparam
    IDLE   = 1'd0,
    REQ    = 1'd1;


reg        state;

assign o_ready = (state == IDLE);

always@(posedge clk or negedge rst_n)
if(~rst_n) begin
    state        <= IDLE;
    o_req_valid  <= 1'h0;
    o_req_data   <= 256'h0;
end else begin
    case(state)
        IDLE: begin
            if(i_valid & (i_opc == 16'h1080)) begin
                state       <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, i_len[23:0], i_lba[47:0], cmd_id, i_opc};
            end else if(i_valid & (i_opc == 16'h3000)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, i_len[23:0], i_lba[47:0], cmd_id, i_opc};
            end else if(i_valid & (i_opc == 16'hD060)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, i_len[23:0], i_lba[47:0], cmd_id, i_opc};
            end else if(i_valid & (i_opc == 16'hFF)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 64'h0, cmd_id, i_opc};
            end else if(i_valid & (i_opc == 16'h01EF)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h24, 24'h0, 48'h01, cmd_id, 16'h00EF};
            end else if(i_valid & (i_opc == 16'h02EF)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {4'h0, 4'h0, 8'h07, 24'h0, 48'h02, cmd_id, 16'h00EF};
            end else if(i_valid & (i_opc == 16'h00EC)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 24'h100, 48'h0, cmd_id, 16'h00EC};
            end else if(i_valid & (i_opc == 16'hFAEE)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 24'h00, 48'hFA, cmd_id, 16'h00EE};
            end else if(i_valid & (i_opc == 16'h2090)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 24'h00, 48'h20, cmd_id, 16'h0090};    
            end else if(i_valid & (i_opc == 16'h0090)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 24'h00, 48'h0, cmd_id, 16'h0090}; 
            end else if(i_valid & (i_opc == 16'h00ED)) begin
                state      <= REQ;
                o_req_valid <= 1'h1;
                o_req_data  <= {64'h0, 24'h00, 48'h0, cmd_id, 16'h00ED};
            end 
        end
        REQ: begin
            if(o_req_valid & i_req_ready) begin
                state       <= IDLE;
                o_req_valid <= 1'h0;
            end
        end
    endcase
end


always@(posedge clk or negedge rst_n)
if(~rst_n) begin
    cmd_id <= 16'h0;
end else if((state == IDLE) && i_valid) begin
    cmd_id <= cmd_id + 16'h1;
end


endmodule
