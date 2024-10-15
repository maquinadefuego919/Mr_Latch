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

wire opamp_nonlinear(in_p,in_n, out_p,out_n,vcm_out);
voltage in_p, in_n,out_p,out_n,vcm_out;
parameter real Rin = 50 from (0:inf];
parameter real Rout = 50 from (0:inf];
parameter real Gp_dB = 10 from [-100:100];
parameter real a2 = 0 from [0:inf];
parameter real IP1dB =0 from [-100:100];
real Gp=4*(10**(Gp_dB/10)); // The factor 4 is to account for the power loss in the input and output impedances.
real a1=((Gp*Rout)/Rin)**0.5;
real IP1dB_magnitude=(10**(IP1dB/10))*1e-3;
real Vin1dBc=(2*Rin* IP1dB_magnitude)**0.5;
real a3=(4*0.109*a1)/(3*(Vin1dBc**2));
analog begin
    V(out_p,vcm_out)<+ 0.5*(a1*V(in_p,in_n)+a2*(V(in_p,in_n)**2)-a3*(V(in_p,in_n)**3));
    V(out_n,vcm_out)<+ -0.5*(a1*V(in_p,in_n)+a2*(V(in_p,in_n)**2)-a3*(V(in_p,in_n)**3));
end

    
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
