`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    15:57:59 08/04/2015 
// Design Name: 
// Module Name:    control_7seg 
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
module cntrl_7seg(
    input wire [2:0] temp,
    input wire EN, clk,
    output reg [7:0] seg,
	 output reg [3:0] an
    );
							
	 localparam [2:0] estado_0 = 3'b000, 
							estado_1 = 3'b001,
							estado_2 = 3'b010,
							estado_3 = 3'b011,
							estado_4 = 3'b100;
	 
	 reg [2:0] est, est_sig;
	 
	 //----------------------------
	 always @(posedge clk)
		if (EN)
			est <= est_sig;
		else
			est <= estado_4;
	 //----------------------------
	 	 
	 always @ * 
	 begin
		est_sig = estado_0;
		an = 4'b1111;
		seg = 8'b11111111;
		case(est)
			estado_0:	begin
								an = 4'b1110;
								seg = 8'b10010000;
								est_sig = estado_1;
							end
			estado_1:	begin	
								an = 4'b1101;
								case(temp)							
									3'd0:	seg = 8'b11000000;
									3'd1:	seg = 8'b11111001;
									3'd2:	seg = 8'b10100100;
									3'd3:	seg = 8'b10110000;
									3'd4:	seg = 8'b10011001;
									3'd5:	seg = 8'b10010010;
									3'd6:	seg = 8'b10000010;
									default: seg = 8'b10001001;	//pinta una "X" si le llega codigo no deseado
								endcase
								est_sig = estado_2;
							end
			estado_2:	begin
								an = 4'b1011;
								seg = 8'b01000000;
								est_sig = estado_3;
							end
			estado_3:	begin
								an = 4'b0111;
								case(temp)							
									3'd0:	seg = 8'b11000000;
									3'd1:	seg = 8'b11111001;
									3'd2:	seg = 8'b10100100;
									3'd3:	seg = 8'b10110000;
									3'd4:	seg = 8'b10011001;
									3'd5:	seg = 8'b10010010;
									3'd6:	seg = 8'b10000010;
									default: seg = 8'b10001001;	//pinta una "X" si le llega codigo no deseado
								endcase
								est_sig = estado_0;
							end
			estado_4:	begin									//estado de apagado, para apagar los 7segmentos
								an = 4'b1111;
								seg = 8'b11111111;
							end
			default:	begin
							an = 4'b1111;
							seg = 8'b11111111;
							if(EN)
									est_sig = estado_0;
						end
		endcase
	 end	 
endmodule

