`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:01 08/29/2015 
// Design Name: 
// Module Name:    decoII 
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
module decoII(
	input wire [2:0] temp,
	output reg temp_alta
    );

always @* 

	if(temp<=3'd2)
		temp_alta=1'b0;
	 else 
		temp_alta=1'b1;

endmodule
