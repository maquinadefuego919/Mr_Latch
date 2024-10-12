/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Mr_Latch (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
//    input  wire       VAPWR,    // 3.3v power supply
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire  In, Out;

    assign In= ua[0];
assign Out=ua[1] ;

    buf Buf1(In,Out);

    assign ua[5:2] = 4'b0000;
    //assign uo_out[7:1] = 7'b0000000; 
    assign ui_in[7:0] = 8'b00000000;



  //assign uio_out = 0;
   // assign uio_oe  = 0;
    //assign uio_in =0
  // List all unused inputs to prevent warnings
wire _unused = &{ena, clk, rst_n, 1'b0};

    
endmodule
