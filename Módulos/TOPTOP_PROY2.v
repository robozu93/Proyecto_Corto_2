`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:01 09/02/2015 
// Design Name: 
// Module Name:    TOPTOP_PROY2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TOPTOP_PROY2(
	input wire clk, rst, ps2d, ps2c,
	output wire [7:0] seg,
	output wire [3:0] an,
	output wire led, n, rt
    );

wire [7:0] tecla;
wire nfrec, r;

assign r = rst;

top_ProyCortoII_parte2 parte2 (
    .tecla(tecla), 
    .clk(clk),
	 .reset(r),
    .seg7(seg), 
    .an7(an), 
    .led_pel(led)
    );
	 
code_kb parte1 (
    .clk(clk), 
    .reset(r), 
    .ps2d(ps2d), 
    .ps2c(ps2c), 
    .dataout(tecla), 
    .nada(n), 
    .rx_tick(rt)
    );
	 
/*div_frec div_clk (
    .clk(clk), 	//--
    .reset(r), //--
    .s_clk(nfrec)	//--
    );*/

endmodule
