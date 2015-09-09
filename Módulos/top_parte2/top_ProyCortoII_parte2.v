`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:59:46 08/29/2015 
// Design Name: 
// Module Name:    top_ProyCortoII_parte2 
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
module top_ProyCortoII_parte2(
	input wire [7:0] tecla,
	input wire clk, reset,
	output wire [7:0] seg7,
	output wire [3:0] an7,
	output wire led_pel
   );


wire leerPres, leerT, est_temp, bandPres, on, nfrec;
wire [2:0] dato_reg, bandT;

div_frec div_clk (
    .clk(clk), 	//--
    .reset(reset), //--
    .s_clk(nfrec)	//--
    );

cntrl_7seg control_7seg (
    .temp(bandT), 	//--
    .EN(on), 			//--
    .clk(nfrec), 	//--
    .seg(seg7), 	//--
    .an(an7)		//--
    );

decoII estado_temp (
    .temp(bandT), 			//--
    .temp_alta(est_temp)		//--
    );

control_maq cntrl_maq (
    .clk(clk), 
    .tecla(tecla), 
    .rPres(leerPres), 
    .rT(leerT), 
    .EN(on), 
    .hx_tecla(dato_reg)
    );
	 
maq_est cntrl_peligro (
    .clk(clk), 	//---
    .temp_alta(est_temp), //--
    .hn(bandPres), 		//-- 	//--
    .EN(on), 			//--
    .led_pelig(led_pel)		//--
    );
	 
reg_P registro_P (
    .clk(clk), 	//--
    .leer(leerPres), //--
	 .EN(on),
    .dato(dato_reg), //--
    .band(bandPres)		//--
    );
	 
reg_T registro_T (
    .clk(clk), //--
    .leer(leerT), //--
	 .EN(on),
    .dato(dato_reg), //--
    .temp(bandT)		//--
    );
endmodule
