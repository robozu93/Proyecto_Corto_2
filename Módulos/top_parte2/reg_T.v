`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:05:05 08/29/2015 
// Design Name: 
// Module Name:    reg_T 
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
module reg_T(
	input wire clk, leer, EN,
	input wire [2:0] dato,
	output reg [2:0] temp
    );

always @(posedge clk, negedge EN)
		if(~EN)
			temp <= 3'b000;
		else
			begin
				if(leer)
					temp <= dato;
				else
					temp <= temp;
			end
			
endmodule
