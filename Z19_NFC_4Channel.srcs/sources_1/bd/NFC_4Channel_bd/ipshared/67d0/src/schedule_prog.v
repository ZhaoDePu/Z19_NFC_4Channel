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
// Create Date: 08/06/2019 06:59:08 PM
// Design Name: 
// Module Name: schedule_prog
// Project Name: SSD Controller
// Target Devices: 
// Tool Versions: 
// Description: Schedule the program commands with data beyond one page
//              slice into page-level commands
//              support multi-plane operations
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`include "nfc_param.vh"

module schedule_prog(
    input                     clk,
    input                     rst,
    output                    o_cmd_ready,
    input                     i_cmd_valid,
    input  [15 : 0]           i_wcmd_id,
    input  [47 : 0]           i_waddr, // LBA, Plane address at [16]
    input  [23 : 0]           i_wlen,

    input  [23 : 0]           i_wdata_avail, // availiable (bufferred) data number
    
    input                     i_page_cmd_ready,
    output reg                o_page_cmd_valid,
    output reg [15 : 0]       o_page_cmd,
    output reg                o_page_cmd_last,
    output reg [15 : 0]       o_page_cmd_id,
    output reg [47 : 0]       o_page_addr, // LBA
    output reg [31 : 0]       o_page_cmd_param
   
    //    input                     i_rready,
//    output                    o_rvalid,
//    output [31 : 0]           o_rdata,
//    output                    o_rlast
);

// MPP: Multi-plane Program
localparam
    IDLE     = 5'b00001,
    PROG     = 5'b00010,
    WAIT     = 5'b00100,
    MPP_ONE  = 5'b01000,
    MPP_TWO  = 5'b10000;

reg  [ 4:0] state;
reg  [ 4:0] nxt_state;
reg  [23:0] remain_len;
wire [15:0] page_size;
wire [23:0] two_page_size;
reg  [31:0] row_addr;
wire [11:0] t_dbsy;

assign t_dbsy = `tDBSY;
assign page_size = `PAGE_UTIL_BYTE;
assign two_page_size = (`PAGE_UTIL_BYTE << 1);
assign o_cmd_ready = (state == IDLE) & i_page_cmd_ready;

always@(posedge clk or posedge rst)
if(rst) begin
    state          <= IDLE;
    nxt_state      <= IDLE;
    remain_len     <= 24'h0;
    row_addr       <= 32'h0;
    o_page_cmd_valid <= 1'b0;
    o_page_cmd       <= 16'h0;
    o_page_cmd_last  <= 1'b0;
    o_page_cmd_id    <= 'h0;
    o_page_addr      <= 'h0;
    o_page_cmd_param <= 'h0; 
end else begin
    case(state)
        IDLE: begin
            o_page_cmd_valid <= 1'b0;
            if(i_cmd_valid & (i_wlen <= `PAGE_UTIL_BYTE)) begin
                state          <= PROG;
            end else if(i_cmd_valid) begin
                state          <= MPP_ONE;  
                remain_len     <= i_wlen;  
                row_addr       <= i_waddr[47:16];
            end
        end
        PROG: begin
            if(i_page_cmd_ready & (i_wdata_avail > 24'h0)) begin
                state            <= WAIT;
                nxt_state        <= IDLE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080;
                o_page_cmd_last  <= 1'b1;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= i_waddr;
                o_page_cmd_param <= {i_wlen[15:0], 12'h800, 3'h6, 1'b1};
            end
        end
        WAIT: begin
            o_page_cmd_valid <= 1'b0;
            if(~(i_page_cmd_ready | o_page_cmd_valid)) begin
                state            <= nxt_state;
            end 
        end
        MPP_ONE: begin
            if(i_page_cmd_ready & row_addr[0] & (i_wdata_avail > 24'h0)) begin // Plane = 1
                state            <= WAIT;
                nxt_state        <= MPP_ONE;
                row_addr         <= row_addr + 32'h1;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080;
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {page_size, 12'h800, 3'h6, 1'b1};
            end else if(i_page_cmd_ready & (i_wdata_avail > 24'h0) & (remain_len <= `PAGE_UTIL_BYTE)) begin // left one page
                state            <= WAIT;
                nxt_state        <= IDLE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080;
                o_page_cmd_last  <= 1'b1;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {remain_len[15:0], 12'h800, 3'h6, 1'b1};
            end else if(i_page_cmd_ready & (i_wdata_avail > 24'h0)) begin
                state            <= WAIT;
                nxt_state        <= MPP_TWO;
                row_addr         <= row_addr + 32'h1;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1180; // Multi-plane program
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {page_size, t_dbsy, 3'h6, 1'b1}; 
            end
        end
        MPP_TWO: begin
            if(i_page_cmd_ready & (i_wdata_avail > 24'h0) & (remain_len <= `PAGE_UTIL_BYTE)) begin // left one page
                state            <= WAIT;
                nxt_state        <= IDLE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080; // Final Multi-plane program
                o_page_cmd_last  <= 1'b1;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {remain_len[15:0], 12'h800, 3'h6, 1'b1};
            end else if(i_page_cmd_ready & (i_wdata_avail > 24'h0) & (remain_len <= two_page_size)) begin
                state            <= WAIT;
                nxt_state        <= MPP_ONE;
                row_addr         <= row_addr + 32'h1;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080; // Final Multi-plane program
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {page_size, 12'h800, 3'h6, 1'b1};   
            end else if(i_page_cmd_ready & (i_wdata_avail > 24'h0)) begin
                state            <= WAIT;
                nxt_state        <= MPP_ONE;
                row_addr         <= row_addr + 32'h1;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h1080; // Multi-plane program (no cache)
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_wcmd_id;
                o_page_addr      <= {row_addr, 16'h0};
                o_page_cmd_param <= {page_size, 12'h800, 3'h6, 1'b1}; 
            end
        end        
    endcase
end






endmodule
