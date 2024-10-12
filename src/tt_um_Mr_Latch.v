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

wire Qn, Qn, S, R;

assign ui_in[0]= S;
assign ui_in[1]= R;

assign uo_out[0]= Q;
assign uo_out[1]= Qn;

//assign ua[5:3] = 3'b000;
    assign uo_out[7:1] = 7'b0000000; 
    assign ui_in[7:2] = 6'b000000;
    
wire Out_Q, Out_Qn;

nor NOR1(Out_Q, S, Out_Qn);
nor NOR2(Out_Qn, R, Out_Q);



    
endmodule
