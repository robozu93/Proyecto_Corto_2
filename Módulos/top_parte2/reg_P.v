`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:30:39 08/29/2015 
// Design Name: 
// Module Name:    reg_P 
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
module reg_P(
	input wire clk, leer, EN,
	input wire [2:0] dato,
	output reg band
    );
	 	 
always @(posedge clk, negedge EN)
		if(~EN)
			band <= 1'b0;
		else
			begin
				if(leer)
					if(dato == 3'd1)
						band <= 1'b1;
					else
						band <= 1'b0;
				else
					band <= band;
			end
			
endmodule
