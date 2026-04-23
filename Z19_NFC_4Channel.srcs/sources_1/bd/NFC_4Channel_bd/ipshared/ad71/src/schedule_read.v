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
// Create Date: 07/27/2019 02:19:52 PM
// Design Name: 
// Module Name: schedule_read
// Project Name: SSD Controller
// Target Devices: 
// Tool Versions: 
// Description: Schedule the read commands with data beyond one page
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

module schedule_read(
    input                     clk,
    input                     rst,
    output                    o_cmd_ready,
    input                     i_cmd_valid,
    input  [15 : 0]           i_rcmd_id,
    input  [47 : 0]           i_raddr, // LBA, Plane address at [16]
    input  [23 : 0]           i_rlen,

    input                     i_page_buf_ready, // has enough buffer space for at least one page
    
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

// Support TWO Planes
// FIRST_XXX: Read page
// CRCE_XXX: Change Read Column Enhanced
localparam
    IDLE       = 6'b000001,
    FIRST_ONE  = 6'b000010,
    FIRST_TWO  = 6'b000100,
    WAIT       = 6'b001000,
    CRCE_ONE   = 6'b010000,
    CRCE_TWO   = 6'b100000;
reg  [ 5:0] state;
reg  [ 5:0] nxt_state;
reg  [47:0] read_addr;
reg  [23:0] remain_len;
wire [15:0] page_size;
wire [11:0] t_ccs;

assign t_ccs = `tCCS;
assign page_size = `PAGE_UTIL_BYTE;

assign o_cmd_ready = (state == IDLE) & i_page_cmd_ready;


// only i_page_cmd_ready & i_page_buf_ready, page cammand can be submitted to next module
// i_page_cmd_ready: next module is ready
// i_page_buf_ready: Page data buffer has enough space(>=one page)
// read many pages: 00-32, 00-30, 06-e0, 06-e0, 00-32, 00-30, 06-e0, 06-e0, ...
always@(posedge clk or posedge rst)
if(rst) begin
    state          <= IDLE;
    nxt_state      <= IDLE;
    read_addr      <= 48'h0;
    remain_len     <= 24'h0;
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
            if(i_cmd_valid) begin
                state          <= FIRST_ONE;
                read_addr      <= i_raddr;
                remain_len     <= i_rlen;
            end
        end 
        FIRST_ONE: begin
            if(i_page_cmd_ready & i_page_buf_ready & (remain_len <= `PAGE_UTIL_BYTE)) begin
                state            <= WAIT;
                nxt_state        <= IDLE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h3000; // Read Page
                o_page_cmd_last  <= 1'b1;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {remain_len[15:0], 12'h800, 3'h6, 1'b1};                
            end else if(i_page_cmd_ready & i_page_buf_ready & read_addr[16]) begin // Plane address = 1
                state            <= WAIT;
                nxt_state        <= FIRST_ONE;
                read_addr        <= read_addr + 40'h10000;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h3000;
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {page_size, 12'h800, 3'h6, 1'b1};   
            end else if(i_page_cmd_ready & i_page_buf_ready) begin // Plane address = 0
                state            <= WAIT;
                nxt_state        <= FIRST_TWO;
                read_addr        <= read_addr + 40'h10000;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h3200; // Multi-Plane
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {16'h0, 12'h800, 3'h6, 1'b1}; 
            end        
        end
        FIRST_TWO: begin
            if(i_page_cmd_ready & i_page_buf_ready) begin
                state            <= WAIT;
                nxt_state        <= CRCE_ONE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'h3000; // Multi-plane execute: Read Page
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {16'h0, 12'h800, 3'h6, 1'b1}; 
            end
        end
        WAIT: begin
            o_page_cmd_valid <= 1'b0;
            if(~(i_page_cmd_ready | o_page_cmd_valid)) begin
                state        <= nxt_state;
            end 
        end
        CRCE_ONE: begin
            if(i_page_cmd_ready & i_page_buf_ready) begin
                state            <= WAIT;
                nxt_state        <= CRCE_TWO;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'hE006; // Change Read Column Enhanced
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr - 40'h10000; // read plane 0 page
                o_page_cmd_param <= {page_size, t_ccs, 3'h6, 1'b1}; 
            end
        end
        CRCE_TWO: begin // here remain_len include the data CRCE Command to read
            if(i_page_cmd_ready & i_page_buf_ready & (remain_len <= `PAGE_UTIL_BYTE)) begin // read finish
                state            <= WAIT;
                nxt_state        <= IDLE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'hE006; // Change Read Column Enhanced
                o_page_cmd_last  <= 1'b1;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {remain_len[15:0], t_ccs, 3'h6, 1'b1};
            end else if(i_page_cmd_ready & i_page_buf_ready) begin // more pages, start next multi-plane pair
                state            <= WAIT;
                nxt_state        <= FIRST_ONE;
                read_addr        <= read_addr + 40'h10000;
                remain_len       <= remain_len - `PAGE_UTIL_BYTE;
                o_page_cmd_valid <= 1'b1;
                o_page_cmd       <= 16'hE006; // Change Read Column Enhanced
                o_page_cmd_last  <= 1'b0;
                o_page_cmd_id    <= i_rcmd_id;
                o_page_addr      <= read_addr;
                o_page_cmd_param <= {page_size, t_ccs, 3'h6, 1'b1};
            end
        end
    endcase
end


endmodule
