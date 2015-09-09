`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:44 08/11/2015 
// Design Name: 
// Module Name:    maq2 
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
module maq_est(
	input wire clk, temp_alta, hn, EN,
	output reg led_pelig
    );

	localparam [1:0] 	estado_0 = 2'b00, 
							estado_1 = 2'b01,
							estado_2 = 2'b10;
							
	reg [1:0] est, est_sig;
	
	always @(posedge clk)
		if (EN)
			est <= est_sig;
		else
			est <= estado_2; 
		
	always @ * 
		begin
			est_sig = estado_0;
			led_pelig = 1'b0;
			case(est)
				estado_0:	begin
									led_pelig = 1'b0;
									if(EN)
										if(hn)
											est_sig = estado_1;
										else
											est_sig = estado_0;
									else
										est_sig = estado_2;
								end				
				estado_1:	begin
									if(EN)
										if(hn&temp_alta)
											begin
												est_sig = estado_1;
												led_pelig = 1'b1;
											end	
										else
											begin
												est_sig = estado_0;
												led_pelig = 1'b0;
											end
									else
										est_sig = estado_2;
								end				
				estado_2:	led_pelig = 1'b0;
				default:		begin
									led_pelig = 1'b0;
									if(EN)
										est_sig = estado_0;
								end
			endcase
		end
endmodule
