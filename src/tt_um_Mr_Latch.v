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

// Definición de constantes
localparam VGND = 0;

wire Vip, Vin, Out;
wire INn, INp, INn_CMP, INp_CMP, CMP, EN, not_EN, Op, On; // Señales internas

// Lógica principal
assign Vip = ua[0];
assign Vin = ua[1];

assign ua[2] = Out;

// Operaciones lógicas
not IV1(INn, Vip);
not INV2(INn_CMP,CMP);
not IV3(INp, Vin);
not INV4(INp_CMP,CMP);

and AND1(INn_AND, INn, INn_CMP);
and AND2(INp_AND, INp, INp_CMP);

or OR1(Op, INn_AND, INp_AND);
or OR2(On, INp_AND, INp_CMP);

xor XOR1(EN, Op, On);

not IV7(not_EN, EN);
notif1 IT1(CMP, not_EN, Op);  

// Comportamiento del circuito
always @(posedge clk)
begin
    if (EN)
        Out <= Op;
    else
        Out <= 1'b0;
end

// Asignación de salidas
assign uo_out[2] = VGND;
assign uo_out[3] = VGND;
assign uo_out[4] = VGND;
assign uo_out[5] = VGND;
assign uo_out[6] = VGND;
assign uo_out[7] = VGND;

assign uio_out[0] = VGND;
assign uio_out[1] = VGND;
assign uio_out[2] = VGND;
assign uio_out[3] = VGND;
assign uio_out[4] = VGND;
assign uio_out[5] = VGND;
assign uio_out[6] = VGND;
assign uio_out[7] = VGND;

assign uio_oe[0] = VGND;
assign uio_oe[1] = VGND;
assign uio_oe[2] = VGND;
assign uio_oe[3] = VGND;
assign uio_oe[4] = VGND;
assign uio_oe[5] = VGND;
assign uio_oe[6] = VGND;
assign uio_oe[7] = VGND;

endmodule

    
endmodule
