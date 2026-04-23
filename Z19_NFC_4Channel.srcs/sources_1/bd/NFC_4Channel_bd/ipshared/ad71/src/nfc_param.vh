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
// NAND Flash timing parameters
//////////////////////////////////////////////////////////////////////////////////
 // 50M 
// CMD & ADDR timimg parameter
`define tCMD_ADDR   6
`define tADL        15
`define tWB         5
`define tFEAT      50
`define tVDLY       3
// DATA OUTPUT timimg parameter
`define tWHR        4
`define tRPRE       7 //1
`define tDQSRH      1
`define tRPST       8 //2
`define tRPSTH      10
// DATA INPUT timimg parameter
`define tCCS        20
`define tWPRE       1
`define tWPST       1
`define tWPSTH      1
`define tDBSY       25 


// NAND Flash Architecture
`define MAIN_PAGE_BYTE      16384
`define SPARE_PAGE_BYTE     2048
`define PAGE_BYTE           18432
`define PAGE_UTIL_BYTE      16384
`define PAGE_PER_BLOCK      1152
`define BLOCK_PER_PLANE     1006
`define BLOCK_PER_LUN       2012
`define PLANE_PER_LUN       2

// Plane Address location at 48-bit Flash Address, must within 24 - 31
`define PLANE_BIT_LOC       27

// Read warmup cycle
`define RD_WARMUP       4'h0
// Program warmup cycle
`define PG_WARMUP       4'h0